return {
	"seblyng/roslyn.nvim",
	ft = { "cs", "razor" },
	init = function()
		-- Set the command here so it's available BEFORE the plugin's `plugin/roslyn.lua`
		-- calls `vim.lsp.enable("roslyn")`.
		local roslyn_cmd = vim.fs.joinpath(vim.fn.stdpath("data"), "mason", "bin", "roslyn")
		local roslyn_log_dir = vim.fs.joinpath(vim.fn.stdpath("data"), "roslyn_logs")
		-- Ensure the log directory exists
		vim.fn.mkdir(roslyn_log_dir, "p")
		vim.lsp.config("roslyn", {
			cmd = {
				roslyn_cmd,
				"--stdio",
				"--logLevel=Information",
				"--extensionLogDirectory=" .. roslyn_log_dir
			}
		})
	end,
	config = function(_, opts)
		require("roslyn").setup(opts)
	end,
}
