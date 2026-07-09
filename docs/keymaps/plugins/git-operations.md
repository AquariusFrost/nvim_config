### Git Operations

#### Fugitive (Git Interface)

- [normal] <leader>gs : Open Git status window using vim-fugitive (interactive git interface for staging, committing, diffing, viewing history)

#### Gitsigns - Hunk Navigation

- [normal] ]c : Jump to next git hunk (changed block) in buffer (in diff mode, jumps to next diff section instead)
- [normal] [c : Jump to previous git hunk in buffer (in diff mode, jumps to previous diff section instead)

#### Gitsigns - Leader + h Prefix (Hunk Operations)

- [normal] <leader>hs : Stage the hunk under cursor (adds the change to git staging area)
- [visual] <leader>hs : Stage the selected lines as a partial hunk (stage only specific lines from a hunk, allows fine-grained staging)
- [normal] <leader>hr : Reset (discard) the hunk under cursor (reverts the change to match HEAD, permanently discards changes)
- [visual] <leader>hr : Reset the selected lines (revert only specific lines, discards those changes)
- [normal] <leader>hS : Stage entire buffer (equivalent to git add for current file, stages all hunks)
- [normal] <leader>hu : Undo the last hunk staging operation (unstage last staged hunk, moves it back to unstaged)
- [normal] <leader>hR : Reset entire buffer (discard all changes in file, revert entire file to HEAD state)
- [normal] <leader>hp : Preview hunk under cursor in floating window (shows diff without opening full diff view)
- [normal] <leader>hi : Preview hunk inline (shows diff in virtual text within buffer, non-intrusive preview)
- [normal] <leader>hb : Show full git blame for current line in floating window (author, date, commit hash, commit message)
- [normal] <leader>hd : Open diff view comparing current buffer to index (shows unstaged changes, what would be staged)
- [normal] <leader>hD : Open diff view comparing current buffer to HEAD~ (shows changes against last commit, includes staged and unstaged)

#### Gitsigns - Leader + t Prefix (Git Toggles)

- [normal] <leader>tb : Toggle inline git blame display for current line (shows author and commit info as virtual text at end of line)
- [normal] <leader>td : Toggle display of deleted lines (shows removed lines as virtual text, helps visualize deletions)

#### Gitsigns - Text Objects

- [operator-pending] ih : Inner hunk text object (operates on current git hunk, e.g., 'dih' deletes hunk, 'yih' yanks hunk, 'vih' selects hunk)
- [visual] ih : Select current git hunk in visual mode (selects all lines in the hunk for visual operations)

---
