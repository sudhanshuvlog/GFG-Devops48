## Concept

- **Docker Networking** is the mechanism by which containers communicate with each other and with the outside world, built on the principle of **Software Defined Networking (SDN)** — all networking components (switches, cables, IP addresses) are created via software, not physical hardware. 
- **Docker network types** define the isolation and connectivity model for containers: **Bridge** (default, switch-like), **Host** (shared host network), **None** (full isolation), and **Overlay** (cross-host communication). 
- **Docker Compose** is a tool that allows you to define and run **multi-container applications** using a single YAML configuration file, replacing the need to manually run multiple `docker run` commands with complex flags. 
- **Resource limits** can be applied to containers at launch time using Docker's built-in **cgroup** integration, capping memory and CPU usage per container. 

---


### Docker Networking Fundamentals

- Every container gets its own **virtual IP address** within the network it belongs to; by default, containers are placed in the `bridge` network and receive IPs in the `172.17.0.x` range. 
- Docker creates a **virtual bridge device** called `docker0` (visible via `ifconfig` on the host) with IP `172.17.0.1`; this acts like a software-defined switch connecting containers on the same network. 
- **veth pairs** (Virtual Ethernet Pairs) serve as virtual cables: one end attaches to the container, the other to the host's bridge. Two containers = two veth pairs visible on the host. 
- Containers on the **same network** can communicate directly via the bridge (switch behavior); containers on **different networks** cannot communicate without a router. 
- Internet access from a container works via **SNATing**: the container's private IP is replaced by the EC2 instance's public IP as the packet exits through the host's `enx0` network card. 
- Inbound internet access to a container requires **port mapping** (`-p 8080:80`), which creates a port-forwarding NAT rule: traffic arriving at host port 8080 is forwarded to container port 80 via the Docker bridge. 

### Docker Network Types — Detailed Breakdown

- **Bridge Network (default):**
    - Acts like a software switch; all containers within the same bridge network can communicate with each other. 
    - If no `--network` flag is given at container launch, Docker assigns the container to the default bridge network automatically. 
    - Custom bridge networks can be created with `docker network create --driver bridge --subnet 192.168.1.0/24 <name>`, giving you control over IP ranges and isolation. 
    - Containers in different bridge networks are isolated from each other — useful for separating unrelated applications running on the same host. 
- **Host Network:**
    - Removes network isolation between container and host; the container shares the host's network stack directly. 
    - No port mapping is needed — a server running inside a host-networked container is directly accessible via the host's public IP and port. 
    - Best suited for **ultra-low latency** applications where the overhead of NAT and port forwarding rules is unacceptable. 
    - Demonstrated by launching a container with `--network host`, installing Apache (`httpd`), and accessing it directly via the EC2 public IP without any `-p` flag. 
- **None Network:**
    - Container is fully isolated — no internet access, no connectivity to other containers. 
    - Verified by running `ping 8.8.8.8` inside such a container, which returns "network is unreachable." 
    - Use case: standalone batch jobs or critical workloads that must not be reachable from any external source. 
- **Overlay Network:**
    - Designed for **multi-host Docker environments** where containers spread across multiple virtual machines need to communicate. 
    - When containers run on separate VMs (each with its own Docker daemon), bridge networking alone cannot connect them — overlay network bridges across Docker daemons. 
    - This will be covered in depth during the **Kubernetes** module, since Kubernetes is the preferred tool over Docker Swarm for this use case. 
- **MACVLAN:**
    - Makes a container appear as a physical device on the host LAN with its own MAC address. 
    - Relevant only for **legacy applications** that require physical device-level network presence; not a primary focus of this course. 

### Practical Container Networking Demo

- Two containers (`server1`, `server2`) were launched from Amazon Linux image; packages `iputils` (for `ping`) and `net-tools` (for `ifconfig`) were installed manually inside each. 
- `server1` received IP `172.17.0.2`, `server2` received `172.17.0.3` — both in the same default bridge subnet, confirming same-network communication works (ping succeeded). 
- A custom network `GFGNet` was created with subnet `192.168.1.0/24`; `server3` and `server4` were launched into this network and received IPs in the `192.168.1.x` range. 
- Ping from `server4` (on GFGNet) to `server1` (on default bridge) **failed** — confirming cross-network isolation. 
- `docker exec -it <container> bash` is preferred over `docker attach` because `exec` starts a new process (PID ≠ 1), so exiting it does not terminate the container's primary command. 

