## Concept

- **Docker Compose** is a tool provided by Docker that allows you to define and manage **multi-container applications** using a single YAML configuration file, eliminating the need to run separate commands for networks, volumes, and containers. 
- **CI/CD Pipeline** (Continuous Integration / Continuous Delivery) is an automated sequence of tasks arranged in a logical order — testing, quality analysis, building, and deploying — triggered whenever a developer pushes code changes. 
- **Jenkins** is an open-source automation server written in Java that implements CI/CD pipelines; it is plugin-based, highly extensible, and supports integration with Docker, GitHub, Kubernetes, Ansible, AWS, and more. 
- **Multi-node Jenkins Architecture** separates the **master node** (brain/controller — handles job management, plugin installation, configuration) from **worker nodes** (agents — handle actual job execution), preventing resource exhaustion on the master. 
- **SonarQube** is a code quality and security analysis tool that inspects source code, Dockerfiles, and scripts for bugs, security vulnerabilities, readability issues, and optimization opportunities. 

---

### Docker Compose — WordPress Practical

- A full-stack **WordPress application** was deployed using Docker Compose with two containers: one running the **WordPress image** (frontend + backend) and one running **MySQL 8** (database). 
- Both containers were placed on the same custom **bridge network** (`GFG Network`) so they could communicate by container name (hostname) rather than IP address, since container IPs are dynamic and change on restart. 
- **Environment variables** injected at runtime configured the MySQL root password, database name, user, and password — and the WordPress container used those exact same values to connect to the database. 
- **Two volumes** were mounted: `db_volume` mapped to MySQL's data directory (`/var/lib/mysql`) to persist schema and table data, and `wordpress_volume` mapped to `/var/www/html` to persist raw files like images, CSS, and HTML. 
- WordPress raw media (e.g., uploaded images like a lion JPEG) is stored in `/var/www/html/wp-content/uploads/` inside the container (and thus in the volume), while metadata such as post content, comments, and user records is stored in MySQL tables. 
- **Port mapping** was done only for WordPress (`host:80 → container:80`); MySQL was intentionally **not exposed** to the outside world, keeping it accessible only within the Docker network. 
- The `docker compose up -d` command pulled both images, created the network and volumes, and launched both containers in detached mode in a single step. 
- Docker logs can be inspected at any time with `docker logs <container_id>`, and you can enter a running container's shell with `docker exec -it <id> bash` to run SQL queries or inspect file structure directly. 
- MySQL tables (e.g., `wp_users`, `wp_comments`, `wp_posts`, `wp_postmeta`) are **automatically created** when WordPress first connects to the database — WordPress manages its own schema. 

### Private Registries and Image Management

- When application Docker images contain proprietary source code, they must **not** be pushed to Docker Hub (public); instead, a **private registry** is used (e.g., AWS ECR — Elastic Container Registry). 
- The `docker login` command accepts a host parameter; without it, it defaults to `hub.docker.com`. For a private registry, the host URL is explicitly provided. 
- Commands for private registries are identical to public ones (`docker build`, `docker tag`, `docker push`) — only the registry host changes. 
- A future practical will cover pushing images to **AWS ECR** and launching containers via **ECS/EKS**, to be covered after the Kubernetes section. 

### Image Versioning and Rollback with Docker Compose

- Every time application code changes and an image is rebuilt, a **new tag** should be assigned (e.g., `v1`, `v2`, `3147`) rather than overwriting the existing tag. 
- To update a running application, change the image tag in the `docker-compose.yaml` file and re-run `docker compose up -d`; Docker Compose detects which services changed and only recreates those. 
- If a new version introduces bugs, **rollback** is achieved by reverting the tag in the Compose file back to the previous version and re-running the command. 
- Docker Compose is suited for **development and small-scale single-server deployments**; for production environments with scaling, rolling updates, and secret management at scale, **Kubernetes is the recommended tool**. 

### Flask Application and Dockerfile

- A sample **Flask (Python)** application was used with two endpoints: `/` returning a greeting string and `/test` returning a test value. 
- The `requirements.txt` file lists Python dependencies: `Flask`, `pytest`, `pytest-coverage`, `flake8`, and `werkzeug`. 
- The Dockerfile uses **Amazon Linux** as base, copies all files (noted as a non-optimal practice), installs Python 3, pip3, and dependencies from `requirements.txt`, exposes port 80, and runs `python3 app.py` at container start. 
- This Dockerfile intentionally contains **quality issues** (installing packages in multiple steps instead of one, copying unnecessary files) so that SonarQube can detect and flag them in a later lesson. 

### CI/CD Pipeline Concept

