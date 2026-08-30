## Concept

- **Git** is a **Distributed Version Control System (DVCS)** — every developer holds a full copy of the repository including commit history and branches. 
- Advanced Git operations allow developers to **integrate changes between branches**, **rewrite history**, **undo mistakes**, and **temporarily shelve incomplete work**. 

---



### Merge Strategies

- **Fast-forward**: Used when no new commits exist on the target branch since the feature branch was created — commits are simply appended. 
- **ORT / Recursive (3-way merge)**: Used when both branches have diverged; creates an extra **merge commit** to reconcile histories. 
- **Octopus Strategy**: Merges multiple branches into one target branch in a single command using `-s octopus`. 
- **Squash Merge**: Compresses all feature branch commits into **one single commit** before merging, keeping master history clean and readable. 

### Cherry Pick

- Picks **specific commits** from one branch and applies them to another — useful when you only want one change, not a full merge. 
- Supports single commit IDs or a range of commits. 

### Merge Conflicts

- Occur when the **same line in the same file** is modified differently in two branches. 
- Resolved using `git mergetool` or VS Code's conflict editor — choose "current," "incoming," or a custom combined resolution. 
- After resolving, stage the file and commit to complete the merge. 

### Rebase vs. Merge

- **Merge** preserves exact history, arranging commits by time — history can appear scattered. 
- **Rebase** rewrites history to create a **linear timeline**, giving the appearance that the feature branch started from the latest master commit. 
- Rebase changes **commit IDs** — only use it **before pushing to GitHub**; after pushing, it causes conflicts for other developers. 
- **Interactive Rebase** (`git rebase -i HEAD~N`) allows: `reword` (edit message), `edit` (amend commit), `squash` (combine commits), `drop` (delete commit). 

### Reset

- **Soft reset**: Moves pointer back; changes return to **staging area** — use when you forgot to include a file in a commit. 
- **Mixed reset** (default): Moves pointer back; changes return to **working area** — use when unwanted files were accidentally staged and committed. 
- **Hard reset**: Moves pointer back and **deletes changes entirely** from working area — use when changes are completely unwanted. 
- Reset should only be used **locally before pushing** to GitHub. 

### Revert

- Used when a bad commit has **already been pushed to GitHub** — creates a **new commit** that undoes the previous one without removing history. 
- Safer than reset in shared/team environments because it preserves the commit log. 

### Git Stash

- Temporarily stores **incomplete, uncommitted changes** so you can switch branches without carrying over unfinished work. 
- `git stash save "message"` → shelves changes; `git stash apply` → restores without clearing stash; `git stash pop` → restores and clears stash. 
- Conflicts can occur on `stash apply` if the same file was modified after stashing — resolved the same way as merge conflicts. 

---



- **Why does rebase change commit IDs?** When Git rewrites history, it recalculates each commit's hash based on its parent — since the parent changes (now points to a new base), the hash must change too. This is why others who already pulled your branch will have mismatched histories.
- **Soft vs. Mixed reset confusion**: Think of it this way — soft puts things back in the "ready to commit" zone (staging); mixed puts things back in the "still editing" zone (working directory).
- **When to use squash vs. normal merge**: Use squash when your feature branch has many messy/WIP commits and you want master to show only one clean entry. Use normal merge when commit-level history is important for traceability.

---



- [ ] **Fast-forward** only works when the target branch has **no new commits** since branching 
- [ ] **3-way merge (ORT)** always creates a **merge commit**; fast-forward does not 
- [ ] **Cherry-pick** applies a specific commit by ID — does **not** copy the commit ID, only the data 
- [ ] **Rebase rewrites history** → commit IDs change → never rebase after pushing to a shared branch 
- [ ] `git rebase -i HEAD~3` = interactive rebase on last 3 commits 
- [ ] **Soft reset** → changes go to **staging area** 
- [ ] **Mixed reset** → changes go to **working area** 
- [ ] **Hard reset** → changes are **permanently deleted** 
- [ ] **Reset** = local only; **Revert** = safe for pushed commits (adds a new undo commit) 
- [ ] `git stash pop` = apply + clear stash; `git stash apply` = apply only (stash remains) 
- [ ] `.gitignore` prevents tracked files (e.g., `.env`, `node_modules`) from being pushed to GitHub 
