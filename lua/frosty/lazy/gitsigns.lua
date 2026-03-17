return {
    "lewis6991/gitsigns.nvim",
    config = function()
        require('gitsigns').setup({
            signs = {
                add          = { text = '┃' },
                change       = { text = '┃' },
                delete       = { text = '_' },
                topdelete    = { text = '‾' },
                changedelete = { text = '~' },
                untracked    = { text = '┆' },
            },
            signs_staged_enable = true,
            current_line_blame = false,  -- Disabled by default, toggle with <leader>tb
            current_line_blame_opts = {
                delay = 1000,
                virt_text_pos = 'eol',
            },
            on_attach = function(bufnr)
                local gitsigns = require('gitsigns')

                local function map(mode, lhs, rhs, opts)
                    opts = opts or {}
                    opts.buffer = bufnr
                    vim.keymap.set(mode, lhs, rhs, opts)
                end

                -- Navigation between hunks
                map('n', ']c', function()
                    if vim.wo.diff then
                        vim.cmd.normal({']c', bang = true})
                    else
                        gitsigns.nav_hunk('next')
                    end
                end, { desc = "Next git hunk" })

                map('n', '[c', function()
                    if vim.wo.diff then
                        vim.cmd.normal({'[c', bang = true})
                    else
                        gitsigns.nav_hunk('prev')
                    end
                end, { desc = "Previous git hunk" })

                -- Actions (leader h prefix for "hunk")
                map('n', '<leader>hs', gitsigns.stage_hunk, { desc = "Stage hunk" })
                map('n', '<leader>hr', gitsigns.reset_hunk, { desc = "Reset hunk" })
                map('v', '<leader>hs', function()
                    gitsigns.stage_hunk({vim.fn.line('.'), vim.fn.line('v')})
                end, { desc = "Stage selected hunk" })
                map('v', '<leader>hr', function()
                    gitsigns.reset_hunk({vim.fn.line('.'), vim.fn.line('v')})
                end, { desc = "Reset selected hunk" })
                
                map('n', '<leader>hS', gitsigns.stage_buffer, { desc = "Stage entire buffer" })
                map('n', '<leader>hu', gitsigns.undo_stage_hunk, { desc = "Undo stage hunk" })
                map('n', '<leader>hR', gitsigns.reset_buffer, { desc = "Reset entire buffer" })
                
                map('n', '<leader>hp', gitsigns.preview_hunk, { desc = "Preview hunk" })
                map('n', '<leader>hi', gitsigns.preview_hunk_inline, { desc = "Preview hunk inline" })
                
                map('n', '<leader>hb', function()
                    gitsigns.blame_line({full = true})
                end, { desc = "Blame line (full)" })
                
                map('n', '<leader>hd', gitsigns.diffthis, { desc = "Diff this buffer" })
                map('n', '<leader>hD', function()
                    gitsigns.diffthis('~')
                end, { desc = "Diff against last commit" })

                -- Toggles (leader t prefix to match your toggleterm pattern)
                map('n', '<leader>tb', gitsigns.toggle_current_line_blame, { desc = "Toggle git blame" })
                map('n', '<leader>td', gitsigns.toggle_deleted, { desc = "Toggle deleted lines" })

                -- Text object for hunks
                map({'o', 'x'}, 'ih', gitsigns.select_hunk, { desc = "Select git hunk" })
            end
        })
    end
}