- The pipeline consists of logically ordered steps: **push to GitHub → run unit tests → quality check (SonarQube) → build Docker image → deploy container → monitor**. 
- Steps 1–4 (test, quality, build) are called **Continuous Integration (CI)**; steps 5+ (deploy) are called **Continuous Delivery/Deployment (CD)**. 
- If any step fails, the pipeline is broken and subsequent steps do not execute — analogous to a broken water pipe. 
- SonarQube assigns severity levels to issues: **critical/blocker issues** fail the pipeline (red signal); **low/medium priority** issues generate warnings but allow the pipeline to continue. 

### Jenkins Setup

- Jenkins was launched using its **official Docker image** (`jenkins/jenkins:lts-jdk21`), which has Java JDK 21 pre-installed — no manual Java installation needed on the host. 
- Port `8080` exposes the Jenkins web UI; port `50000` is reserved for **agent-to-master communication** (used when worker nodes connect). 
- A **volume mount** (`jenkins_home`) ensures Jenkins configuration, job metadata, and plugin data persist even if the container is restarted or recreated. 
- On first access, Jenkins requires an **initial admin password** found at `/var/jenkins_home/secrets/initialAdminPassword` inside the container (also printed in startup logs). 
- During setup, **"Install Suggested Plugins"** was selected, which installs community-recommended plugins including Git, GitHub, SSH, and dark theme support. 

### Jenkins Jobs

- A **Job** in Jenkins is an individual task unit; a pipeline is multiple jobs connected in logical sequence. 
- Jobs are configured via the web UI with options for source code management, build triggers, and build steps (e.g., **Execute Shell** to run arbitrary shell commands). 
- Jobs run on whichever node is available by default; using **"Restrict where this project can run"** with a label forces the job to execute only on nodes matching that label. 
- Build history shows success/failure status, duration, and timestamp; **Console Output** shows the full log of every command executed during the build. 

### Multi-Node Architecture

- The **master node** (controller) is responsible for: plugin management, user account management, job creation and configuration, and job scheduling/distribution. 
- **Worker nodes** (agents) are responsible for actual job execution; they register with the master and listen for instructions. 
- Each worker runs a **Java-based agent program** (`agent.jar`) downloaded from the master and started with `java -jar agent.jar` along with a secret token, master URL, and working directory. 
- The agent program must be run with the `&` symbol (background process) so the terminal remains usable; stopping the agent disconnects the worker from the master. 
- **Labels** assigned to worker nodes (e.g., `mid-cpu`, `high-power`) allow jobs to be scheduled on specific workers based on resource requirements. 
- Multiple workers can share the same label; Jenkins master distributes jobs among all workers carrying the required label based on availability. 
- The **number of executors** per worker controls how many jobs run in parallel on that node (default: 1). 

### Jenkins + GitHub Integration

- In the job configuration, selecting **Git** as the Source Code Manager and providing the repository URL causes Jenkins to automatically clone the repository before executing build steps. 
- For **public repositories**, no credentials are needed; for **private repositories**, credentials must be added to Jenkins' secure credential store. 
- The branch to clone is explicitly specified (e.g., `main`). 
- **Git must be installed on the worker node** where the job runs; if absent, the clone step fails with a "git not found" error. 
- After cloning, the repository files appear in the worker's workspace directory (e.g., `/data/workspace/job1/`) and are also visible in the Jenkins web UI under the job's **Workspace** tab. 

### Unit Test Execution in Jenkins

- The build step installs `python3-pip` via `yum`, then runs `pip3 install -r requirements.txt` to install all Python dependencies on the worker. 
- The `pytest` command executes `testapp.py`, which contains two test cases: one verifying the `/` endpoint returns HTTP 200 and the expected string, one verifying the `/test` endpoint similarly. 
- If the application code is modified in a way that breaks expected output (e.g., changing the return value of `/`), the test case **assertion fails**, the job is marked failed, and the pipeline stops. 
- When the developer corrects the code and pushes again, re-triggering the job results in a passing build. 
- Jenkins displays **build stability metrics** — e.g., "2 out of last 5 builds failed" = 60% success rate — giving a quick health overview. 

### Secrets and Credential Management

- Hardcoding credentials in `docker-compose.yaml` is acknowledged as **not production-safe**; better approaches include: 
    - **Cloud secret managers** (e.g., AWS Secrets Manager) — credentials stored centrally, retrieved dynamically via API calls at runtime. 
    - **Linux environment variables** — credentials stored as shell variables, referenced in the Compose file instead of hardcoded; must be re-created each session. 
    - **Kubernetes Secrets** — the recommended production approach, to be covered in the Kubernetes section. 

---

### Why Two Ports for Jenkins (8080 and 50000)?

