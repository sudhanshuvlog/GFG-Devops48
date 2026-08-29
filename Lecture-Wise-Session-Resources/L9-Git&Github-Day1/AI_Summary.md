## Concept

- **Git** is a free, open-source, **distributed version control system (VCS)** that tracks changes to files across time, enabling developers to manage multiple versions of code, revert to older states, and collaborate efficiently. 
- **GitHub** is a cloud-based **centralized repository** where developers push local Git commits so teammates can access, review, and build upon shared code. 

---


**Core Git Workflow (3-Stage Architecture)**

- **Working Area** → where files are created/edited 
- **Staging Area** → files moved here via `git add` when ready to commit; allows selective staging (not all modified files need to be committed together) 
- **Commit Area** → permanent version snapshot created via `git commit -m "message"`; each commit gets a unique 40-character **commit ID** and metadata (author, timestamp) 

**Key Commands**

- `git init` — initializes a hidden `.git` directory to begin tracking a project 
- `git status` — shows which files are untracked, modified, or staged 
- `git log` — displays full commit history with IDs, authors, and messages 
- `git config --global user.email / user.name` — sets author identity globally; can be overridden per-repo (useful when working with multiple clients) 

**Connecting Local Git to GitHub**

- `git remote add origin <URL>` — links local repo to GitHub using an alias (`origin`) 
- Authentication via **SSH** (recommended): generate key pair with `ssh-keygen`, add public key to GitHub Settings → SSH Keys; private key stays local for passwordless login 
- `git push` — sends local commits to GitHub; `git pull` = `git fetch` + `git merge` to sync remote changes locally 

**Branching**

- Branches allow **isolated, parallel development** (e.g., separate branches per bug or feature) 
- `git branch <name>` / `git switch <name>` — create and switch branches 
- Child branches **inherit** the full commit history of the parent branch at creation time 
- Delete merged branches with `git branch -d <name>` to keep the repo clean 

**Merge Strategies**

- **Fast-Forward Merge**: parent branch had no new commits while feature branch was active — commits are simply appended on top 
- **3-Way Merge (ORT/Recursive)**: parent branch received new commits during feature development — Git arranges commits chronologically and creates an extra **merge commit** to mark the merge event 

**Pull Requests (PRs)**

- In real workflows, developers **never push directly to master**; instead they push to a feature branch and open a PR 
- A **reviewer** (senior dev) must approve before merging; CI checks (unit tests, SonarQube) can be integrated into the PR process 
- After merge, the feature branch is deleted 

**Forking & Open Source Contribution**

- **Fork** = copy of another repo into your own GitHub account; lets you make changes without direct repo access 
- After changes, open a PR from your fork to the original repo; owner reviews and merges if approved 

---


**`git fetch`** **vs** **`git pull`**

- `git fetch` only downloads metadata/history from remote — it does **not** change your local files 
- `git merge origin/master` then applies those fetched changes to your local branch
- `git pull` does both steps in one command — use it when you simply want to stay up to date

**`git checkout`** **vs** **`git switch`**

- `git switch` is the modern, dedicated command for branch operations 
- `git checkout` is the older multi-purpose command — still works for switching branches AND restoring/undoing file changes; not deprecated 

**`.gitignore`**

- A file listing patterns (e.g., `*.csv`) that Git should always ignore — even `git add .` will skip them 
- Different from leaving a file in the working area intentionally; `.gitignore` is a permanent rule, not a per-commit choice

**`git reflog`**

- More detailed than `git log` — records every HEAD movement (checkouts, merges, resets), useful for recovering lost commits 

---


- **3-stage architecture names**: Working Area → Staging Area → Commit Area 
- **`git add .`** stages all changed files; **`git add <file>`** stages selectively — know when to use each 
- **Commit ID**: auto-generated, 40-character, unique per commit 
- **`--global`** **flag** in `git config` applies settings to all repos; omitting it applies only to the current repo 
- **Fast-forward** requires no divergence on parent branch; **3-way merge** occurs when parent has new commits — produces a merge commit 
- **`git pull`** **=** **`git fetch`** **+** **`git merge`** — this equivalence is commonly tested 
- **SSH auth flow**: public key stored on GitHub, private key on local machine; GitHub encrypts a challenge with public key, client decrypts with private key to prove identity 
- **Fork ≠ Branch**: fork is a full repo copy across accounts; branch is within the same repo 
- **Pull Request purpose**: code review gate before merging to master; protects production branch integrity 
