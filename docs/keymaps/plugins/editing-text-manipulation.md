### Editing & Text Manipulation

#### Visual Mode - Line Movement

- [visual] J : Move selected lines down one line and reindent (preserves selection after move, maintains proper indentation) - **OVERRIDES: built-in join lines in visual mode**
- [visual] K : Move selected lines up one line and reindent (preserves selection after move, maintains proper indentation)

#### Normal Mode - Enhanced Navigation

- [normal] J : Join current line with line below, keeping cursor at original position (prevents cursor jump to join point, more predictable behavior) - **OVERRIDES: built-in J which moves cursor to join point**
- [normal] Ctrl-d : Scroll down half page and center cursor vertically in window (keeps context visible around cursor) - **OVERRIDES: built-in Ctrl-d which doesn't center**
- [normal] Ctrl-u : Scroll up half page and center cursor vertically in window (keeps context visible around cursor) - **OVERRIDES: built-in Ctrl-u which doesn't center**
- [normal] n : Jump to next search match, center in window, and unfold any folds (keeps search result visible and accessible) - **OVERRIDES: built-in n which doesn't center or unfold**
- [normal] N : Jump to previous search match, center in window, and unfold any folds (keeps search result visible and accessible) - **OVERRIDES: built-in N which doesn't center or unfold**

#### Clipboard Operations

- [normal] <leader>y : Yank (copy) to system clipboard (integrates with OS clipboard, works across applications, uses "+ register)
- [visual] <leader>y : Yank selected text to system clipboard (copy selection to OS clipboard for pasting in other applications)
- [normal] <leader>Y : Yank entire current line to system clipboard (includes newline, quick way to copy full line to clipboard)
- [visual] <leader>p : Paste over selection without overwriting clipboard (pastes but deletes to void register "_d, preserves clipboard for multiple pastes)
- [normal] <leader>D : Delete to void register (black hole delete, doesn't affect any named registers or clipboard, true deletion)
- [visual] <leader>D : Delete selected text to void register (removes text without polluting registers)

#### Leader + s Prefix (Search & Replace)

- [normal] <leader>s : Start global search and replace for word under cursor (pre-fills substitution command :%s/word/word/gI with word under cursor, cursor positioned to type replacement text)

#### Insert Mode

- [insert] Ctrl-c : Exit insert mode (acts exactly like Escape, triggers InsertLeave autocmd properly) - **OVERRIDES: built-in Ctrl-c which doesn't trigger InsertLeave autocmd**

#### Disabled Commands

- [normal] Q : No operation (disabled to prevent accidental Ex mode entry, Ex mode is rarely used) - **OVERRIDES: built-in Ex mode**

---