- Port **8080** is for the Jenkins web UI — this is what you access in your browser to manage jobs, view logs, configure plugins, etc. 
- Port **50000** is specifically for the **JNLP agent protocol** — when a worker node runs `agent.jar` and connects back to the master, it uses this port. Without exposing it, worker nodes cannot register. 
- In the practical, the agent connected using **WebSocket** (`-webSocket` flag in the command), which routes through port 8080 instead of 50000, which is why the connection worked even though this wasn't deeply explained. 

### Why Did YUM Fail Inside the Jenkins Container?

- The Jenkins Docker image is based on **Debian/Ubuntu**, not Red Hat/Amazon Linux. YUM is a Red Hat package manager and does not exist on Ubuntu-based systems — `apt` is the correct tool there. 
- This is precisely why the **multi-node architecture** is valuable: you can configure worker nodes using **Amazon Linux EC2 instances** that have YUM pre-installed, and direct jobs that require YUM to those workers via labels. 

### What Exactly Does the Agent JAR Do?

- `agent.jar` is a lightweight Java program that runs on the worker node and maintains a persistent connection to the Jenkins master. 
- It authenticates using a **secret token** generated by the master (visible in the worker configuration page), ensuring only authorized workers can connect. 
- Once connected, it receives job execution instructions from the master, runs the defined shell commands locally on the worker, and streams logs back to the master for display in the web UI. 
- Running it in the **background** (`java -jar agent.jar ... &`) is necessary so the terminal is not blocked; you can verify it's running with `ps -aux | grep java`. 

### What Is the Difference Between CI and CD?

- **CI (Continuous Integration)** covers everything up to making the application *ready* for deployment: pulling code, running tests, checking quality, building the Docker image. No actual deployment happens here. 
- **CD (Continuous Delivery/Deployment)** covers the deployment steps: running the container, deploying to cloud environments (dev, staging, production), and monitoring. 
- The distinction matters because you might want CI to run on every commit but CD to run only on approved merges to the main branch — they can be triggered differently. 

### How Does SonarQube Decide to Fail or Pass?

- SonarQube uses **Quality Gates** — configurable thresholds that define what constitutes a passing or failing analysis. 
- Issues are classified by severity: **Blocker → Critical → Major → Minor → Info**. Blockers and Critical issues typically cause a Quality Gate failure (red signal), while Minor/Info issues generate warnings but allow the pipeline to proceed. 
- In the Flask Dockerfile example, the issues (running three separate `RUN` commands instead of one, copying unnecessary files) are **optimization/maintainability** issues, not security blockers, so SonarQube would flag them but likely not block the pipeline. 

---


- **Docker Compose** **`up -d`** **vs** **`up`****:** `-d` runs in detached (background) mode; without it, logs stream to the terminal and the process blocks the shell. 
- **Docker Compose** **`ps`** **vs** **`docker ps`****:** `docker compose ps` shows only containers created by the current Compose file; `docker ps` shows all running containers on the host. 
- **Volume persistence logic:** Data in a container is lost when the container is deleted. Volumes persist on the Docker host. For full durability, volumes should be stored externally (e.g., cloud storage or managed DB), not just on the Docker host. 
- **Bridge network isolation:** Containers on different bridge networks cannot communicate with each other by default — this provides network isolation between applications sharing a Docker host. 
- **Container hostname vs IP:** Always use **container names (hostnames)** for inter-container communication in Docker Compose, not IP addresses, because IPs are dynamic and change on container restart. 
- **Jenkins master responsibilities:** Plugin management, user management, job configuration, job scheduling, credential storage — NOT job execution. 
- **Jenkins worker responsibilities:** Job execution only. Workers must have required tools installed (Git, Java, Python, YUM, etc.) for the jobs they run. 
- **Label-based scheduling:** Jobs can be restricted to specific workers using labels defined during worker node creation. Multiple workers can share a label for load distribution. 
- **`agent.jar`** **requires Java on the worker:** Since Jenkins is Java-based, the agent program is a JAR file and requires Java JDK to be installed on the worker node. 
- **`&`** **symbol in Linux:** Appending `&` to any command runs it in the background, freeing the terminal. Used to keep the Jenkins agent running without blocking the shell. 
- **CI steps (in order):** Code push → Clone from GitHub → Unit tests → Quality check (SonarQube) → Docker build. 
- **CD steps (in order):** Docker run (container deployment) → Environment promotion (dev → staging → prod) → Monitoring. 
- **SonarQube severity levels:** Blocker/Critical = pipeline fails; Major/Minor/Info = warnings only, pipeline continues. 
- **Docker Compose is NOT recommended for production** at scale — use Kubernetes for rolling updates, autoscaling, secret management, and rollback in production environments. 
- **`pytest`** **command:** Executes Python unit test files; if any assertion fails, the exit code is non-zero, causing the Jenkins job to be marked as failed. 
- **`pip3 install -r requirements.txt`****:** Installs all Python dependencies listed in the file; must be run after cloning the repository and before running tests or the application. 
