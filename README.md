# Frosty Neovim Configuration

A cross-platform Neovim configuration that works seamlessly on Linux, Windows, and macOS.

## Platform-Specific Requirements

### All Platforms

**Required:**
- **Neovim 0.10+** - Required for `vim.fs.joinpath()` API and modern features
- **Git** - Required for:
  - Plugin management (lazy.nvim)
  - Git operations (vim-fugitive)
  - Git file search (Telescope)

**Recommended:**
- **Node.js & npm** - Required by many LSP servers installed via Mason:
  - TypeScript/JavaScript: `vtsls`, `eslint`
  - Vue: `vue-language-server`
  - And many others
- **Python 3** - Required for Python LSP servers (pyright, etc.)
- **Ripgrep (rg)** - Significantly improves Telescope grep performance
  - Install: https://github.com/BurntSushi/ripgrep

### Linux-Specific

**Clipboard Support:**
- Required for system clipboard operations (`<leader>y`, `<leader>Y`)
- Install one of the following via your package manager:

**X11 (most common):**
```bash
# Ubuntu/Debian
sudo apt install xclip
# or
sudo apt install xsel

# Arch
sudo pacman -S xclip

# Fedora
sudo dnf install xclip
```

**Wayland:**
```bash
# Ubuntu/Debian
sudo apt install wl-clipboard

# Arch
sudo pacman -S wl-clipboard

# Fedora
sudo dnf install wl-clipboard
```

**Godot Game Engine Integration:**
- The Godot LSP integration (`godot_init.lua`) only runs on Linux/Unix
- Windows and macOS users: Godot support requires additional setup (not included)

### Windows

**No additional dependencies required!**
- Clipboard works out of the box (Win32 API)
- All core features work natively

**Optional:**
- Install Ripgrep via Chocolatey: `choco install ripgrep`
- Or download from: https://github.com/BurntSushi/ripgrep/releases

### macOS

**No additional dependencies required!**
- Clipboard works out of the box (`pbcopy`/`pbpaste`)
- All core features work natively

**Optional:**
- Install Ripgrep via Homebrew: `brew install ripgrep`

---

## Key Features

### Cross-Platform Path Handling
All paths use `vim.fs.joinpath()` and `vim.fn.stdpath()` for proper cross-platform compatibility:
- **Linux:** `~/.local/share/nvim/`, `~/.cache/nvim/`, `~/.config/nvim/`
- **Windows:** `%LOCALAPPDATA%\nvim-data\`, `%LOCALAPPDATA%\nvim\`, etc.
- **macOS:** `~/Library/Application Support/nvim/`, etc.

### Undo History
Persistent undo files stored in Neovim's data directory:
- **Linux:** `~/.local/share/nvim/undodir/`
- **Windows:** `%LOCALAPPDATA%\nvim-data\undodir\`
- **macOS:** `~/Library/Application Support/nvim/undodir/`

### Project Navigation
Press `<leader>pp` to open the **project picker** (cross-platform replacement for tmux-sessionizer):
- Automatically detects Git repositories as projects
- Maintains recently-opened project history
- Quick switching between different codebases
- Works identically on all platforms

---

## Key Bindings

### Project Management
- `<leader>pp` - **Pick project** (Telescope project picker)
- `<leader>pf` - **Find files** in current project
- `<leader>ps` - **Project search** (grep in files)
- `<leader>pv` - **Project view** (netrw file explorer)

### Telescope (Fuzzy Finding)
- `<C-p>` - Git files
- `<leader>vh` - Help tags

### Clipboard (System Integration)
- `<leader>y` - Copy to system clipboard (visual/normal)
- `<leader>Y` - Copy line to system clipboard
- **Note:** Linux requires xclip/xsel/wl-clipboard installed

### LSP (Language Server)
- Automatically installed via Mason
- See `lua/frosty/init.lua` for full LSP keybinding list

---

## Installation

1. **Backup existing config** (if any):
   ```bash
   # Linux/macOS
   mv ~/.config/nvim ~/.config/nvim.backup
   
   # Windows (PowerShell)
   mv $env:LOCALAPPDATA\nvim $env:LOCALAPPDATA\nvim.backup
   ```

2. **Clone this repository:**
   ```bash
   # Linux/macOS
   git clone <your-repo-url> ~/.config/nvim
   
   # Windows (PowerShell)
   git clone <your-repo-url> $env:LOCALAPPDATA\nvim
   ```

3. **Install platform dependencies** (see above)

4. **Launch Neovim:**
   ```bash
   nvim
   ```
   
5. **Wait for lazy.nvim** to install all plugins automatically

6. **Run health check:**
   ```vim
   :checkhealth
   ```

---

## Plugin Management

Plugins are managed by [lazy.nvim](https://github.com/folke/lazy.nvim) and automatically installed on first launch.

**Key Commands:**
- `:Lazy` - Open plugin manager UI
- `:Lazy update` - Update all plugins
- `:Lazy clean` - Remove unused plugins

---

## LSP Server Management

LSP servers are automatically installed via [mason.nvim](https://github.com/williamboman/mason.nvim).

**Key Commands:**
- `:Mason` - Open Mason UI to install/manage LSP servers
- `:MasonUpdate` - Update Mason registry
- `:LspInfo` - Show active LSP servers for current buffer

**Configured LSP Servers:**
- Lua (lua_ls)
- TypeScript/JavaScript (vtsls)
- Vue (vue-language-server + volar)
- Python (pyright)
- Java (jdtls)
- C# (roslyn)
- Rust (rust-analyzer)
- Go (gopls)
- And more...

---

## Troubleshooting

### Clipboard not working (Linux)
```bash
# Check if clipboard provider is available
:checkhealth

# Install missing provider (see Platform-Specific Requirements above)
```

### Plugin installation fails
```bash
# Ensure Git is installed and accessible
git --version

# Check lazy.nvim logs
:Lazy log
```

### LSP server not starting
```vim
# Check LSP status
:LspInfo

# Open Mason to install missing servers
:Mason
```

### Undo history not persisting
```vim
# Check if undodir exists
:echo stdpath('data') . '/undodir'

# Verify undodir is set correctly
:set undodir?
```

---

## Contributing

Contributions welcome! Please ensure any changes maintain cross-platform compatibility.

---

## License

MIT
