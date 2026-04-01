return {
	'akinsho/toggleterm.nvim',
	version = "*",
	config = function()
		-- Detect shell based on OS
		local shell
		if vim.fn.has('win32') == 1 or vim.fn.has('win64') == 1 then
			-- Try PowerShell 7+ first, fallback to Windows PowerShell 5.1
			if vim.fn.executable('pwsh') == 1 then
				shell = 'pwsh.exe'
			elseif vim.fn.executable('powershell') == 1 then
				shell = 'powershell.exe'
			else
				shell = vim.o.shell -- Ultimate fallback
			end
		else
			shell = vim.o.shell -- Default shell on Unix/Linux/Mac
		end

		require("toggleterm").setup({
			-- Size configuration based on terminal direction
			size = function(term)
				if term.direction == "horizontal" then
					return 10
				elseif term.direction == "vertical" then
					return vim.o.columns * 0.4
				end
			end,
			-- Main toggle keybinding (Ctrl-\)
			open_mapping = [[<c-\>]],
			hide_numbers = true,
			shade_terminals = true,
			start_in_insert = true,
			insert_mappings = true,
			terminal_mappings = true,
			persist_size = true,
			persist_mode = true,
			-- Default direction is floating (recommended)
			direction = 'float',
			close_on_exit = true,
			-- Auto-detect shell (bash/zsh on Unix, PowerShell on Windows)
			shell = shell,
			float_opts = {
				border = 'curved',
				winblend = 0,
			},
		})

		-- Easy escape from terminal mode to normal mode
		vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]], { desc = "Exit terminal mode" })

		-- Numbered persistent terminals (horizontal splits)
		vim.keymap.set('n', '<leader>t1', '<cmd>1ToggleTerm direction=horizontal<cr>', { desc = "Toggle terminal 1" })
		vim.keymap.set('n', '<leader>t2', '<cmd>2ToggleTerm direction=horizontal<cr>', { desc = "Toggle terminal 2" })
		vim.keymap.set('n', '<leader>t3', '<cmd>3ToggleTerm direction=horizontal<cr>', { desc = "Toggle terminal 3" })

		-- Explicit float toggle (same as <C-\> but using leader key)
		vim.keymap.set('n', '<leader>tf', '<cmd>ToggleTerm direction=float<cr>', { desc = "Toggle floating terminal" })
	end
}
