## Concept

- **CI/CD Pipeline** is a methodology for continuously integrating and deploying code changes automatically, eliminating manual intervention between code push and deployment. 
- **GitHub Actions** is a native CI/CD tool built into GitHub that removes the need to self-manage a CI server (like Jenkins); GitHub manages the master node and optionally the worker nodes (called **runners**) on your behalf. 
- **Workflow** is the GitHub Actions equivalent of a Jenkins file — a YAML-based pipeline-as-code script stored in `.github/workflows/` within the repository. 
- **SonarQube** is a **static code analysis** tool that scans source code for bugs, vulnerabilities, security issues, code duplication, and maintainability problems — distinct from unit tests, which validate algorithm correctness. 
- **Code Coverage** measures what percentage of your application's source lines are actually executed when your test suite runs; higher coverage means bugs are more likely to be caught early. 
- **Quality Profile** in SonarQube is a named collection of rules applied during a scan; you can create custom profiles to enforce only the rules relevant to your organization. 
- **Quality Gate** is SonarQube's pass/fail verdict for a scan, based on configurable thresholds (e.g., zero new issues, ≥80% coverage, <3% duplication). 

---


### Jenkins vs. GitHub Actions — Key Differences

- **Jenkins** is open-source and highly customizable but requires significant manual setup: provision a VM, install Docker, install Jenkins, configure a master node, add worker/agent nodes, set up webhooks, and manage security groups. 
- **GitHub Actions** abstracts all infrastructure: GitHub manages the master; workers (**GitHub-hosted runners**) are provisioned on demand when a pipeline triggers and destroyed when it finishes — you only pay for actual runtime. 
- Both support **pipeline-as-code**, but Jenkins uses **Groovy** syntax (Jenkinsfile), while GitHub Actions uses **YAML** (workflow files). 
- Key terminology mapping:
    - Jenkins *stage* → GitHub Actions *job*
    - Jenkins *steps* → GitHub Actions *steps*
    - Jenkins *Jenkinsfile* → GitHub Actions *workflow file* 
- GitHub Actions has a large marketplace of pre-built **Actions** (reusable units of code) for common tasks like checking out a repo, setting up Python, or running SonarQube scans — reducing the need to write raw shell commands. 

### GitHub Actions Workflow Structure

- The workflow file lives at `.github/workflows/<name>.yml` in the repository. 
- **Trigger block (****`on:`****)** defines when the pipeline fires; two common triggers are `push` (to main) and `pull_request` (targeting main) — these are OR conditions, not AND. 
- **`jobs:`** block contains all jobs; by default, jobs run **in parallel** unless dependencies are declared with the `needs:` keyword. 
- Each job specifies a **runner image** (e.g., `ubuntu-latest`) — only GitHub-supported images are valid for hosted runners; self-hosted runners are also an option. 
- **`steps:`** within a job are sequential tasks; each step either calls a pre-built `uses: action@version` or runs a shell command via `run:`. 

### The Python Flask Pipeline Built in Class

The pipeline demonstrated had two jobs:

**Job 1 — Build and Test:**

1. Checkout repository (`actions/checkout@v4`) 
2. Set up Python using `actions/setup-python` — supports a **matrix strategy** to test across multiple Python versions (3.9, 3.10, 3.11) simultaneously 
3. Install dependencies: upgrade pip, install `flake8` and `pytest`, then install from `requirements.txt` if present 
4. Run **lint check** with `flake8` (validates code style, spacing, line length — configurable with `--max-line-length` and specific rule codes like F821, F7, F63) 
5. Run **unit tests** with `pytest` 

**Job 2 — SonarQube Scanner:**

1. Checkout repository again (necessary because each job gets a fresh, ephemeral worker) 
2. Run `SonarSource/sonarqube-scan-action` to scan the codebase 
3. Optionally check the **SonarQube Quality Gate** result and fail the job if the gate is red 

### Ephemeral Workers and Artifact Passing

- Each job runs on a **newly provisioned worker** that is destroyed after the job completes — data does not persist between jobs. 
- To pass the `coverage.xml` file from Job 1 to Job 2, you must:
    1. Upload it as an **artifact** using `actions/upload-artifact@v4` at the end of Job 1 
    2. Download it using `actions/download-artifact@v8` at the start of Job 2 
- This pattern also applies to compiled artifacts (e.g., JAR files for Java, EXE for C++) that downstream jobs need for deployment. 

