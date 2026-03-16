-- Godot integration is only enabled on Linux/Unix systems
-- (Windows named pipes use different syntax)
if vim.fn.has("unix") == 1 then
    local pipepath = vim.fs.joinpath(vim.fn.stdpath("cache"), "server.pipe")
    if not vim.loop.fs_stat(pipepath) then
        vim.fn.serverstart(pipepath)
    end
end
