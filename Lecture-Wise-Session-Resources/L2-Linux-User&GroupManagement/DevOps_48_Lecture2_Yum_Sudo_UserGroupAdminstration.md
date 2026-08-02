## Concept (AI GENERATED!)

- **User Management in Linux:** Linux supports multiple users on a single server, each with a unique user ID (UID) and group ID (GID). Users can be created, modified, and deleted using `useradd`, `usermod`, and `userdel` commands. 
- **Groups:** Collections of users that share common permissions. Instead of assigning permissions individually, permissions are granted to a group, and all members inherit them automatically. 
- **File Permissions:** Every file and directory has three permission layers — **owner**, **group**, and **others** — each with **read (r)**, **write (w)**, and **execute (x)** flags. 
- **Sudo / Super User Privileges:** Mechanism to grant selected users or groups the ability to run privileged (root-level) commands without being root. Controlled via the `/etc/sudoers` file. 
- **YUM Package Manager:** The package installation tool for Red Hat-based Linux systems. It resolves dependencies automatically, supports multiple repositories, and validates package integrity via GPG signatures. 


---

### User and Group Creation

- **Creating users:** `useradd <username>` creates a new user. The kernel automatically assigns a unique UID (e.g., 1001, 1002) and also creates a default group with the same name. 
- **Checking user identity:** `id <username>` shows UID, GID, and group memberships. `whoami` shows the currently logged-in user. 
- **Creating groups:** `groupadd <groupname>` creates a new group (e.g., `devs`, `managers`, `operations`). 
- **Adding users to groups:**
    - For existing users: `usermod -G <groupname> <username>` 
    - At creation time: `useradd -g <groupname> <username>` 
- **Setting passwords:** `passwd <username>` sets a password for a user; only root can do this for other users. 
- **Switching users:** `su <username>` switches to another user. Root can switch without a password; regular users must provide the target user's password. 

### Key Configuration Files


|     File      |                           Purpose                            |
|---------------|--------------------------------------------------------------|
| `/etc/passwd` | Lists all user accounts with UID, GID, home directory, shell |
| `/etc/shadow` | Stores hashed passwords (root-readable only)                 |
| `/etc/group`  | Lists all groups and their members                           |

- Passwords are stored in **hashed format** in `/etc/shadow`, not plain text, for security. 
- When a user is created, Linux automatically allocates a **home directory** under `/home/<username>`. 

### File Permissions in Detail

- **`ls -l`** shows file permissions, owner, group, size, and timestamp. 
- **`ls -la`** additionally shows hidden files and **directory-level permissions** — critical because if a user lacks permission on the directory, they cannot access files inside it regardless of file-level permissions. 
- Permission string format: `[type][owner rwx][group rwx][others rwx]`
    - `d` = directory, `-` = regular file 
    - Example: `drwxrwx---` → directory, owner has rwx, group has rwx, others have none
- **Changing permissions with** **`chmod`****:**
    - Symbolic: `chmod g+rw <file>` adds read/write to group; `chmod g-w <file>` removes write from group 
    - Targets: `u` = owner, `g` = group, `o` = others
    - **Octal representation:** `chmod 764 <file>`
        - `4` = read, `2` = write, `1` = execute
        - `7` = rwx (4+2+1), `6` = rw (4+2), `4` = r only 
        - Example: `chmod 777` gives everyone full permissions 
- **Changing ownership with** **`chown`****:**
    - `chown <newowner> <file>` changes the file owner (root only) 
    - To change group ownership: `chown :<groupname> <file>` 

### Practical Permission Scenario

- A file created by `dev2` in their home directory defaults to: owner = `dev2` (rw), group = `devs` (r), others (r). 
- `dev3` (also in `devs` group) could **read** but not **write** the file until `chmod g+w` was applied. 
- A user outside the group (e.g., `sudhanshu` in `managers`) was denied even directory listing until `chmod o+rwx` was applied to the directory. 
- Key insight: **directory permission gates access to files inside it** — even if a file grants group read, the user must also have execute permission on the parent directory. 

### Sudo and `/etc/sudoers`

- **Purpose:** Allows specific users/groups to run privileged commands without knowing the root password. 
- **File location:** `/etc/sudoers` — only root can read/edit it. Use `visudo` or `vi /etc/sudoers` with force-write (`w!`) to save. 
- **Entry format in** **`/etc/sudoers`****:**
```plaintext

<user>  ALL=(ALL)  <command>
```
    - First `ALL` = applicable on all hosts/servers 
    - Second `ALL` = can run the command as any user 
    - Third field = specific commands allowed (use full path, e.g., `/usr/bin/yum`) 
- **Finding command paths:** `which <command>` returns the full executable path (e.g., `which yum` → `/usr/bin/yum`). 
- **Granting permissions to a group** (preferred over per-user entries):
```plaintext

%devs  ALL=(ALL)  /usr/bin/yum
```
The `%` prefix denotes a group name. 
- **Removing password prompt:** Add `NOPASSWD:` before the command list so sudo doesn't ask for a password. 
- **Predefined command aliases** in `/etc/sudoers` (e.g., `NETWORKING`, `SOFTWARE`, `SERVICES`) group related commands together for easier management. 
- **Why** **`ec2-user`** **has sudo access:** The `ec2-user` belongs to the `wheel` group, which has a pre-existing entry in `/etc/sudoers` granting full sudo privileges. 
- **Best practice:** Grant access only when needed (least privilege). Never give blanket access and then remove selectively — always start with no access and add as required. 

### YUM Package Manager

