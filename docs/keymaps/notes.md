## Notes & Conflicts

### Keybinding Conflicts

#### Ctrl-j and Ctrl-k Conflicts (Intentional - Context-Dependent)

- **In normal navigation**: These keys are mapped to Harpoon file navigation (files 2 and 3)
- **When quickfix/location list is open**: These keys navigate quickfix entries
- **Resolution**: Context-dependent behavior. Both mappings coexist intentionally. The quickfix navigation takes precedence when the quickfix window is in focus or when quickfix list is populated.

#### Ctrl-h and Ctrl-l Conflicts (Intentional - Different Contexts)

- **For window navigation**: Use `Ctrl-w h` and `Ctrl-w l` (built-in Vim window commands)
- **For Harpoon**: Use `Ctrl-h` and `Ctrl-l` directly (custom bindings for Harpoon files 1 and 4)
- **For LSP signature help**: `Ctrl-h` in insert mode (different mode, no conflict)
- **Resolution**: Different contexts/modes prevent actual conflicts. Window navigation requires the `Ctrl-w` prefix, while Harpoon uses direct bindings.

#### [c and ]c Context-Dependent Behavior

- **In normal buffers**: Navigate between git hunks (Gitsigns)
- **In diff mode**: Navigate between diff sections (built-in behavior preserved)
- **Resolution**: Gitsigns checks for diff mode and delegates to built-in behavior when appropriate. This provides seamless integration without breaking existing diff mode workflows.

---

### Custom Overrides of Built-in Commands

#### Visual Mode Overrides

- `J` (visual): Changed from "join lines" to "move lines down" (built-in join still available in normal mode)
- `p` (visual): Built-in paste works but overwrites clipboard; use `<leader>p` to paste without overwriting clipboard

#### Normal Mode Overrides

- `J` (normal): Enhanced to keep cursor position (built-in moves cursor to join point)
- `K` (normal): Changed from "man page lookup" to "LSP hover documentation"
- `gd` (normal): Changed from "local declaration" to "LSP go to definition"
- `gi` (normal): Changed from "jump to last insert position" to "LSP go to implementation"
- `Ctrl-d` (normal): Enhanced to center cursor after scroll
- `Ctrl-u` (normal): Enhanced to center cursor after scroll
- `n` (normal): Enhanced to center and unfold
- `N` (normal): Enhanced to center and unfold
- `Q` (normal): Disabled completely (was Ex mode)

#### Insert Mode Overrides

- `Ctrl-c` (insert): Enhanced to behave exactly like Escape (built-in doesn't trigger InsertLeave autocmd)

---

### Plugin-Specific Text Objects

- `ih` text object (git hunk) is only available in buffers tracked by Git (requires gitsigns.nvim)
- `it` and `at` (tag text objects) work best with HTML/XML files and require proper tag matching

---

### Mode-Specific Behaviors

- **LSP bindings** (section: LSP): Only activate when LSP is attached to buffer. Open a file with an active language server to use these bindings.
- **Terminal mode bindings** (section: Terminal): Only work when inside a terminal buffer (created with ToggleTerm or `:terminal`)
- **Gitsigns bindings** (section: Git Operations): Only work in Git-tracked files within a Git repository
- **Visual mode bindings**: Only available when text is selected in visual mode (v, V, or Ctrl-v)
- **Operator-pending mode**: Text objects and motions that work after operators like d, c, y (e.g., diw, ci", yap)

---

## Quick Reference Summary

### Most Common Custom Bindings

**Navigation:**
- `Ctrl-p` - Smart file finder
- `<leader>pf` - Find all files
- `<leader>ps` - Project grep search
- `gd` - Go to definition
- `gi` - Go to implementation
- `<leader>vrr` - Find references

**Git:**
- `<leader>gs` - Git status
- `]c` / `[c` - Next/previous hunk
- `<leader>hs` - Stage hunk
- `<leader>hp` - Preview hunk

**Terminal:**
- `Ctrl-\` - Toggle floating terminal
- `<leader>t1/t2/t3` - Persistent terminals
- `Esc` (in terminal) - Exit to normal mode

**Clipboard:**
- `<leader>y` - Yank to system clipboard
- `<leader>p` (visual) - Paste without overwriting clipboard
- `<leader>d` - Delete without affecting clipboard

**Utilities:**
- `<leader>f` - Format buffer
- `<leader>fe` - Fix ESLint issues
- `<leader>u` - Toggle undo tree
- `Ctrl-s` - Save file

---

## Additional Resources

- **Vim/Neovim Help**: Type `:help` in Neovim to access comprehensive built-in documentation
- **LSP Info**: Use `:LspInfo` to see active language servers
- **Keymaps**: Use `:map`, `:nmap`, `:vmap`, `:imap` to see all active mappings
- **Which-key**: If installed, press `<leader>` and wait to see available leader mappings

---

*Last updated: 2026-03-17*
