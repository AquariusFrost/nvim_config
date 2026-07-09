### Utilities

#### Leader + u Prefix (Undo Tree)

- [normal] <leader>u : Toggle undotree visualization panel (shows undo history as tree structure, allows navigation to any previous text state, visualizes undo branches)

#### Leader + f Prefix (Format/Fix)

- [normal] <leader>f : Format current buffer using attached LSP formatter (applies code formatting rules, uses Prettier for JS/TS/React/Vue, applies consistent style)
- [normal] <leader>fe : Fix all auto-fixable ESLint issues in current buffer (applies ESLint auto-fixes like import sorting, unused vars removal, spacing fixes)

#### Quickfix & Location Lists

- [normal] Ctrl-k : Jump to next entry in quickfix list and center cursor (used for compiler errors, search results, grep matches) - **NOTE: Conflicts with Harpoon file 3 navigation when not in quickfix context**
- [normal] Ctrl-j : Jump to previous entry in quickfix list and center cursor (navigate backwards through quickfix entries) - **NOTE: Conflicts with Harpoon file 2 navigation when not in quickfix context**
- [normal] <leader>k : Jump to next entry in location list and center cursor (location list is window-local, often used by LSP diagnostics, grep results)
- [normal] <leader>j : Jump to previous entry in location list and center cursor (navigate backwards through location list entries)

#### Leader + Leader (Config Reload)

- [normal] <leader><leader> : Source (reload) current file (re-executes current buffer as Vim script, useful for config development and testing changes)

#### Ctrl + s (Save)

- [normal] Ctrl-s : Save current buffer to file (write changes to disk, convenient alternative to :w)

---
