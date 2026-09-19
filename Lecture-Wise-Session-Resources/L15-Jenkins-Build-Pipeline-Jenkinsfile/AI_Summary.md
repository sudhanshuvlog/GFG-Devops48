## Concept

- **CI/CD (Continuous Integration / Continuous Deployment)** is the practice of automating the steps between a developer pushing code and that code being deployed to production. 
- **Jenkins** is an open-source automation server written in Java that orchestrates CI/CD pipelines; because it is Java-based, the host system must have **Java JDK** installed to run it. 
- A **Jenkins cluster** consists of a **master node** (the management brain: UI, job creation, plugin management, scheduling) and one or more **worker nodes** (where jobs actually execute), connected via an **agent program** running on each worker. 
- **Pipeline-as-Code** is the practice of defining the entire pipeline in a script file (a **Jenkinsfile**) committed to source control, rather than configuring jobs manually through the UI. 
- **Plugins** extend Jenkins' core functionality — integrations with GitHub, Docker, SonarQube, Kubernetes, AI tools, email, and even UI themes are all delivered as installable plugins. 

---


### Jenkins Architecture and Setup

- Two EC2 instances were launched on AWS (type **t2.medium**, 4 GB RAM, 2-core CPU, Amazon Linux, 8 GB storage): one designated **Jenkins Master**, the other **Jenkins Worker 1**. 
- **Jenkins Master** was run as a **Docker container** (not installed directly on the OS), using the official `jenkins/jenkins` Docker image pulled from Docker Hub. 
    - The container was started with: detach mode (`-d`), a named container (`jenkins`), port mapping `8080:8080` (web UI) and `50000:50000` (agent communication), a restart policy (`--restart=on-failure`), and a Docker volume (`jenkins_home`) mounted to persist all configuration data. 
    - Initial admin password is stored inside the container at a specific path and retrieved via `docker exec` + `cat`. 
- **Suggested plugins** were installed at first-time setup (includes Git, GitHub integration, email extension, dark theme, etc.); additional plugins can be installed, disabled, or updated at any time from the **Manage Jenkins → Plugins** page. 
- A secondary user account can be created from **Manage Jenkins → Users → Create User**. 

### Worker Node Configuration (Manual / Agent-Based)

- On the **worker EC2 instance**, the following steps were performed manually: 
    1. Download and install **Java JDK 21** (via `wget` + `yum install`) — required to run the agent JAR.
    2. Download `agent.jar` from the Jenkins master using `curl`.
    3. Run the agent program in the background (`java -jar agent.jar ... &`).
- The worker node was registered in Jenkins via **Manage Jenkins → Nodes → New Node**, with: 
    - A **workspace path** (e.g., `/data`) where all job data is stored on the worker.
    - A **label** (e.g., `low CPU`) used to target specific jobs to specific workers.
    - **Launch method**: "Connect agent to controller manually" (manual approach; SSH-based auto-configuration is a future improvement). 
    - **Availability**: "Keep this agent online as much as possible."
    - **Disk space thresholds**: minimum free disk (e.g., 1 GB) below which the agent is marked offline; warning thresholds configurable separately. 
- The agent runs as **root user** in this demo, granting it full privileges (install packages, run Docker, etc.); in production, a **non-root secondary user** should be used to limit blast radius. 
- Future improvement: run the **worker agent itself inside a Docker container**, and use **SSH-based auto-configuration** so Jenkins master automatically provisions workers — enabling dynamic scaling. 

### Creating and Running Jobs

- A **Freestyle Project** job was created with:
    - **Source Code Management**: Git repository URL + branch (`main`); credentials required only for private repos. 
    - **Restrict where project can be run**: label expression `low CPU` to force execution on the worker, not master. 
    - **Build Steps → Execute Shell**: series of shell commands (install Python, pip install dependencies, run pytest, run flake8). 
- Jobs run in **isolated workspaces** by default — each job has its own directory on the worker (e.g., `/data/workspace/job1`, `/data/workspace/job2`), so code cloned in Job 1 is not automatically available to Job 2. 

### Application Being Deployed

- A **Python Flask application** (`app.py`) serves a single route returning static text; **`requirements.txt`** lists dependencies (`flask`, `pytest`, `flake8`); **`test.py`** validates the HTTP response code (200) and expected text content. 
- **Flake8** enforces Python **PEP 8 coding standards** — line length ≤ 79 characters, proper spacing between functions, correct indentation, etc. A job step runs `flake8` to catch readability violations before building. 
    - Deliberately introduced bad code (extra spaces, lines > 131 characters, missing blank lines) caused the flake8 step to fail with specific error messages, demonstrating its value. 

### Dockerfile Best Practices Demonstrated

- Base image: `python:3.11-slim` (Python pre-installed, no need to install it separately). 
- Only **necessary files** are copied (`requirements.txt` and `app.py`), not the entire repo (avoids copying test files, README, etc. into the production image). 
- **Security hardening**: a non-root group (`gfg`) and user (`pythongfg`) are created; ownership of the app directory is changed to this user via `chown`; the `USER` instruction switches to the non-root user **before** the final `CMD`. 
    - All installation steps (pip install, package setup) run as root; only the application process (`CMD`) runs as the non-root user.
