return {
    "nvim-neotest/neotest",
    dependencies = {
        "nvim-neotest/nvim-nio",
        "nvim-lua/plenary.nvim",
        "antoinemadec/FixCursorHold.nvim",
        "nvim-treesitter/nvim-treesitter",
        -- Adapters
        "nvim-neotest/neotest-python",
        "nvim-neotest/neotest-jest",
        "marilari88/neotest-vitest",
        -- easy-dotnet.nvim provides its own neotest adapter so we don't need a specific .NET adapter here
    },
    config = function()
        local neotest = require("neotest")

        neotest.setup({
            adapters = {
                require("neotest-python")({
                    dap = { justMyCode = false },
                }),
                require("neotest-jest")({
                    jestCommand = "npm test --",
                    jestConfigFile = "jest.config.js",
                    env = { CI = true },
                    cwd = function(path)
                        return vim.fn.getcwd()
                    end,
                }),
                require("neotest-vitest"),
                require("easy-dotnet").entity_test_adapter, -- the adapter exposed by easy-dotnet
            },
            output_panel = {
                enabled = true,
                open = "botright vsplit | vertical resize 50",
            },
            status = {
                virtual_text = true,
                signs = true,
            },
        })

        -- Neotest Keymaps
        vim.keymap.set("n", "<leader>tt", function() neotest.run.run() end, { desc = "Run nearest test" })
        vim.keymap.set("n", "<leader>tf", function() neotest.run.run(vim.fn.expand("%")) end, { desc = "Run tests in current file" })
        vim.keymap.set("n", "<leader>ta", function() neotest.run.run(vim.fn.getcwd()) end, { desc = "Run all tests in project" })
        vim.keymap.set("n", "<leader>td", function() neotest.run.run({ strategy = "dap" }) end, { desc = "Debug nearest test" })
        vim.keymap.set("n", "<leader>ts", function() neotest.summary.toggle() end, { desc = "Toggle test summary panel" })
        vim.keymap.set("n", "<leader>to", function() neotest.output_panel.toggle() end, { desc = "Toggle test output panel" })
        vim.keymap.set("n", "<leader>tp", function() neotest.output.open({ enter = true }) end, { desc = "Show test output in floating window" })
        vim.keymap.set("n", "[t", function() neotest.jump.prev({ status = "failed" }) end, { desc = "Jump to previous failed test" })
        vim.keymap.set("n", "]t", function() neotest.jump.next({ status = "failed" }) end, { desc = "Jump to next failed test" })
    end,
}