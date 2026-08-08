## Concept

- **CGroup (Control Group):** A Linux kernel feature that allows resource constraints (CPU, memory, network) to be applied per-user or per-process, preventing any single user/program from consuming all available system resources. 
- **System Slice vs. User Slice:** All processes are divided into two groups — **system slice** (processes managed by SystemD) and **user slice** (arbitrary processes run by users from terminal sessions). 
- **SystemD:** A service manager program; the first process started at boot, responsible for launching and managing all system services. 
- **CPU Scheduling (CFS):** By default, the kernel uses a **Completely Fair Scheduler**, distributing CPU time equally among competing processes. 


---

- **Why CGroups matter:** If a developer runs a buggy program that consumes 100% CPU/memory, it starves critical production services (e.g., Apache). CGroups prevent this by enforcing limits. 
- **Two slice types:**
    - **System slice** — contains services started via `systemctl` (Apache, SSH, etc.); these are production-critical. 
    - **User slice** — contains commands run directly from terminal sessions, organized by user ID (e.g., `user-1001.slice`). 
- **Applying a CPU quota per user:** Create a directory `/etc/systemd/system/user-1001.slice.d/` and add a `cpu.conf` file with `CPUQuota=20%`. Run `systemctl daemon-reload` to apply. 
- **Applying limits per service:** Add a `.conf` file under `/etc/systemd/system/httpd.service.d/` with `[Service]` and `MemoryLimit=200M`. Restart the service to apply. 
- **CPU Shares (relative priority):** Set `CPUShares=` in a service file. Default is `1024`; doubling one service's value gives it ~2× the CPU time of another. 
- **Applying limits to entire user slice:** Create `/etc/systemd/system/user.slice` with `CPUQuota=30%` and `MemoryMax=150M` — caps all users collectively, protecting system slice resources. 
- **Running a Python Flask app as a SystemD service:** Create a `.service` file under `/etc/systemd/system/`, define `ExecStart=/usr/bin/python3 /app.py`, reload daemon, then start with `systemctl start gfgapp`. 
- **Logs via** **`journalctl`****:** Filter logs by service (`-u httpd`), priority (`-p error`), line count (`-n 20`), or time range (`--since`, `--until`). 


---

- **Why run under system slice instead of user slice?**

Running a server directly from the terminal places it in the user slice — no automatic log capture, no `systemctl` management, and resource limits are harder to apply per-process. System slice gives you all these benefits. 
- **What does** **`systemctl enable`** **do vs.** **`start`****?**

`start` runs the service now; `enable` tells SystemD to auto-start it on every future boot — you don't have to manually restart it after reboots. 
- **What happens when a memory quota is exceeded?**

For CPU quotas, the process keeps running but slows down (longer execution time). For memory quotas, the process fails with an **OOM (Out of Memory) error** if it tries to exceed the limit. 
- **What are kill signals?**
    - `-9`: Force kill immediately (no cleanup)
    - `-15`: Graceful termination (waits for current work to finish)
    - `-2`: Interrupt (equivalent to Ctrl+C)
    - `-1`: Reload 
- **`systemd-cgls`** **vs.** **`systemd-cgtop`****:**
    - `cgls` shows the full process hierarchy (all processes, tree view)
    - `cgtop` shows real-time resource usage, only for processes consuming significant resources 


---

- **CGroup quota config location for a user:**

`/etc/systemd/system/user-<UID>.slice.d/cpu.conf` with `[Slice]` header and `CPUQuota=X%` 
- **CGroup config location for a service:**

`/etc/systemd/system/<service>.service.d/<name>.conf` with `[Service]` header 
- **Must run** **`systemctl daemon-reload`** **after any config change** before restarting the service 
- **CPU Shares formula:** If S1=1024 and S2=2048, then S2 gets ~66% and S1 gets ~33% of CPU time (ratio-based, not absolute) 
- **Distinction:** `CPUQuota` = hard cap (absolute %); `CPUShares` = relative weight between competing processes 
- **`journalctl -u <service>`** **retrieves logs for a specific SystemD service** 
- **Password-based SSH login** is disabled by default in `/etc/ssh/sshd_config` (`PasswordAuthentication no`); must be explicitly enabled and service restarted 
- **`usermod -L <username>`** locks a user account 
- **Processes NOT started by SystemD belong to user slice; processes started via** **`systemctl`** **belong to system slice** — this determines where resource limits apply 
