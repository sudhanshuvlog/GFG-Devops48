## Concept ( AI Generated!)

- **Networking** enables two or more systems to communicate by establishing rules around IP addresses, transmission medium, and network membership 
- **IP address (IPv4):** any 32-bit number is a valid IP address; the familiar 4-octet dotted format (e.g., `192.168.1.8`) is purely a human-readable convention 
- **Subnet mask + bitwise AND** determines the **network name**, identifying whether two systems share the same network 
- **NAT (Network Address Translation):** routers translate private ↔ public IP addresses so LAN devices can reach the internet 
- **Shell scripting:** a sequence of Linux commands written in a `.sh` file and executed by the Bash interpreter, running under the permissions of whoever invokes it 


---

**IP Addressing**
- Every IPv4 address is a 32-bit number; 1 octet = 8 bits, 4 octets = 32 bits total 
- **Public IP:** globally unique, paid, required for internet access; **Private IP:** unique only within a LAN, free 
- Maximum unique IPv4 addresses = 2³² ≈ **4.3 billion** — now exhausted, driving adoption of **IPv6 (128-bit, 2¹²⁸ combinations)** 

**Subnets & Devices**
- A LAN can be split into multiple **subnets** for workload separation (e.g., web servers in one subnet, databases in another) 
- **Switch:** connects devices *within* the same network using MAC addresses 
- **Router:** connects *different* networks; performs **SNAT** (outbound, replaces private source IP with public IP) and **DNAT** (inbound, restores original destination) 

**Port Numbers**
- Each process on a system uses a unique **port number**; routers maintain a mapping table of port ↔ device so replies reach the correct application 

**VPN**
- A VPN client encrypts the intended destination inside the data payload, sends traffic to a VPN server instead, hiding the real destination from the ISP 
- The VPN server forwards the request using its own public IP; the target site sees the VPN server's location, not the user's 
- **Data is end-to-end encrypted** via symmetric keys exchanged only between client and destination — even the VPN server cannot read the actual data 

**Shell Scripting**
- Create a script with `.sh` extension; run with `bash <scriptname>.sh` 
- **Variables:** `NAME="value"` or `NAME=$1` (positional argument); reference with `$NAME` 
- **List/array input:** use `$@` to capture all arguments into a variable, enabling loop processing 
- **For loop syntax:** `for item in $list; do ... done` — processes each element individually 
- Script permissions mirror the invoking user — a `dev1` user cannot run `yum install` inside a script, but `root` can 


---

**Bitwise AND / Network Name Calculation**
- Convert both the IP address and subnet mask to binary (32 bits each)
- Apply AND rule: output is `1` only when **both** bits are `1`; otherwise `0`
- Because `255` in the mask = `11111111`, the first 3 octets of the IP pass through unchanged; the last octet (mask = `0` = `00000000`) always produces `0`
- Result: network name = first 3 octets of IP + `.0` (for a `/24` mask) 
- **CIDR notation** (e.g., `/24`) simply counts how many bits in the mask are `1` 

**NAT Flow Step-by-Step**
1. Device creates packet: `src=192.168.1.5`, `dst=8.8.8.8`
2. Router does **SNAT**: replaces src with its public IP, notes the port mapping
3. Packet travels via ISP → intermediate routers → destination
4. Destination replies to router's public IP
5. Router does **DNAT**: replaces dst with original device's private IP, forwards internally 

**Onion Routing (bonus context)**
- Multiple encryption layers through entry → middle → exit nodes; no single node knows both source and destination — used by the Tor browser 


---


- **IPv4 definition:** valid address = any number representable in **32 bits**; dotted-decimal is display format only 
- **1 octet = 8 bits; 4 octets = 32 bits** — know the conversion direction (decimal ↔ binary ↔ octet) 
- **Max IPv4 addresses = 2³²; Max IPv6 addresses = 2¹²⁸** 
- **Public vs Private IP:** public = globally unique + paid; private = LAN-unique + free; private cannot directly reach a public IP without NAT 
- **Switch uses MAC addresses** (Layer 2); **Router uses IP addresses** (Layer 3) 
- **SNAT vs DNAT:** SNAT changes *source* (outbound); DNAT changes *destination* (inbound reply) 
- **Port numbers** differentiate processes on the same device; router maps `(private IP : port) ↔ (public IP : router port)` 
- **Shell script runs as the invoking user** — permissions are not elevated just because root wrote the script 
- **`$1`****,** **`$2`****… = positional args;** **`$@`** **= all args as list**; loop syntax: `for x in $list; do … done` 