### Container Lifecycle and Bulk Termination

- `docker stop` halts a container but preserves its filesystem; `docker start` resumes it. 
- `docker rm` permanently deletes a container and all its data; requires the container to be stopped first, or use `-f` (force) flag. 
- **Bulk termination** using command-substitution syntax: `docker rm -f $(docker ps -a -q)` — the inner command returns all container IDs, which are passed as arguments to `rm -f`, deleting all containers in one step. 
- `docker ps -a -q` returns only container IDs (quiet mode), suitable for scripting. 

### Resource Limiting with Docker

- By default, a container can consume **all available host memory** — verified by `docker stats <name>` showing the limit equal to total host RAM (~3.82 GB on a 4 GB instance). 
- Memory limits are applied at launch: `docker run --memory 10m <image>` caps the container at 10 MB; if the process tries to exceed this, it receives an **Out of Memory** error. 
- Docker uses **cgroups** internally to enforce these resource constraints, consistent with the cgroup concepts covered in earlier Linux sessions. 

### Custom Dockerfile for Networking Practicals

- A custom Docker image was built that pre-installs `iputils` and `net-tools` so containers launched from it don't require manual package installation each time. 
- Build command: `docker build -t test-gfg-image .` — reads the Dockerfile from the current directory. 
- This illustrates the reusability benefit of custom images: common setup steps are baked in, reducing repetition across container launches. 

### Docker Compose — Concepts and Usage

- Docker Compose eliminates the need to manually type long `docker run` commands with many flags for each container in a multi-container setup. 
- All configuration — services (containers), networks, volumes, environment variables, port mappings, restart policies — is declared in a single `docker-compose.yaml` file. 
- Key YAML structure:
    - `services:` — defines each container (image, environment variables, ports, volumes, networks, restart policy)
    - `networks:` — declares custom networks (driver type, subnet)
    - `volumes:` — declares named volumes for persistent storage 
- **Restart policy** **`always`** means Docker will automatically restart the container if it crashes or if the host reboots. 
- Launch all services with a single command: `docker compose up -d` (`-d` = detached/background mode). 
- View only Compose-managed containers: `docker compose ps` (vs. `docker ps` which shows all containers). 

### WordPress + MySQL Full-Stack Deployment via Docker Compose

- **Two containers** were defined: `db` (MySQL image) and `wordpress` (WordPress image), communicating over a shared custom network `GFGNet`. 
- **MySQL container** environment variables set at launch:
    - `MYSQL_ROOT_PASSWORD`: set to a random value (root user not used directly for security)
    - `MYSQL_DATABASE`: `exampledb`
    - `MYSQL_USER`: `exampleuser`
    - `MYSQL_PASSWORD`: `examplepass` 
