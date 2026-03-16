-- Set the leader key to space (used for all <leader> mappings)
vim.g.mapleader = " "

-- <leader>pv opens netrw file explorer (Ex command)
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- In visual mode, J moves the selected lines down one line
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

-- In visual mode, K moves the selected lines up one line
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- In normal mode, J joins lines but keeps cursor position
vim.keymap.set("n", "J", "mzJ`z")

-- Ctrl-d scrolls down half a page and centers the cursor
vim.keymap.set("n", "<C-d>", "<C-d>zz")

-- Ctrl-u scrolls up half a page and centers the cursor
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- When searching forward (n), keep result centered and unfolded
vim.keymap.set("n", "n", "nzzzv")

-- When searching backward (N), keep result centered and unfolded
vim.keymap.set("n", "N", "Nzzzv")

-- In visual mode, paste over selection without overwriting clipboard
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Yank (copy) to system clipboard in normal & visual modes
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])

-- Yank entire line to system clipboard
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Delete to the void register (doesn't overwrite clipboard)
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- Ctrl-c acts like Escape in insert mode
vim.keymap.set("i", "<C-c>", "<Esc>")

-- Disable Ex mode (Q) so you don't accidentally enter it
vim.keymap.set("n", "Q", "<nop>")

-- <leader>f formats current buffer using LSP
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- <leader>fe fixes all ESLint issues in current buffer
vim.keymap.set("n", "<leader>fe", ":EslintFixAll<CR>", { desc = "Fix ESLint issues" })

-- Ctrl-k jumps to next quickfix entry and centers
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")

-- Ctrl-j jumps to previous quickfix entry and centers
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")

-- <leader>k jumps to next location list item
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")

-- <leader>j jumps to previous location list item
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- <leader>s starts a global replace for the word under the cursor
vim.keymap.set("n", "<leader>s",
    [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]]
)

-- <leader><leader> reloads (sources) the current file
vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)

-- Ctrl-s saves the current file
vim.keymap.set("n", "<C-s>", function()
    vim.cmd("w")
end)

