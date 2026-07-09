### File & Project Navigation

#### Leader + p Prefix (Project Commands)

- [normal] <leader>pf : Find all files in project using Telescope (fuzzy search across all files in current directory tree)
- [normal] <leader>pg : Find git-tracked files only using Telescope (faster than pf, git repos only, will error in non-git directories)
- [normal] <leader>ps : Project-wide grep search with Telescope (search for text content across all files, prompts for search term)
- [normal] <leader>po : Open project picker using telescope-project extension (switch between recent projects)
- [normal] <leader>pv : Open netrw file explorer in current directory (Vim's built-in file browser for browsing directory tree)

#### Ctrl-p (Smart Find)

- [normal] Ctrl-p : Smart file finder - tries git files first (with untracked), automatically falls back to all files if not in git repo (git-aware fuzzy file search)

#### Leader + v Prefix (Help)

- [normal] <leader>vh : Search Neovim help tags using Telescope (fuzzy search through :help documentation)

---