- **WordPress container** environment variables tell it how to connect to the DB:
    - `WORDPRESS_DB_HOST`: set to `db` (the service/container name, not an IP — resolved via Docker's internal DNS) 
    - `WORDPRESS_DB_USER`, `WORDPRESS_DB_PASSWORD`, `WORDPRESS_DB_NAME` matching the MySQL values 
- **Container name as hostname**: Since IPs are assigned dynamically at container creation, WordPress references the DB using the service name `db` — Docker's internal DNS resolves this to the correct container IP. 
- **Port mapping**: Only WordPress has a port mapping (`80:80`); the MySQL container is not exposed externally — it is only reachable by WordPress internally via the shared network. 
- **Volume mounts**:
    - `db_volume` → `/var/lib/mysql` on the MySQL container (stores structured DB data) 
    - `wordpress_volume` → `/var/www/html` on the WordPress container (stores raw data like uploaded images and PDFs that cannot go into MySQL) 
- After running `docker compose up -d`, Docker pulled both images, created the network, created both volumes, and started both containers automatically. 
- The WordPress setup UI was accessible at the host's public IP on port 80; admin credentials were configured and the WordPress dashboard was successfully reached. 

### Docker Compose Installation on Amazon Linux

- Docker Compose is not available via `yum` directly; it must be downloaded as a binary from GitHub using `curl`. 
- After download, the binary must be made executable: `chmod +x /usr/local/bin/docker-compose`. 
- Verify installation: `docker-compose --version`. 

---


### Why Use Container Name Instead of IP for DB_HOST?

- Container IPs are assigned **dynamically** when the container starts — you don't know the IP in advance when writing the YAML file. 
- Docker Compose sets up an internal **DNS resolver** within each custom network; containers can reach each other using their **service name** as the hostname (e.g., `db` resolves to the MySQL container's IP automatically). 
- This is why `WORDPRESS_DB_HOST=db` works without hardcoding any IP address.

### What Exactly is a veth Pair?

- A **veth pair** is a virtual Ethernet cable with two ends: one end is "plugged into" the container's virtual network interface, the other end is "plugged into" the host's Docker bridge (`docker0`). 
- Because it's software-defined, there's no physical wire — it's a kernel-level construct that behaves exactly like a real cable for networking purposes. 
- You can see veth pairs on the host with `ifconfig` — one pair per running container. 

### How Does Cross-Network Isolation Work in Practice?

- Each Docker network is a separate **Layer 2 broadcast domain** (like a separate physical LAN segment). 
- The Docker bridge only forwards traffic within its own network — it has no routing rules to forward packets to a different network's address range. 
- To connect containers across networks, you would need a **router** (Layer 3 device), which Docker does not set up by default between custom networks. 
- In practice, if you need two containers from different networks to talk, you can attach a container to **multiple networks** simultaneously using the `networks:` list in Docker Compose. 

### Why Is Overlay Network Deferred to Kubernetes?

- Docker has its own multi-host clustering tool called **Docker Swarm** that uses overlay networks, but it is considered less capable than Kubernetes for production workloads. 
- Kubernetes solves the same multi-host container networking problem with a richer feature set (auto-scaling, self-healing, rolling updates, etc.), so the overlay network concept will be demonstrated practically within the Kubernetes module rather than with Docker Swarm. 

### What Happens to Data When a Container Is Deleted?

- Without volumes, all data inside a container's filesystem is **permanently lost** when the container is removed with `docker rm`. 
- With **named volumes** (e.g., `db_volume`), the data is stored on the host filesystem and persists independently of the container lifecycle — the container can be deleted and recreated, and the volume data remains intact. 
- In production, **cloud-attached volumes** (e.g., AWS EBS) are used instead of local volumes, enabling data to survive even if the entire VM is terminated and allowing multiple containers to share the same centralized storage. 

---


- **Docker default network**: If no `--network` flag is specified, containers join the default `bridge` network automatically. 
- **Bridge vs Host vs None vs Overlay** — know when to use each:
    - Bridge → standard container isolation with inter-container communication
    - Host → ultra-low latency, no port mapping needed
    - None → complete isolation, no network access at all
    - Overlay → multi-host container communication (Kubernetes context) 
- **Port mapping syntax**: `-p <host_port>:<container_port>` — traffic hits host port, gets NAT-forwarded to container port. 
- **`docker exec`** **vs** **`docker attach`**: `exec` starts a new process (safe); `attach` connects to PID 1 (dangerous — exiting kills the container). 
- **Bulk delete command**: `docker rm -f $(docker ps -a -q)` — inner command returns all IDs, outer command force-removes them all. 
- **Memory limit flag**: `--memory <value>` (e.g., `--memory 10m`) applied at `docker run` time; enforced via cgroups. 
- **`docker stats <container>`**: Shows live resource usage (CPU, memory, network I/O) and the memory limit applied. 
- **Docker Compose file name**: Must be `docker-compose.yaml` (or `.yml`); run with `docker compose up -d`. 
- **Service name as hostname**: In Docker Compose, containers reference each other by their **service name** (not IP), resolved via Docker's internal DNS. 
- **Volume mount purpose**: `/var/lib/mysql` is where MySQL stores data; mounting a volume there ensures data survives container restarts/deletions. 
- **`docker compose ps`**: Shows only containers managed by the current Compose project (not all Docker containers). 
- **Why DB is not port-mapped**: Security — the database should only be reachable by the application container internally, not exposed to the internet. 
- **veth pair**: Virtual cable connecting container namespace to host bridge; two containers = two veth pairs visible on the host via `ifconfig`. 
- **SDN (Software Defined Network)**: All Docker networking components (bridge, veth, virtual NICs) are software constructs, not physical hardware. 
- **`docker network create`** **command structure**: `docker network create --driver bridge --subnet <CIDR> <network-name>`. 
- **Overlay network prerequisite**: Required when containers run on **different Docker hosts (VMs)**; bridge only works within a single host. 
