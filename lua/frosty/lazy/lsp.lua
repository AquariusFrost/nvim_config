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
				"github:Crashdummyy/mason-registry", -- Roslyn package
			}
		})
		
		-- Get Vue language server path (cross-platform)
		-- Mason installs to stdpath("data")/mason on all platforms
		local mason_path = vim.fs.joinpath(vim.fn.stdpath("data"), "mason")
		local vue_path = vim.fs.joinpath(
			mason_path,
			"packages",
			"vue-language-server",
			"node_modules",
			"@vue",
			"language-server"
		)
		
		require("mason-lspconfig").setup({
			ensure_installed = {
				"vtsls",
				"cssls",
				"html",
				"pyright",
				"jdtls",
				"tailwindcss",
				"vue_ls",
				"eslint"  -- React Hooks validation, Vue/JS/TS linting
			},
			automatic_enable = true,
		})

		vim.lsp.config("lua_ls", {
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
		})
		vim.lsp.config("vue_ls", {
			capabilities = capabilities,
			filetypes = { "vue" }
		})

	-- vtsls provides TypeScript language server with native React support
	-- JSX/TSX works out-of-the-box (no plugin needed, unlike Vue)
	vim.lsp.config("vtsls", {

		capabilities = capabilities,
		filetypes = {
			"javascript",
			"javascriptreact",     -- React .jsx files
			"javascript.jsx",
			"typescript",
			"typescriptreact",     -- React .tsx files (TypeScript + JSX)
			"typescript.tsx",
			"vue",                 -- Vue.js (via @vue/typescript-plugin)
		},
		settings = {
			vtsls = {
				tsserver = {
					globalPlugins = {
						{
							name = "@vue/typescript-plugin",
							location = vue_path,
							languages = { "vue" },
							configNamespace = "typescript",
						},
					}
				}
			}
		},
		-- Dynamically load Effect language service plugin if found in project
		on_new_config = function(new_config, new_root_dir)
			local effect_path = vim.fs.joinpath(
				new_root_dir,
				"node_modules",
				"@effect",
				"language-service"
			)
			
			if vim.fn.isdirectory(effect_path) == 1 then
				-- Add Effect plugin when available in project node_modules
				table.insert(
					new_config.settings.vtsls.tsserver.globalPlugins,
					{
						name = "@effect/language-service",
						location = effect_path,
						languages = { "javascript", "typescript", "javascriptreact", "typescriptreact" },
						enableForWorkspaceTypeScriptVersions = true,
					}
				)
			end
		end,
	})

		vim.lsp.config("tailwindcss", {
			filetypes = {
				"html", "css", "scss",
				"javascript", "javascriptreact",
				"typescript", "typescriptreact",
				"vue", -- include Vue
			},
		})
		vim.lsp.enable("tailwindcss")

		-- ESLint LSP for React Hooks validation and linting
		-- Prettier handles formatting (via conform.nvim), ESLint handles code quality
		-- eslint-config-prettier disables conflicting ESLint formatting rules
		vim.lsp.config("eslint", {
			capabilities = capabilities,
			filetypes = {
				"javascript",
				"javascriptreact",
				"typescript",
				"typescriptreact",
				"vue",
			},
			settings = {
				format = false,  -- Prettier handles formatting, not ESLint
				run = "onType",
			},
		})
		vim.lsp.enable("eslint")

		-- Manual ESLint fix command (no auto-fix on save)
		vim.api.nvim_create_user_command("EslintFixAll", function()
			local bufnr = vim.api.nvim_get_current_buf()
			local eslint_client = vim.lsp.get_clients({ bufnr = bufnr, name = "eslint" })[1]
			
			if not eslint_client then
				vim.notify("ESLint LSP not attached to this buffer", vim.log.levels.WARN)
				return
			end
			
			eslint_client.request_sync("workspace/executeCommand", {
				command = "eslint.applyAllFixes",
				arguments = {
					{
						uri = vim.uri_from_bufnr(bufnr),
						version = vim.lsp.util.buf_versions[bufnr],
					},
				},
			}, nil, bufnr)
			
			vim.notify("ESLint fixes applied", vim.log.levels.INFO)
		end, { desc = "Fix all ESLint problems for current buffer" })

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