### SonarQube Architecture and Setup

- Three components: **SonarQube Server** (web UI + analysis engine), **SonarQube Scanner** (runs in the pipeline), **Database** (stores metadata — PostgreSQL used here). 
- The Scanner scans code, generates a report, and uploads it to the Server; developers view results via the Server's web UI. 
- Setup used **Docker Compose** to run both SonarQube and PostgreSQL as containers on an EC2 `t2.medium` instance; SonarQube runs on port **9000**. 
- Default credentials are `admin`/`admin`; you are prompted to change the password on first login. 
- To connect the Scanner to the Server, two secrets must be stored in GitHub repository settings (`Settings → Secrets and variables → Actions`): 
    - `SONAR_TOKEN` — generated in SonarQube (valid 30 days)
    - `SONAR_HOST_URL` — the EC2 public IP on port 9000
- A `sonar-project.properties` file in the repo root tells the Scanner which SonarQube project to report to (via `sonar.projectKey`). 

### Job Ordering with `needs:`

- By default, all jobs in a GitHub Actions workflow run in parallel. 
- To enforce sequential execution (e.g., run SonarQube only if Build and Test passes), use the `needs:` keyword in the dependent job. 
- Syntax: `needs: build` (where `build` is the job ID of the first job) — using `dependencies:` is incorrect and causes a syntax error. 

### SonarQube Rules, Quality Profiles, and Quality Gates

- **Rules**: SonarQube ships with thousands of rules per language (e.g., 444 for Python, 28 for Dockerfile); each rule checks a specific code pattern. 
- **Quality Profile**: A named subset of rules applied during analysis. Default is `Sonar way`. You can create a custom profile (e.g., "GFG Custom Quality Profile") with only the rules your organization cares about and assign it to specific projects. 
- **Quality Gate**: Defines pass/fail conditions. Default `Sonar way` gate requires zero new issues. A custom gate can relax or tighten thresholds (e.g., allow up to N issues, require ≥80% coverage). 
- When the quality gate fails, the `sonarqube-quality-gate-action` step marks the pipeline job as failed — this must be explicitly enabled by uncommenting the relevant step. 

### Code Coverage Integration

- Run pytest with coverage flags to generate `coverage.xml`: 

```plaintext
pytest --cov=app --cov-report=xml --cov-report=html
```

- The XML file records line-by-line hit counts for each source file — SonarQube reads this to compute coverage percentage. 
- Pass the coverage report path to the SonarQube scanner via the `args:` block with `-Dsonar.python.coverage.reportPaths=coverage.xml`. 
- **Test file exclusion**: By default, SonarQube may treat `test_*.py` files as application source, incorrectly lowering coverage metrics (e.g., 43% instead of 83%). Fix by adding to `sonar-project.properties`: 

```plaintext
sonar.exclusions=test*.py
sonar.coverage.exclusions=test*.py
```

### Pull Request-Based Pipeline Trigger

- A more production-realistic trigger: fire the pipeline only on **pull requests to main**, not on direct pushes. 
- Protect the main branch to disallow direct pushes; all changes must go through a PR. 
- This ensures all quality checks (unit tests, lint, SonarQube) pass **before** code is merged — preventing broken or low-quality code from ever reaching main. 

### Issues Identified by SonarQube in the Demo

- **Security (High):** Missing CSRF protection in the Flask app (`WTF_CSRF_ENABLED` not set); potential attack vector for unauthorized state changes. 
- **Maintainability:** HTTP route decorator missing explicit method declaration (GET/POST); all methods accepted by default. 
- **Dockerfile — Security (High):** `COPY . .` copies everything including potential `.env` files with secrets; should specify exact files. 
- **Dockerfile — Security:** Running the container as `root` user is unsafe; should use a non-root user. 
- **Code smell:** Duplicate string literal used 4 times in the same function — should be extracted into a constant. 
- **Code smell:** Unused loop variable `i` — should be replaced with `_`. 

---


### Why Does Each Job Re-Clone the Repository?

- Each GitHub Actions job runs on a **brand-new, ephemeral worker** spun up from the specified image. Nothing from a previous job's filesystem survives. 
- This is by design for security and reproducibility — workers are stateless. The consequence is that any file produced in Job 1 (like `coverage.xml` or a compiled binary) must be explicitly **uploaded as an artifact** and **downloaded** in Job 2 before it can be used. 

