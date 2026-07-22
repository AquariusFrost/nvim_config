return {
    "mfussenegger/nvim-dap",
    config = function()
        local dap = require("dap")
        vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "Debug: Start/Continue" })
        vim.keymap.set("n", "<leader>do", dap.step_over, { desc = "Debug: Step Over" })
        vim.keymap.set("n", "<leader>di", dap.step_into, { desc = "Debug: Step Into" })
        vim.keymap.set("n", "<leader>du", dap.step_out, { desc = "Debug: Step Out (Up)" })
        vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "Debug: Toggle Breakpoint" })
        vim.keymap.set("n", "<leader>dB", function() dap.set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, { desc = "Debug: Set Conditional Breakpoint" })
        vim.keymap.set("n", "<leader>dt", dap.terminate, { desc = "Debug: Terminate (Stop)" })
        vim.keymap.set("n", "<leader>dr", dap.repl.open, { desc = "Debug: Open REPL" })
        vim.keymap.set("n", "<leader>dl", dap.run_last, { desc = "Debug: Run Last" })

        dap.adapters.godot = {
            type = "server",
            host = "127.0.0.1",
            port = 6006,
        }

        dap.configurations.gdscript = {
            {
                type = "godot",
                request = "launch",
                name = "Launch scene",
                project = "${workspaceFolder}",
                launch_scene = true,
            },
        }
    end
}
