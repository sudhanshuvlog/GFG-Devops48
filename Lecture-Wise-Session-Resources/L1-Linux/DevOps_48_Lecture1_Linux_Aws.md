## Key Outcomes (AI GENERATED!)

This session covered foundational DevOps concepts including the software development lifecycle, virtualization, cloud computing via AWS, and hands-on Linux server setup. Students created an AWS EC2 instance, connected via SSH key-based authentication, installed Apache HTTPD, and deployed a basic static web server. Core concepts of port numbers, processes, and package management were explained in depth. 
## Decisions Made

- **OS Choice:** Amazon Linux selected for practicals (Red Hat-based, pre-configured AWS CLI, same commands as RHEL) 
- **Instance Type:** T2.micro (1 core CPU, 1GB RAM) used to stay within AWS free tier 
- **Authentication Method:** Key-based (RSA asymmetric encryption) over password login for all server access 
- **All practicals run on AWS Cloud**, not local VirtualBox, to simulate real-world environments 

## Concepts Covered

### Software Development Lifecycle (SDLC)

- Stages: Requirement → Planning → Design → Development → Testing → Deployment 
- **Agile model** preferred: small iterative development chunks to reduce rework and improve time-to-market 
- **DevOps** automates this pipeline (CI/CD) for faster, more reliable delivery 

### Virtualization & Cloud

- **Problem solved:** Underutilization of hardware across isolated physical servers 
- **Hypervisor** virtually divides physical hardware (RAM, CPU, storage) among multiple VMs in isolation 
- **Type 1** runs on bare metal; **Type 2** (e.g., VirtualBox) runs on top of existing OS 
- Virtualization gave birth to cloud computing — AWS uses this to provision resources on-demand 

### AWS EC2 Setup

- Region selected: **Mumbai (ap-south-1)** 
- Free tier limits: ≤750 hours/month, T2.micro instance, ≤30GB SSD storage 
- **Security Group (firewall):** Port 22 (SSH) open by default; HTTP port 80/82 added manually 
- **Key pair:** Private key downloaded locally; public key auto-injected into EC2 instance by AWS 

### Linux Fundamentals

- **File system root (****`/`****)** equivalent to Windows C: drive; key subdirectories: 
    - `/bin` — executable commands
    - `/etc` — configuration files
    - `/var/log` — server logs
    - `/var/www/html` — Apache web content default path
- **Key commands used:** `ls`, `pwd`, `whoami`, `cat`, `vi`, `free -h`, `fdisk -l`, `top`, `ps aux`, `grep`, `history`, `netstat -tnlp` 
- **Package manager:** `yum install <package>` — downloads from Red Hat repository, resolves dependencies 
- **VI editor shortcuts:** `i` = insert mode; `Esc + :w` = save; `Esc + :q` = quit; `Esc + :wq` = save and quit 

### Web Server & Port Numbers

- Apache HTTPD installed via `yum install httpd`, configured, started with `systemctl start httpd` 
- Config file at `/etc/httpd/conf/httpd.conf` — port and document root are editable 
- **Port number** provides a static mapping to a dynamic process ID (PID); kernel maintains this mapping 
- After config changes, `systemctl restart httpd` required to apply 
- Logs viewable at `/var/log/httpd/access_log` — shows IP, method, response code, browser 

## Pending Confirmation

- VirtualBox + RHEL ISO setup document to be shared on GitHub for local practice 
- PDF of all Linux commands to be shared in upcoming classes 

## Action Items

- **Students:** Create AWS account (free tier) before next class 
- **Students:** Star the instructor's GitHub repository for diagrams, notes, and command history 
- **Students:** Watch foundation session recording if missed (available in LMS archive) 
- **Instructor:** Share VirtualBox setup document and Linux command reference on GitHub

## Next Steps

- Next classes will cover: more Linux commands, user/group administration, file permissions, sudo privileges, networking (public vs. private IP), and Kubernetes 


