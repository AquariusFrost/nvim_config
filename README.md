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

**Required for Treesitter parser compilation:**
- **Zig compiler** - Required to compile Treesitter parsers (replaces Visual Studio requirement)
  - **Recommended:** Install via [Scoop](https://scoop.sh/) package manager:
    ```powershell
    scoop install zig
    ```
  - **Alternative:** Chocolatey: `choco install zig`
  - **Manual:** Download from https://ziglang.org/download/ and add to PATH
  - **Verify installation:** Open new terminal and run `zig version`

**Required for Python-based LSP servers:**
- **Python 3** - Required for language servers (pyright, etc.) and some plugins
  - **Recommended:** Download from https://www.python.org/downloads/
  - **IMPORTANT:** Check "Add Python to PATH" during installation
  - **Install pynvim:** After Python is installed, run:
    ```powershell
    python -m pip install --user pynvim
    ```
  - **Verify installation:** `py --version` or `python --version` in terminal

**Clipboard Support:**
- ✅ Works out of the box (Win32 API) - no additional tools needed

**Optional (Recommended):**
- **Ripgrep** - Significantly improves Telescope grep performance
  - Scoop: `scoop install ripgrep`
  - Chocolatey: `choco install ripgrep`
  - Manual: https://github.com/BurntSushi/ripgrep/releases

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
Press `<leader>po` to open the **project picker** (cross-platform replacement for tmux-sessionizer):
- Automatically detects Git repositories as projects
- Maintains recently-opened project history
- Quick switching between different codebases
- Works identically on all platforms

---

## Key Bindings

### Project Management
- `<leader>po` - **Open project** (Telescope project picker)
- `<leader>pf` - **Find files** (all files in current directory)
- `<leader>pg` - **Git files** (only git-tracked files, git repos only)
- `<leader>ps` - **Project search** (grep in files)
- `<leader>pv` - **Project view** (netrw file explorer)

### Telescope (Fuzzy Finding)
- `<C-p>` - **Smart find** (git files in repos, all files otherwise)
- `<leader>vh` - **Help tags**

**Note:** `<C-p>` automatically detects if you're in a git repository and shows git files (including untracked). If not in a git repo, it shows all files instead.

### Terminal Management
- `<C-\>` - **Toggle floating terminal** (quick overlay)
- `<leader>t1` - **Toggle terminal 1** (persistent horizontal split)
- `<leader>t2` - **Toggle terminal 2** (persistent horizontal split)
- `<leader>t3` - **Toggle terminal 3** (persistent horizontal split)
- `<leader>tf` - **Toggle floating terminal** (alternative to `<C-\>`)
- `<Esc>` - Exit terminal mode to normal mode (when in terminal)

**Common workflow:**
- Terminal 1: Dev server (e.g., `npm run dev`)
- Terminal 2: Test watcher (e.g., `npm test --watch`)
- Terminal 3: General commands (git, builds, etc.)
- Float terminal: Quick one-off commands

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
   git clone https://github.com/AquariusFrost/nvim_config.git ~/.config/nvim
   
   # Windows (PowerShell)
   git clone https://github.com/AquariusFrost/nvim_config.git $env:LOCALAPPDATA\nvim
   ```

3. **Install platform dependencies** (see above)

4. **Launch Neovim:**
   ```bash
   nvim
   ```
   
5. **Wait for lazy.nvim** to install all plugins automatically

6. **Windows users: Install additional dependencies**
   
   Open a new PowerShell window and install required tools:
   
   ```powershell
   # Install Zig compiler (required for Treesitter parser compilation)
   scoop install zig
   # If you don't have Scoop, install it first: https://scoop.sh/
   # Alternative: choco install zig (if using Chocolatey)
   
   # Install pynvim (required for Python provider)
   python -m pip install --user pynvim
   ```
   
   After installation, restart Neovim to apply changes.

7. **Run health check:**
   ```vim
   :checkhealth
   ```
   
   **Important checks for Windows users:**
   - `:checkhealth provider` - Verify Python 3 is detected
   - `:checkhealth nvim-treesitter` - Verify Zig compiler is found
   
   If either check fails, see the Troubleshooting section below.

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

### Treesitter parser compilation fails (Windows)

**Error:** `stdio.h: No such file or directory` or compilation errors when running `:TSInstall`

**Root cause:** No C compiler found or compiler not configured properly

**Solution:**

1. **Install Zig compiler** (recommended approach):
   ```powershell
   # Using Scoop (recommended)
   scoop install zig
   
   # OR using Chocolatey
   choco install zig
   ```

2. **Verify Zig is in PATH:**
   ```powershell
   # Open a NEW terminal window (important!)
   zig version
   ```
   
   Should output: `0.xx.x` or similar

3. **Restart Neovim and test parser installation:**
   ```vim
   nvim
   :checkhealth nvim-treesitter
   ```
   
   Should show: `OK zig: ... (zig 0.xx.x)`

4. **Install a parser to verify:**
   ```vim
   :TSInstall lua
   ```
   
   Should compile without errors

**Alternative (if you have Visual Studio installed):**
- Open "Developer Command Prompt for VS" (not regular PowerShell/cmd)
- Launch Neovim from that prompt: `nvim`
- **Note:** This requires always launching Neovim from the VS Developer prompt

**If Zig installation fails:**
- Ensure you have Administrator access (Scoop/Chocolatey may require it)
- Try manual installation: https://ziglang.org/download/
- Extract the zip file and add the directory to your PATH environment variable

### Python provider not working (Windows)

**Check status:**
```vim
:checkhealth provider
```

**If Python not found:**

1. **Install Python** (if not already installed):
   - Download from: https://www.python.org/downloads/
   - **CRITICAL:** Check "Add Python to PATH" during installation
   - Restart your terminal after installation

2. **Install pynvim:**
   ```powershell
   # Try all three commands (one should work):
   py -m pip install --user pynvim
   python -m pip install --user pynvim
   python3 -m pip install --user pynvim
   ```

3. **Verify Python is accessible:**
   ```powershell
   # Try each command - at least one should work:
   py --version
   python --version
   python3 --version
   ```

4. **Restart Neovim and check health:**
   ```vim
   nvim
   :checkhealth provider
   ```
   
   Should show: `OK Python 3 provider: ... (python 3.xx.x)`

**If still not working (manual PATH setup):**

1. Find your Python installation directory:
   ```powershell
   # Windows search for "python.exe" or check:
   C:\Users\YourName\AppData\Local\Programs\Python\Python312\
   # or (Windows Store Python):
   C:\Users\YourName\AppData\Local\Microsoft\WindowsApps\
   ```

2. Add Python to PATH:
   - Press `Win + R`, type `sysdm.cpl`, press Enter
   - Go to "Advanced" tab → "Environment Variables"
   - Under "User variables", select "Path" → "Edit"
   - Click "New" and add your Python directory
   - Click "OK" on all dialogs
   - **Restart your terminal and Neovim**

3. Verify again:
   ```powershell
   # Open NEW terminal
   python --version
   nvim
   :checkhealth provider
   ```

**Quick diagnostic:**
```powershell
# Check what Python commands are available:
Get-Command py -ErrorAction SilentlyContinue
Get-Command python -ErrorAction SilentlyContinue
Get-Command python3 -ErrorAction SilentlyContinue
```

---

## Contributing

Contributions welcome! Please ensure any changes maintain cross-platform compatibility.

---

## Contributing

Contributions welcome! Please ensure any changes maintain cross-platform compatibility (Linux, Windows, macOS).

---

## Security

This config includes:
- **cloak.nvim** - Automatically hides secrets in `.env` files
- **Never commit `.env` files** - They're in `.gitignore` for safety
- **Cross-platform path handling** - No hardcoded usernames or system paths

---

## License

MIT
