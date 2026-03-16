# Frosty Neovim Configuration

Cross-platform Neovim config for Linux, Windows, and macOS with React and Vue.js support.

## Requirements

### All Platforms
- **Neovim 0.10+** (for `vim.fs.joinpath()` API)
- **Git** (plugin management, Telescope)
- **Node.js & npm** (LSP servers: vtsls, eslint, vue-language-server)
- **Python 3** (LSP servers, optional)
- **Ripgrep** (optional, improves Telescope performance)

### Linux Only
- **Clipboard:** Install `xclip`, `xsel` (X11) or `wl-clipboard` (Wayland)
- **Godot LSP:** Works natively (Unix-only)

### Windows Only
- **Zig compiler** (Treesitter compilation): `scoop install zig`
- **Python + pynvim:** Download from python.org, then `python -m pip install --user pynvim`
- **Clipboard:** Works out of the box

### macOS
- No additional dependencies required
- Clipboard works natively (`pbcopy`/`pbpaste`)


## Installation

```bash
# Linux/macOS
git clone https://github.com/AquariusFrost/nvim_config.git ~/.config/nvim

# Windows (PowerShell)
git clone https://github.com/AquariusFrost/nvim_config.git $env:LOCALAPPDATA\nvim
```

Launch Neovim to auto-install plugins. Windows users: install Zig and Python (see Requirements).

**Health check:** `:checkhealth` (check `provider` and `nvim-treesitter` on Windows)


## Key Bindings

**Project:**
- `<leader>po` - Project picker
- `<leader>pf` - Find all files
- `<leader>pg` - Git files only
- `<leader>ps` - Grep search
- `<C-p>` - Smart find (git files in repos, all files otherwise)

**Terminal:**
- `<C-\>` - Toggle floating terminal
- `<leader>t1/t2/t3` - Toggle terminals 1/2/3 (persistent splits)
- `<Esc>` - Exit terminal mode

**Clipboard:**
- `<leader>y` - Copy to system clipboard (visual/normal)
- `<leader>Y` - Copy line to system clipboard

**Formatting (Manual):**
- `<leader>f` - Format with Prettier
- `<leader>fe` - Fix ESLint issues

**LSP:** See `:h frosty` or `lua/frosty/init.lua` for full LSP keybindings


## LSP Servers & Tools

Auto-installed via Mason. Use `:Mason` to manage servers.

**Included:**
- TypeScript/JavaScript (vtsls) - React JSX/TSX + Vue support
- ESLint (eslint) - React Hooks validation, code quality
- Vue (vue-language-server)
- Lua, Python, Java, C#, Rust, Go, and more

**Formatters:**
- Prettier (prettierd) - Fast formatting for JS/TS/React/Vue/CSS/HTML/JSON

**Commands:**
- `:Mason` - Manage LSP servers
- `:LspInfo` - Show active servers
- `:ConformInfo` - Check formatter status


## React + TypeScript Setup

**What's included:**
- Component prop intellisense (TypeScript)
- React Hooks validation (ESLint)
- JSX/TSX autocomplete and syntax highlighting
- Import intelligence

**Manual workflow:** Use `<leader>f` for Prettier formatting and `<leader>fe` for ESLint fixes

### Per-Project Setup

1. **Create `tsconfig.json`:**
```json
{
  "compilerOptions": {
    "jsx": "react-jsx",
    "esModuleInterop": true,
    "module": "esnext",
    "target": "es2015",
    "moduleResolution": "bundler",
    "strict": true
  },
  "include": ["src/**/*"]
}
```

2. **Install dependencies:**
```bash
npm install --save-dev \
  eslint \
  @typescript-eslint/parser \
  @typescript-eslint/eslint-plugin \
  eslint-plugin-react \
  eslint-plugin-react-hooks \
  eslint-config-prettier \
  prettier
```

3. **Create `.eslintrc.json`:**
```json
{
  "extends": [
    "eslint:recommended",
    "plugin:react/recommended",
    "plugin:react-hooks/recommended",
    "plugin:@typescript-eslint/recommended",
    "prettier"
  ],
  "plugins": ["react", "react-hooks", "@typescript-eslint"],
  "parser": "@typescript-eslint/parser",
  "parserOptions": {
    "ecmaVersion": "latest",
    "sourceType": "module",
    "ecmaFeatures": { "jsx": true }
  },
  "rules": {
    "react-hooks/rules-of-hooks": "error",
    "react-hooks/exhaustive-deps": "warn"
  },
  "settings": {
    "react": { "version": "detect" }
  }
}
```

**Note:** `"prettier"` must be last in extends array.

4. **Create `.prettierrc` (optional):**
```json
{
  "semi": true,
  "trailingComma": "es5",
  "singleQuote": true,
  "printWidth": 100,
  "tabWidth": 2
}
```

5. **Launch Neovim** - ESLint and TypeScript will work automatically. Use keybindings for manual formatting/fixing.


## Troubleshooting

**Clipboard not working (Linux):**
```bash
:checkhealth  # Install xclip/xsel/wl-clipboard
```

**Treesitter fails on Windows:**
```powershell
scoop install zig  # Restart terminal and Neovim
:checkhealth nvim-treesitter
```

**Python provider not found (Windows):**
```powershell
python -m pip install --user pynvim
:checkhealth provider
```

**LSP not starting:**
```vim
:LspInfo  # Check active servers
:Mason    # Install missing servers
```

For detailed troubleshooting, see `:checkhealth`


## Security

- **cloak.nvim** hides secrets in `.env` files
- `.env` files are gitignored
- No hardcoded paths or usernames

## License

MIT

