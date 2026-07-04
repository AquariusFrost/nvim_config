return {
	'nvim-java/nvim-java',
	dependencies = {
		'mfussenegger/nvim-dap',
		'MunifTanjim/nui.nvim',
		'JavaHello/spring-boot.nvim',
	},
	config = function()
		require('java').setup()
		vim.lsp.enable('jdtls')

		vim.keymap.set('n', '<leader>co', function()
			vim.lsp.buf.code_action({
				context = { only = { 'source.organizeImports' } },
				apply = true,
			})
		end)
	end,
}
