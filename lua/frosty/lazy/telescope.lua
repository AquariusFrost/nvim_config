
return {

	'nvim-telescope/telescope.nvim',
	
	dependencies = {
		"plenary",
		"nvim-telescope/telescope-project.nvim",
	},

	config = function()
		local builtin = require('telescope.builtin')
		local telescope = require('telescope')
		
		-- Configure telescope with project extension
		telescope.setup({
			extensions = {
				project = {
					base_dirs = {
						{vim.fn.getcwd()},  -- Only track current directory
					},
					hidden_files = false,
					theme = "dropdown",
					order_by = "recent",
					search_by = {"title", "path"},
				}
			}
		})
		
		-- Load project extension
		telescope.load_extension('project')
		
		-- Find files in current project
		vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = "Find files" })
		
		-- Git files
		vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = "Git files" })
		
		-- Project search (grep)
		vim.keymap.set('n', '<leader>ps', function()
			builtin.grep_string({ search = vim.fn.input("Grep > ")})
		end, { desc = "Project search" })
		
		-- Help tags
		vim.keymap.set('n', '<leader>vh', builtin.help_tags, { desc = "Help tags" })
		
		-- Project picker (cross-platform replacement for tmux-sessionizer)
		vim.keymap.set('n', '<leader>pp', function()
			telescope.extensions.project.project({
				display_type = 'full'  -- Show full path for clarity
			})
		end, { desc = "Pick project" })
	end
}
