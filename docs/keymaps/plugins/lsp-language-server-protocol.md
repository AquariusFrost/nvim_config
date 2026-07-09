### LSP (Language Server Protocol)

#### g-prefix Navigation

- [normal] gd : Go to definition of symbol under cursor (jumps to where symbol is defined) - **OVERRIDES: built-in local declaration**

#### Leader + v Prefix (LSP Operations)

- [normal] <leader>vws : Search for symbols across the entire workspace (find functions, classes, variables by name)
- [normal] <leader>vd : Open diagnostic float window showing detailed error/warning information for current line

*(Note: In Neovim 0.12, many LSP features are now built-in. See the built-in keymaps for `K`, `gra`, `grn`, `grr`, `gri`, `<C-s>`, `[d`, `]d`.)*

---
