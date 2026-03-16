-- Check Neovim version (require 0.10+ for cross-platform compatibility)
if vim.fn.has("nvim-0.10") == 0 then
    vim.notify(
        "Frosty config requires Neovim 0.10 or later for cross-platform compatibility.\n" ..
        "Current version: " .. vim.version().major .. "." .. vim.version().minor .. "." .. vim.version().patch,
        vim.log.levels.ERROR
    )
    return
end

require("frosty")

vim.g.netrw_keepdir = 0
