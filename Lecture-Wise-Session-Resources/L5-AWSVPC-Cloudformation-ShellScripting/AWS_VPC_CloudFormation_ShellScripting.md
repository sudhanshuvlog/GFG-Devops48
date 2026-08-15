## Concept

- **VPC (Virtual Private Cloud):** A virtual, software-defined private network AWS creates per account per region, isolating your resources from other AWS customers 
- **Subnets:** Subdivisions of a VPC; a **public subnet** has a route to an Internet Gateway (IGW), a **private subnet** does not 
- **NAT Gateway:** Enables private subnet instances to initiate outbound internet traffic via SNATing (replacing private IP with a public IP), while blocking inbound connections from the internet 
- **Route Table:** Directs traffic within the VPC — maps destinations (e.g., `0.0.0.0/0`) to targets (IGW or NAT Gateway) 
- **Network ACL:** Subnet-level firewall rules, evaluated by rule number priority (lower = higher priority), applied before traffic reaches any EC2 instance 

---


- AWS creates a **default VPC** with 3 public subnets (one per availability zone) when you create an account; all three route through a shared IGW 
- A **custom VPC** was built using a **CloudFormation YAML template**, creating: VPC → subnets → IGW → IGW attachment → route tables → route table associations → Elastic IP → NAT Gateway 
- **Public subnet** EC2 instances get a public IP on launch (`MapPublicIpOnLaunch: true`) and are reachable from the internet 
- **Private subnet** EC2 instances have no public IP and cannot be directly SSH'd into; access requires a **bastion host (jump server)** — SSH into the public EC2 first, then SSH internally to the private EC2 using its private IP (e.g., `10.0.2.13`) 
- **Elastic IP** provides a static public IP that doesn't change on restart, unlike the dynamic IPs assigned to regular EC2 instances 
- NAT Gateway sits in the **public subnet** (because it needs IGW access), but is used exclusively by the **private subnet** via the private route table 
- Confirmed via Apache access logs: the private EC2's outbound traffic appeared with the **NAT Gateway's public IP** (`13.207.123.42`), not the instance's private IP — proving SNATing occurred 
- **CloudFormation** allows infrastructure to be created and destroyed in one click from a reusable YAML template, avoiding manual UI repetition 

---


- **Why NAT Gateway is in the public subnet, not private:** The NAT Gateway itself needs internet access to forward traffic. Since only the public subnet has a route to IGW, NAT Gateway must live there — even though it serves the private subnet. 
- **IGW vs NAT Gateway distinction:**
    - **IGW** = two-way internet access (anyone can initiate connection to/from your instance)
    - **NAT Gateway** = one-way outbound only (your instance initiates; no one from internet can initiate back) 
- **`0.0.0.0/0`** **in route tables** means "any destination on the internet" — a catch-all rather than listing every public IP individually 
- **Network ACL vs Security Group:**
    - Security Group = per-EC2-instance firewall
    - Network ACL = per-subnet firewall, stateless, rule-number ordered 
- **Output redirection in shell scripts:** `>` redirects stdout only; `2>` redirects stderr only; `&>` redirects both. Using `&> /dev/null` suppresses all output while preserving the exit code for conditional logic 
- **Exit code (****`$?`****):** Every Linux command returns `0` (success) or non-zero (failure). Shell `if` conditions use this exit code — not printed output — to branch logic 

---


- **Public vs Private subnet definition:**
    - Public = has route to IGW; inbound + outbound internet traffic possible
    - Private = no direct IGW route; outbound only possible via NAT Gateway 
- **CIDR block** **`/16`** **vs** **`/24`****:**
    - `/16` = first 2 octets fixed (VPC level, e.g., `10.0.0.0/16`)
    - `/24` = first 3 octets fixed (subnet level, e.g., `10.0.1.0/24`); last octet = host addresses 
- **SNATing:** NAT Gateway replaces source private IP with its own public IP in outgoing packets; reverses (DNATing) on reply 
- **Bastion Host pattern:** Public EC2 acts as proxy to reach private EC2 — required when no public IP exists on the target instance 
- **CloudFormation resource dependency:** Use `!Ref` to reference another resource's ID dynamically (e.g., attach subnet to VPC before VPC ID is known) 
- **Shebang (****`#!/usr/bin/bash`****):** Placed at top of shell script; allows direct execution without prefixing `bash`; file must also be made executable with `chmod` 
- **`/dev/null`****:** Special Linux file that discards all written content — used to suppress unwanted command output in scripts 
