-- Check Neovim version (require 0.10+ for cross-platform compatibility)
if vim.fn.has("nvim-0.10") == 0 then
    vim.notify(
        "Frosty config requires Neovim 0.10 or later for cross-platform compatibility.\n" ..
        "Current version: " .. vim.version().major .. "." .. vim.version().minor .. "." .. vim.version().patch,
        vim.log.levels.ERROR
    )
    return
end

-- Configure Python provider for cross-platform compatibility
-- Python 3 is required for some plugins and LSP servers (pyright, etc.)
vim.g.loaded_python_provider = 0  -- Disable Python 2 support (deprecated)

-- Platform-specific Python executable detection
if vim.fn.has("win32") == 1 then
    -- Windows: Try multiple Python detection methods
    -- 1. 'py' launcher (Python.org installer, recommended)
    -- 2. 'python' (manual PATH setup or Chocolatey/Scoop)
    -- 3. 'python3' (Windows Store Python)
    local py_launcher = vim.fn.exepath("py")
    local python_cmd = vim.fn.exepath("python")
    local python3_cmd = vim.fn.exepath("python3")
    
    if py_launcher ~= "" then
        vim.g.python3_host_prog = "py"
    elseif python_cmd ~= "" then
        vim.g.python3_host_prog = "python"
    elseif python3_cmd ~= "" then
        vim.g.python3_host_prog = "python3"
    end
else
    -- Unix-like: Use 'python3' by default
    -- Mason-installed LSPs will use this for Python-based servers
    vim.g.python3_host_prog = "python3"
end

require("frosty")

vim.g.netrw_keepdir = 0
