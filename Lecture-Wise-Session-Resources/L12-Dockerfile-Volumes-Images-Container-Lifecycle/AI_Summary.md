## Concept

- **Docker** is a containerization platform that allows applications to run in isolated environments called **containers**, each with their own filesystem, package manager, and dependencies 
- **Microservices architecture** breaks large, monolithic applications into smaller, independently deployable services — each container can represent one microservice (e.g., train booking, flight booking, payments in an app like Paytm) 
- **Monolithic architecture** remains valid for simpler applications with limited features, predictable load, and internal user bases 
- A **Docker image** is a bundled package containing the runtime, application code, system dependencies, configurations, and environment settings needed for a container to run 
- **Docker Hub** is the centralized, public registry where images are stored, versioned (via tags), and shared — both official and user-created images are available 
- **Port mapping** bridges the gap between a container's private IP and the outside world by routing traffic from the host's public IP/port to the container's internal port 
- **Volumes** allow persistent, shared storage to be mounted into containers so data changes are reflected automatically without manual file copying 
- A **Dockerfile** is a declarative instruction file used to build custom Docker images reproducibly, replacing the manual commit-based approach 

---


### Microservices vs. Monolithic Architecture

- Large, feature-rich applications with unpredictable or high user loads benefit from **microservices** — each service scales, deploys, and fails independently 
- Monolithic architecture is still appropriate when: the application has **limited features**, a **known, bounded user base** (e.g., ~10,000 internal users), and straightforward non-functional requirements 
- The course progression follows: Docker → Docker Compose → Kubernetes, each solving challenges introduced by the previous tool 

### Docker Installation and Basic Container Lifecycle

- Docker is installed on an EC2 instance (the **Docker host**) using `yum install docker`; the Docker daemon is started with `systemctl start docker` 
- `docker run -it --name server1 amazonlinux` pulls the image if not locally available, then launches and attaches to the container shell 
- **Detach mode** (`-d`) creates and runs the container without attaching to its primary command — useful when you don't want to be dropped into the container shell immediately 
- `docker attach` reconnects to a container's **PID 1 (primary command)**; this is dangerous for servers (e.g., HTTPD) because attaching and accidentally exiting can kill the primary process and stop the container 
- **`docker exec -it <name> bash`** is the preferred way to enter a running container — it spawns a new secondary process (bash), leaving PID 1 untouched; exiting this shell does not stop the container 
- Escape sequence **Ctrl+P+Q** exits a container shell without stopping it 

### Why `systemctl` Fails Inside Containers

- `systemctl` (SystemD) requires SystemD to be PID 1 of the system; inside containers, PID 1 is typically `bash` or the application command, not SystemD 
- Containers share the **host kernel** and do not boot with SystemD, so services must be started by calling the executable directly (e.g., `/usr/sbin/httpd`) 

### Port Mapping

- Containers have **private IP addresses** (e.g., `172.17.0.2`) that are inaccessible from the internet; the EC2 instance has a public IP 
- Port mapping syntax: `-p 8080:80` means — anyone hitting the host at port 8080 is forwarded to port 80 of the specified container 
- Docker runs a **Docker proxy** process on the host that listens on the mapped port and forwards traffic to the target container 
- Multiple containers can be mapped to different host ports simultaneously (e.g., port 80 → container A, port 81 → container B, port 8080 → container C) 
- Port conflicts occur if two containers attempt to bind to the **same host port** — Docker will throw an allocation error 

### Copying Files Into and Out of Containers

- **`docker cp <src> <container>:<dest>`** copies a file from the host into a running container without entering its shell 
- The reverse is also supported: **`docker cp <container>:<src> <dest>`** copies a file from the container back to the host (e.g., for retrieving log files) 
- Limitation: `docker cp` is a **one-time operation** — every subsequent content change requires re-running the command manually 

### Volume Mounting

- **Volume mounting** (`-v /host/dir:/container/dir`) links a host directory to a container path; any change on the host is **immediately reflected** inside the container without manual copying 
- Analogy: like inserting a USB pen drive — whatever is on the drive is visible in any system it's inserted into 
- The same host directory can be mounted to **multiple containers simultaneously**, ensuring all replicas serve identical content — critical for consistency across scaled instances 
- **Docker-managed volumes** (`docker volume create`) are preferred over manually created directories because Docker stores them in a protected location (`/var/lib/docker/volumes/`) that is less likely to be accidentally deleted 
- Volume drivers can be set to **local** (default, uses host disk) or **cloud-based** (e.g., AWS EBS), enabling persistent storage decoupled from the container host — a concept to be explored further in Kubernetes classes 