- **Layer optimization**: multiple shell commands are chained with `&&` and line continuations (`\`) inside a single `RUN` instruction to minimize image layers and keep image size small. 

### Three-Job Pipeline (Manual Build Pipeline)

- **Job 1**: Clone repo → install pip3 → `pip3 install -r requirements.txt` → `pytest` → `flake8`. 
- **Job 2**: Clone repo again (isolated workspace) → `yum install docker -y` → `systemctl start docker` → `docker build -t webapp_image .` 
- **Job 3**: `docker rm -f web_server` (remove old container) → `docker run -dit --name web_server -p 80:80 webapp_image`. 
- The running container is on the **worker node**; accessing the worker's public IP on port 80 serves the Flask app. 

### Triggering Strategies

Three trigger mechanisms were demonstrated and compared: 

1. **Build Periodically** — cron-style schedule (e.g., `* * * * *` = every minute); job runs unconditionally on schedule regardless of whether code changed. Good for backup/scheduled tasks; **wastes compute** if no code changes occurred. 
2. **Poll SCM** — same cron schedule, but Jenkins first checks GitHub's latest **commit ID** against the local workspace commit ID; only triggers a build if there is a **delta** (new commit). More efficient than Build Periodically, but Jenkins still has to poll GitHub on every schedule tick. 
3. **GitHub Webhook** (recommended) — GitHub is configured to call a Jenkins endpoint (`/github-webhook/`) on every push event; Jenkins job is triggered **immediately** when code is pushed, with no polling delay and no wasted compute. 
    - Configured in GitHub repo **Settings → Webhooks → Add webhook**; payload URL = `http://<jenkins-ip>:8080/github-webhook/`; trigger event = "push."

### Connecting Jobs into a Pipeline (Upstream/Downstream)

- Jobs were linked using **Build after other projects are built** trigger in each downstream job's configuration. 
    - Job 2 watches Job 1: triggers **only if Job 1 is stable** (successful).
    - Job 3 watches Job 2: triggers only if Job 2 is stable.
- This creates an **upstream/downstream chain**: Job 1 → Job 2 → Job 3, forming a true pipeline. 
- If Job 1 fails (e.g., test case mismatch), Job 2 and Job 3 are **not triggered**, preventing a broken image from being built or deployed. 
- Other trigger options exist: "trigger even if unstable," "trigger even if failed," "always trigger" — useful when jobs are independent or when logging must occur regardless of upstream status. 

### Build Pipeline Plugin (Visualization)

- The **Build Pipeline Plugin** was installed from **Manage Jenkins → Available Plugins** to provide a unified dashboard view. 
- A new **view** was created (type: Build Pipeline View), specifying Job 1 as the initial job and showing the last 5 builds. 
- The view renders jobs in a **visual pipeline**: green = successful, red = failed, blue = not yet executed. 
- Logs for individual builds can be viewed directly from this single dashboard without navigating to each job separately. 

### Pipeline-as-Code (Jenkinsfile / Groovy Declarative Syntax)

- A new item of type **Pipeline** was created (distinct from Freestyle Project). 
- Pipeline script uses **Groovy declarative syntax**: `pipeline { agent { label 'low CPU' } stages { stage('...') { steps { ... } } } }`. 
- **Pipeline Syntax helper** (snippet generator) is available within Jenkins to auto-generate Groovy snippets for common steps (e.g., `git branch: 'main', url: '...'` for cloning). 
- For shell commands without a dedicated declarative step, `sh '...'` is used to run arbitrary shell commands. 
- The five-stage pipeline created in Groovy: 
    1. **Clone Git Repo** — `git` step
    2. **Install pip3** — `sh 'yum install python3 -y'`
    3. **Unit Test Cases & Lint Check** — `sh 'pip3 install -r requirements.txt'` + `sh 'pytest'` + `sh 'flake8'`
    4. **Build Docker Image** — `sh 'yum install docker -y'` + `sh 'systemctl start docker'` + `sh 'docker build -t gfg48_python_flask_app .'`
    5. **Deploy Application** — `sh 'docker rm -f web_server'` + `sh 'docker run ...'`
- **Best practice**: store the Jenkinsfile in the **GitHub repository root** and configure the pipeline to use **"Pipeline script from SCM"** — Jenkins automatically pulls and executes the latest Jenkinsfile on each run, so pipeline changes are version-controlled and don't require manual UI edits. 
    - Demonstrated live: adding a new "Deployment Completed" stage to the Jenkinsfile, pushing to GitHub, and triggering the pipeline — the new stage appeared automatically without any Jenkins UI change. 
- **Triggers for Pipeline jobs**: same options (Poll SCM, Build Periodically, GitHub Webhook) are available in the pipeline job's **Configure → Triggers** section, identical to Freestyle jobs. 

---



### SSH-Based Worker Auto-Configuration

- The manual worker setup (download JDK, download agent.jar, run manually) is tedious and error-prone at scale. The **"Launch agent via SSH"** method (mentioned but deferred) allows Jenkins master to SSH into the worker, automatically install the agent, and start it — enabling fully automated, dynamic worker provisioning. 
- This is the foundation for **auto-scaling**: as job load increases, Jenkins can automatically spin up new worker instances, configure them via SSH, and schedule jobs there — all without manual intervention.

### Worker Agent in a Container

- Currently the worker agent runs directly on the EC2 OS. In production, **the agent itself runs inside a Docker container** on the worker node. 
- This is more advanced because it requires understanding Docker networking, volume mounts for the workspace, and Docker-in-Docker (DinD) considerations when the job itself needs to run Docker commands.

### Disk Space Thresholds

- The **free disk space threshold** (default 1 GB) marks a worker **offline** if disk falls below it, preventing job scheduling to an unhealthy node. 
- The **warning threshold** (e.g., 2 GB) triggers a visible alert in the Jenkins UI so admins can proactively add storage or scale out workers before the node goes offline. 

### Groovy Declarative vs. Scripted Pipeline

- The class used **declarative Groovy** (structured, opinionated, easier to read). Jenkins also supports **scripted Groovy** (imperative, more flexible, full Groovy language access) — the distinction matters when you need complex conditional logic or loops not easily expressed declaratively.
- The **Pipeline Syntax snippet generator** is the key tool to bridge the gap: if you don't know the Groovy syntax for a step, use the generator to produce it. 

### Trigger Strategy Inside the Groovy Script

- A student asked whether triggers can be defined **inside** the Groovy script itself (not just in the UI Configure page). The answer: yes, Jenkins Declarative Pipeline supports a `triggers { }` block inside the `pipeline { }` definition (e.g., `triggers { pollSCM('* * * * *') }` or `triggers { githubPush() }`). This is common in other CI/CD tools (GitHub Actions, GitLab CI) and is the more portable approach since the trigger config travels with the code. 

### Container Downtime During Redeployment

- The current Job 3 approach (`docker rm -f` then `docker run`) causes **brief downtime** between container deletion and recreation. 
- Production solutions include: **blue-green deployment**, **rolling updates** (Kubernetes), or using Docker Compose with health checks. These were flagged as future topics.

### Jenkins Master High Availability

- If the Jenkins master container crashes, Docker's `--restart=on-failure` policy automatically restarts it with the same volume mounted, preserving all data. 
- If restart repeatedly fails, manual intervention is needed: delete the broken container, create a new one mounting the same `jenkins_home` volume. 
- For **load distribution across multiple master replicas**, Kubernetes is the recommended solution — Docker alone requires manual replica creation. 

---


- **Jenkins must have Java JDK** installed on both master and worker nodes — master to run the Jenkins server, worker to run the agent JAR. 
- **Master vs. Worker responsibility**: master = management (UI, scheduling, plugins, job config); worker = execution (runs actual job commands via agent). 
- **Agent runs as root in this demo** → all commands have full privileges; in production, use a non-root user for the agent to limit security exposure. 
- **Isolated workspaces per job**: Job 2 cannot access Job 1's cloned files by default — each job clones the repo independently into its own workspace directory. 
- **Trigger comparison** (likely exam topic):
    - Build Periodically → always runs on schedule, wastes compute if no changes 
    - Poll SCM → checks commit ID delta before running, more efficient but still polls 
    - GitHub Webhook → push-triggered, most efficient, zero polling overhead 
- **Labels on worker nodes** control job scheduling: a job with label restriction `high CPU` will only run on workers tagged `high CPU`; without a label restriction, Jenkins picks any available worker. 
- **Upstream/Downstream triggers**: "trigger only if stable" = job runs only when upstream succeeds; "trigger even if failed" = jobs are independent of upstream result. 
- **Flake8 enforces PEP 8**: line length ≤ 79 characters, 2 blank lines after function definitions, no extra whitespace — violations cause the job to fail. 
- **Dockerfile security pattern**: create non-root group + user → install dependencies as root → `chown` app directory to non-root user → `USER` instruction → `CMD` runs as non-root. 
- **Single** **`RUN`** **instruction with** **`&&`** reduces Docker image layers vs. multiple `RUN` instructions. 
- **Jenkinsfile from SCM** is preferred over pasting script in UI: version-controlled, shareable, auto-applied on next pipeline run. 
- **Build Pipeline Plugin** provides visual upstream/downstream pipeline view; color coding: green = success, red = failed, blue = not yet run. 
- **Jenkins plugin types**: suggested plugins installed at setup; additional plugins (Docker, Kubernetes, SonarQube, AI, dark theme, email extension) installed on demand; plugins can be disabled/updated without full reinstall. 
- **`docker rm -f <name>`** **before** **`docker run`** is required when redeploying to avoid "container name already in use" error. 
- **Groovy declarative pipeline structure**: `pipeline → agent → stages → stage → steps → sh '...'` or declarative step (e.g., `git`). 
- **Pipeline Syntax snippet generator** auto-generates Groovy code from UI selections — key tool for writing Jenkinsfiles without memorizing syntax. 
