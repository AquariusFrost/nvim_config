return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/nvim-cmp",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "j-hui/fidget.nvim",
    },

    config = function()
        local cmp = require('cmp')
        local cmp_lsp = require("cmp_nvim_lsp")
        local capabilities = vim.tbl_deep_extend(
            "force",
            {},
            vim.lsp.protocol.make_client_capabilities(),
            cmp_lsp.default_capabilities())

        require("fidget").setup({})
        require("mason").setup({
			registries = {
 				"github:mason-org/mason-registry",
    			"github:Crashdummyy/mason-registry",  -- Roslyn package
			}
		})
        require("mason-lspconfig").setup({
            ensure_installed = {
				"ts_ls",
				"cssls",
				"html",
				"pyright",
				"jdtls"
            },
            handlers = {
                -- Default handler for all servers
                function(server_name)
                    require('lspconfig')[server_name].setup{
                        capabilities = capabilities
                    }
                end,

                -- Custom handler for lua_ls
                ["lua_ls"] = function()
                    require('lspconfig').lua_ls.setup{
                        capabilities = capabilities,
                        settings = {
                            Lua = {
                                runtime = {
									version = "LuaJIT"
								},
                                diagnostics = {
                                    globals = { "vim", "it", "describe", "before_each", "after_each" },
								},
								workspace = {
									library = {
										vim.env.VIMRUNTIME,
										vim.fn.stdpath("config")
									},
									checkThirdParty = false
									},
									telemetry = {
										enable = false
									}
                                }
                            }
                        }
                end,
            }
        })

		vim.lsp.config("gdscript", {
            name = "godot",
            cmd = vim.lsp.rpc.connect("127.0.0.1", 6005),
        })

        local cmp_select = { behavior = cmp.SelectBehavior.Select }

        cmp.setup({
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
                ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
                ['<C-y>'] = cmp.mapping.confirm({ select = true }),
                ["<C-Space>"] = cmp.mapping.complete(),
            }),
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'luasnip' }, -- For luasnip users.
            }, {
                { name = 'buffer' },
            })
        })

        vim.diagnostic.config({
            -- update_in_insert = true,
            float = {
                focusable = false,
                style = "minimal",
                border = "rounded",
                source = "always",
                header = "",
                prefix = "",
            },
        })
    end
}