### Building Custom Images: The Commit Method

- Launch a container → manually install packages and configure settings → use **`docker commit -m "message" <container> <image>:<tag>`** to snapshot the container as a new image 
- This image can then be used to launch new containers that come pre-configured with all installed packages and files 
- **Drawback:** No documentation of what was done inside the container; hard to reproduce or audit in production 

### Building Custom Images: The Dockerfile Method (Preferred)

- A **Dockerfile** (no extension, capital D) contains ordered instructions executed at **build time** to produce a reproducible image 

**Key Dockerfile Instructions:**

| Instruction  |                                                    Purpose                                                    |
|--------------|---------------------------------------------------------------------------------------------------------------|
| `FROM`       | Sets the base image (e.g., `amazonlinux`)                                                                     |
| `RUN`        | Executes shell commands at **build time** (e.g., `yum install -y httpd python3 vim`)                          |
| `LABEL`      | Adds metadata (maintainer, environment, company) — no functional effect                                       |
| `WORKDIR`    | Sets the working directory for subsequent instructions; avoids repeating full paths                           |
| `COPY`       | Copies files from host into the image at build time                                                           |
| `ENV`        | Sets environment variables baked into the image (e.g., `DB_HOST=gfg.com`)                                     |
| `EXPOSE`     | Documents the port the container's server listens on — informational, aids port mapping                       |
| `CMD`        | Specifies the **default runtime command**; can be **overridden** at `docker run` time                         |
| `ENTRYPOINT` | Specifies a **fixed runtime command** that cannot be overridden; extra arguments can still be passed via CMD  |

- Build command: `docker build -t <image-name>:<tag> <path-to-dockerfile>` 
- **Build time vs. runtime:** `RUN`, `COPY`, `LABEL`, `WORKDIR`, `ENV` execute at build time; `CMD`/`ENTRYPOINT` execute when the container starts 
- Pre-installing packages at build time ensures containers start **in under a second** at runtime — critical for auto-scaling scenarios 

### CMD vs. ENTRYPOINT

- **CMD:** Default command runs at container start; easily overridden by appending a command to `docker run` (e.g., `docker run myimage ls` replaces the CMD) 
- **ENTRYPOINT:** Fixed primary command; cannot be replaced at runtime — any runtime argument is treated as an *argument to* the entrypoint command, not a replacement 
- **Best practice for servers:** Use `ENTRYPOINT` for the executable (e.g., `/usr/sbin/httpd`) and `CMD` for default arguments (e.g., `-D FOREGROUND`) — this keeps the server command fixed while allowing argument overrides 
- Apache requires the `-D FOREGROUND` flag inside Docker; without it, Apache daemonizes (goes to background), Docker thinks PID 1 exited, and the container stops immediately 

### Running Apache in Foreground (Critical Fix)

- Without `-D FOREGROUND`, Apache starts, moves to the background, and the container exits because PID 1 appears to have terminated 
- Correct final command: `ENTRYPOINT ["/usr/sbin/httpd"]` + `CMD ["-D", "FOREGROUND"]` 
- With this, the container stays alive and the Apache server is accessible via port mapping 

### Pushing Images to Docker Hub

- Tag the image for Docker Hub: `docker tag <local-image>:<tag> <dockerhub-username>/<repo-name>:<tag>` 
- Authenticate: `docker login` (prompts for username and password) 
- Push: `docker push <dockerhub-username>/<repo-name>:<tag>` 
- Public images are downloadable by anyone via `docker pull` without an account; an account is only required to push 

### Mario Game Containerization Demo