- **Repository configuration:** Stored in `/etc/yum.repos.d/`. Each `.repo` file defines a repository with name, URL (or mirrorlist), enabled flag, and GPG settings. 
- **Mirrorlist:** Allows YUM to automatically select the **geographically nearest** repository mirror for faster downloads, instead of always connecting to a single hardcoded URL. 
- **EPEL Repository (Extra Packages for Enterprise Linux):**
    - Contains thousands of community-maintained packages not available in the default Amazon Linux / Red Hat repos. 
    - Add by creating `/etc/yum.repos.d/epel.repo` with the EPEL URL and GPG key. 
    - YUM automatically searches all configured repos and resolves cross-repo dependencies. 
- **GPG Signature Verification:**
    - Protects against **man-in-the-middle attacks** where a package could be replaced with malicious code. 
    - The repository maintainer signs packages with a **private key**; you validate with their **public key** (provided in the repo config as `gpgkey`). 
    - If even one bit of the package changes, the signature validation fails and installation is blocked. 
- **Key YUM commands:**


|         Command          |                     Purpose                      |
|--------------------------|--------------------------------------------------|
| `yum install <pkg>`      | Install a package (auto-resolves dependencies)   |
| `yum remove <pkg>`       | Remove a package and its dependencies            |
| `yum update <pkg>`       | Update a package to the latest version           |
| `yum search <term>`      | Search for packages by name/keyword              |
| `yum info <pkg>`         | Detailed info: version, repo, description, URL   |
| `yum list installed`     | List all installed packages                      |
| `yum history`            | View installation/removal history                |
| `yum repolist`           | List all configured repositories                 |
| `yum whatprovides <cmd>` | Find which package provides a specific command   |
| `rpm -q <pkg>`           | Query if a package is installed and show version |

- **`yum whatprovides`** is especially useful when you know a command exists but don't know its package name (e.g., `yum whatprovides vi` → `vim` package). 


---

### Why Directory Permissions Block File Access

Even if a file has `r` permission for a group, members of that group **cannot read the file** if they lack at least **execute (****`x`****) permission on the parent directory**. The `x` permission on a directory means "permission to traverse/enter" it — without it, the OS won't even let you look inside. This is why `ls -la` (not just `ls -l`) is important: it shows the dot (`.`) entry representing the current directory itself and its permissions. 
### Default Group Behavior on `useradd`

When you run `useradd dev2`, Linux **automatically creates a group named** **`dev2`** and adds the user to it. This is the default private group behavior. The user's GID in `/etc/passwd` will point to this auto-created group unless you explicitly assign them to another group with `-g` or `usermod -G`. 
### Octal vs. Symbolic `chmod`

Both achieve the same result but work differently:
- **Symbolic** (`chmod g+rw file`) is additive/subtractive — it modifies existing permissions
- **Octal** (`chmod 764 file`) is **absolute** — it sets all three permission layers at once, replacing whatever was there before. `chmod 764` means: owner=rwx(7), group=rw(6), others=r(4) 

### The `/etc/sudoers` Entry Structure in Full

```plaintext
dev2  ALL=(ALL)  NOPASSWD: /usr/bin/yum, /usr/bin/systemctl start httpd
```
- `dev2` — who this applies to (use `%groupname` for groups) 
- First `ALL` — on which hosts (all servers if centrally managed) 
- `(ALL)` — run as which user (ALL means any user, effectively root) 
- `NOPASSWD:` — skip password prompt 
- Command list — exact full paths of allowed commands 

### Why Resource Exhaustion Killed YUM

During the demo, `yum install` was killed by the kernel (OOM killer) because the `t2.micro` instance had only **1 vCPU and 1GB RAM**. Dependency resolution and GPG validation are memory-intensive for the first run. The fix was upgrading to `t2.medium` (2 vCPU, 4GB RAM) via AWS instance type change — possible only when the instance is **stopped** first. 
### Private vs. Public Repositories

The EPEL and Amazon Linux repos are **public** (internet-accessible). In real companies, there are often **private internal repositories** hosting custom-built packages. You configure them the same way in `/etc/yum.repos.d/` but with authentication. Sub-dependencies of private packages may still require internet access if they're not mirrored locally. 

---
## Might show up on the exam

- **Permission octal values:**
    - `r = 4`, `w = 2`, `x = 1`
    - `7 = rwx`, `6 = rw-`, `5 = r-x`, `4 = r--`, `0 = ---`
    - `chmod 755` → owner: rwx, group: r-x, others: r-x 
- **Three permission layers always apply in order:** owner → group → others. Linux checks which category the accessing user falls into and applies **only that category's permissions** (not additive). 
- **`d`** **vs** **`-`** **as first character in** **`ls -l`****:** `d` = directory, `-` = regular file; this matters for understanding what permissions mean. 
- **`chown`** **requires root** — regular users cannot change file ownership even if they own the file. 
- **`/etc/shadow`** **is root-readable only** — general users get "permission denied" when trying to read it. 
- **`su`** **from root → any user:** no password required. `su` from regular user → another user: password required. 
- **`%`** **prefix in** **`/etc/sudoers`** = group entry (e.g., `%wheel`, `%devs`). 
- **`which <command>`** returns the full path of an executable — always use full paths in `/etc/sudoers` entries. 
- **YUM dependency resolution:** YUM automatically installs sub-dependencies, potentially pulling from multiple repos simultaneously. 
- **GPG check purpose:** Prevents installing tampered packages by verifying the cryptographic signature using the repo's public key. 
- **`yum whatprovides <command>`** identifies which package provides a given binary — useful when package name ≠ command name. 
- **EPEL = Extra Packages for Enterprise Linux** — community-maintained packages not in the default Red Hat/Amazon Linux repos. 
- **Home directory auto-creation:** `useradd` automatically creates `/home/<username>` for each new user. 
- **`usermod -G <group> <user>`** adds an existing user to an existing group without removing them from current groups (use `-aG` to append safely in practice). 
