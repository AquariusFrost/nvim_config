return {
  "GustavEikaas/easy-dotnet.nvim",
  dependencies = { "nvim-lua/plenary.nvim", "folke/snacks.nvim", "mfussenegger/nvim-dap" },
  config = function()
    -- Check if EasyDotnet global tool is installed, if not, install it.
    local function ensure_easydotnet_tool()
      local check_cmd = vim.fn.system("dotnet tool list -g")
      if not string.find(check_cmd:lower(), "easydotnet") then
        vim.notify("Installing EasyDotnet global tool...", vim.log.levels.INFO)
        vim.fn.system("dotnet tool install -g EasyDotnet")
      end
    end
    -- Run check asynchronously to not block startup
    vim.schedule(ensure_easydotnet_tool)

    local dotnet = require("easy-dotnet")
    dotnet.setup({
      picker = "snacks",
      lsp = {
        enabled = false, -- Disabled because we use roslyn.nvim
      },
      debugger = {
        engine = "netcoredbg",
        auto_register_dap = true,
      },
      test_runner = {
        neotest_integration = true,
      },
      auto_bootstrap_namespace = {
        type = "block_scoped",
        enabled = true,
      },
    })

    -- .NET specific keymaps
    vim.keymap.set("n", "<leader>nr", dotnet.run_profile, { desc = "Run .NET project with profile" })
    vim.keymap.set("n", "<leader>nb", dotnet.build_default_quickfix, { desc = "Build .NET project" })
    vim.keymap.set("n", "<leader>nt", dotnet.test_default, { desc = "Test .NET project" })
    vim.keymap.set("n", "<leader>ntt", dotnet.testrunner, { desc = "Open .NET test runner UI" })
    vim.keymap.set("n", "<leader>nd", dotnet.debug_profile, { desc = "Debug .NET project" })
    vim.keymap.set("n", "<leader>ns", dotnet.secrets, { desc = "Manage .NET user secrets" })
    vim.keymap.set("n", "<leader>no", dotnet.outdated, { desc = "Check outdated NuGet packages" })
    vim.keymap.set("n", "<leader>nc", dotnet.clean, { desc = "Clean .NET project" })
    vim.keymap.set("n", "<leader>nR", dotnet.restore, { desc = "Restore .NET packages" })
    vim.keymap.set("n", "<leader>np", dotnet.new, { desc = "Create new .NET project/template" })
  end
}