- A JavaScript-based Mario game (HTML/CSS/JS) was containerized using an **NGINX base image** 
- Dockerfile: copied all game source files into `/usr/share/nginx/html` (NGINX's default web root), exposed port 80, and set `CMD ["nginx", "-g", "daemon off;"]` 
- Built with `docker build -t mario-game:v1 .` and run with port mapping `-p 8080:80` 
- Demonstrates that any static web application can be containerized and deployed in seconds 
- **`docker logs <container-name>`** displays captured container logs, including access logs from NGINX showing visitor IPs 

---



### Why Does `docker attach` Break Servers?

- When you `docker attach` to a container, you connect directly to **PID 1** — the primary process 
- For servers like Apache (HTTPD), PID 1 is the server process itself; attaching sends it a terminal signal, which can cause it to shut down 
- The fix: always use **`docker exec -it <container> bash`** to open a new shell session without touching PID 1 
- You can safely `exit` from an `exec` session because you're only terminating the secondary bash process, not PID 1 

### Volume Mount vs. Docker CP — When to Use Which?

- `docker cp` is appropriate for **infrequent, one-off file transfers** (e.g., deploying a config file once a week) 
- Volume mounts are appropriate for **frequently updated content** (e.g., web page files that developers change regularly) — changes are live-synced without any command 
- Docker-managed volumes (`docker volume create`) are better than raw directory mounts because they are stored in `/var/lib/docker/volumes/`, a location that is not casually browsed or accidentally deleted 

### ENV Variables — What Should and Shouldn't Go There?

- `ENV` in a Dockerfile is suitable for **non-sensitive configuration** like `DB_HOST`, debug flags, or environment identifiers 
- **Never store passwords or secrets** in `ENV` — they are visible in the image layer history and in the Dockerfile (which is often in a Git repo) 
- The recommended approach for secrets is a **vault** (e.g., HashiCorp Vault, AWS Secrets Manager) — containers retrieve credentials at runtime; this will be covered in the Kubernetes module 
- Environment variables can also be passed at **runtime** using `docker run -e VAR=value`, which overrides or supplements image-level ENV values 

### EXPOSE Instruction — Is It Functional?

- `EXPOSE` does **not** actually publish or open a port — it is purely **documentation** embedded in the image metadata 
- It tells operators (and tools like Docker Compose/Kubernetes) which port the application inside the container listens on, so they know what to map 
- Actual port publishing still requires `-p <host-port>:<container-port>` in the `docker run` command 

### What Happens When a Container's PID 1 Exits?

- The **lifecycle of a container is tied to the lifecycle of PID 1** 
- If PID 1 exits (even momentarily, as with a daemonizing process like Apache without `-D FOREGROUND`), Docker considers the container's job done and stops it 
- This is why long-running servers must run **in the foreground** as PID 1 inside containers 
- Short-lived commands (like `date` or `ls`) set as CMD will cause the container to exit immediately after execution — this is expected behavior, not an error 

### Docker Volume with Cloud Storage

- The default volume driver is `local` — storage comes from the host machine's disk 
- Alternative drivers allow storage to come from **cloud services** (e.g., AWS EBS) — the volume exists independently of any host machine, making it suitable for distributed or highly available deployments 
- This is particularly relevant in Kubernetes, where containers may run on different nodes and need shared persistent storage — a full practical will be demonstrated in the Kubernetes module 

---


- **Microservices vs. Monolithic:** Know the decision criteria — load predictability, number of features, team independence, scaling granularity 
- **`docker run`** **flags to memorize:**
    - `-it` — interactive + pseudo-TTY (enter shell) 
    - `-d` — detached mode (run in background) 
    - `-p host:container` — port mapping 
    - `-v host_dir:container_dir` — volume mount 
    - `-e VAR=value` — pass environment variable at runtime 
    - `--name` — assign a container name 
- **`docker exec`** **vs.** **`docker attach`****:** `exec` spawns a new process (safe); `attach` connects to PID 1 (risky for servers) 
- **Dockerfile instruction execution timing:**
    - Build time: `FROM`, `RUN`, `COPY`, `LABEL`, `WORKDIR`, `ENV`, `EXPOSE`
    - Runtime: `CMD`, `ENTRYPOINT` 
- **CMD vs. ENTRYPOINT distinction:**
    - CMD = overridable default command 
    - ENTRYPOINT = fixed command; runtime args appended, not replaced 
    - Combined pattern: ENTRYPOINT = executable, CMD = default args 
- **Why** **`-D FOREGROUND`** **is required for Apache in Docker:** Apache daemonizes by default; Docker stops the container if PID 1 exits; foreground mode keeps PID 1 alive 
- **Port mapping mechanics:** Host listens on mapped port → Docker proxy → forwards to container IP:port 
- **Volume consistency trick:** Mounting the same host directory/volume to multiple containers ensures all replicas serve identical content without manual sync 
- **`docker commit`** **creates an image from a container snapshot** — but lacks reproducibility/documentation; Dockerfile is always preferred for production 
- **`docker build -t name:tag .`** — the `.` specifies the build context (location of Dockerfile) 
- **`docker push`** **requires:** re-tagging with `username/repo:tag` format + `docker login` first 
- **`docker logs <container>`** retrieves stdout/stderr output from a running or stopped container 
- **NGINX default web root:** `/usr/share/nginx/html` (important for volume mounts and COPY in Dockerfiles) 
- **Apache default web root:** `/var/www/html` 
- **HTTPD image default web root:** `/usr/local/apache2/htdocs` 
- **`docker volume create`** **stores data at:** `/var/lib/docker/volumes/<volume-name>/_data` 
- **Container stops when PID 1 exits** — this is the core principle behind container lifecycle management 