### What Exactly Is a SonarQube "Action" in the Pipeline?

- The term "action" in GitHub Actions means a reusable, packaged unit of code (like a plugin). `SonarSource/sonarqube-scan-action` is one such action that installs and runs the SonarQube Scanner CLI inside the worker, then uploads results to your SonarQube Server. 
- The Scanner itself uses **Java** internally and loads rules from the Server before scanning. 
- The `sonarqube-quality-gate-action` is a *separate* action that polls the Server after the scan completes and returns pass/fail based on your configured Quality Gate — it does not do scanning itself. 

### Why Was Coverage Showing 43% Instead of 83%?

- SonarQube was treating `test_app.py` as a regular source file and calculating coverage of the test file itself — which is 0% (tests don't test themselves). 
- The fix is to explicitly exclude test files from SonarQube's source and coverage analysis using `sonar.exclusions` and `sonar.coverage.exclusions` in `sonar-project.properties`. 
- After exclusion, SonarQube correctly reported **83.3% line coverage** for `app.py`. 

### What Is the Difference Between `sonar.exclusions` and `sonar.coverage.exclusions`?

- `sonar.exclusions`: Tells SonarQube not to scan or report issues for matching files at all.
- `sonar.coverage.exclusions`: Tells SonarQube not to include matching files in coverage percentage calculations.
- Both were needed here because without them, test files were being counted in both issue detection and coverage metrics, skewing results. 

### How Does the Matrix Strategy Work?

- The `strategy.matrix` block lets you define a list of values (e.g., Python versions `[3.9, 3.10, 3.11]`) and GitHub Actions will **run the entire job once per value**, in parallel. 
- This means if you have 3 Python versions, the build job runs 3 times simultaneously — useful for compatibility testing but costs more runner minutes. 
- In the demo, this was later simplified to a single version (`3.11`) to reduce redundancy. 

---


- **Jenkins vs. GitHub Actions comparison:**
    - Jenkins: self-managed, Groovy syntax, `stage` keyword, sequential by default
    - GitHub Actions: managed by GitHub, YAML syntax, `job` keyword, parallel by default 
- **GitHub Actions workflow file location:** `.github/workflows/<filename>.yml` — must be in this exact directory 
- **Trigger syntax distinction:**
    - `push` + `pull_request` under `on:` are OR conditions (either fires the pipeline) 
    - To restrict to a specific branch: nest under `branches: [main]`
- **`needs:`** **keyword** is the correct way to make one job wait for another; `dependencies:` is invalid syntax 
- **Ephemeral runners:** Workers are created on demand and destroyed after job completion — you are only billed for runtime; no idle cost 
- **SonarQube three-component architecture:** Scanner (pipeline) → Server (analysis + UI) → Database (metadata storage) 
- **Two required secrets for SonarQube integration:** `SONAR_TOKEN` and `SONAR_HOST_URL` — never hardcode credentials in the workflow YAML 
- **`sonar-project.properties`** **purpose:** Passes project-level configuration (project key, exclusions, coverage report paths) to the Scanner without cluttering the workflow YAML 
- **Coverage report generation command:**

```plaintext
pytest --cov=<app_module> --cov-report=xml
```

Produces `coverage.xml` which SonarQube reads via `-Dsonar.python.coverage.reportPaths=coverage.xml` 
- **Quality Gate vs. Quality Profile distinction:**
    - Quality Profile = *which rules* to evaluate
    - Quality Gate = *pass/fail thresholds* on the results of those rules 
- **Why test files must be excluded from SonarQube analysis:** Including them inflates uncovered lines and artificially lowers coverage percentage; test files have no business logic to cover 
- **Artifact upload/download pattern:** Use `actions/upload-artifact` at end of Job 1, `actions/download-artifact` at start of Job 2 — required whenever files must cross job boundaries 
- **PR-based pipeline trigger is preferred in production** over push-based, because it validates code *before* merging to the protected main branch, not after 
- **SonarQube Dockerfile rules violated in demo:**
    - `COPY . .` is a security risk (may copy secrets) — specify exact files instead
    - Running as `root` is unsafe — use a non-root user 
- **GitHub Actions runner images:** Must be chosen from GitHub's supported list (e.g., `ubuntu-latest`, `ubuntu-24.04`, `macos-latest`); arbitrary custom images are not directly supported for hosted runners 
