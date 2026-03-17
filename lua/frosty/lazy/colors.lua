-- Theme configuration with multi-theme support and persistence

-- Apply transparent background to any theme
local function ApplyTransparentBg()
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

-- Theme persistence paths
local theme_file = vim.fn.stdpath("data") .. "/current_theme.txt"

-- Save current theme to disk
local function SaveTheme(theme_name, variant)
	local file = io.open(theme_file, "w")
	if file then
		local data = theme_name
		if variant then
			data = data .. ":" .. variant
		end
		file:write(data)
		file:close()
	end
end

-- Load persisted theme from disk
local function LoadPersistedTheme()
	local file = io.open(theme_file, "r")
	if file then
		local data = file:read("*all")
		file:close()
		local theme, variant = data:match("([^:]+):?(.*)")
		return theme, (variant ~= "" and variant or nil)
	end
	return "tokyonight", "storm" -- Default fallback
end

-- Main theme switching function
function SetTheme(theme_name, variant)
	-- Theme-specific variant handling
	local themes = {
		tokyonight = {
			variants = {"storm", "night", "moon", "day"},
			default = "storm",
			colorscheme = "tokyonight"
		},
		catppuccin = {
			variants = {"mocha", "macchiato", "frappe", "latte"},
			default = "mocha",
			colorscheme = "catppuccin"
		},
		onedark = {
			variants = {"dark", "darker", "cool", "deep", "warm", "warmer"},
			default = "dark",
			colorscheme = "onedark"
		},
		everforest = {
			variants = {"hard", "medium", "soft"},
			default = "hard",
			colorscheme = "everforest"
		},
	}

	local theme = themes[theme_name]
	if not theme then
		vim.notify("Unknown theme: " .. theme_name, vim.log.levels.ERROR)
		return
	end

	-- Use provided variant or default
	local selected_variant = variant or theme.default

	-- Validate variant
	local valid_variant = false
	for _, v in ipairs(theme.variants) do
		if v == selected_variant then
			valid_variant = true
			break
		end
	end

	if not valid_variant then
		vim.notify(
			string.format("Invalid variant '%s' for %s. Available: %s",
				selected_variant, theme_name, table.concat(theme.variants, ", ")),
			vim.log.levels.ERROR
		)
		return
	end

	-- Apply theme-specific variant settings
	if theme_name == "tokyonight" then
		require("tokyonight").setup({
			style = selected_variant,
			transparent = true,
			terminal_colors = true,
			styles = {
				comments = {italic=false},
				keywords = {italic=false},
				sidebars = "dark",
				floats = "dark",
			},
		})
	elseif theme_name == "catppuccin" then
		require("catppuccin").setup({
			flavour = selected_variant,
			transparent_background = true,
			no_italic = true,
			no_bold = false,
			styles = {
				comments = {},
				conditionals = {},
			},
		})
	elseif theme_name == "onedark" then
		require("onedark").setup({
			style = selected_variant,
			transparent = true,
			code_style = {
				comments = "none",
				keywords = "none",
				functions = "none",
				strings = "none",
				variables = "none"
			},
		})
	elseif theme_name == "everforest" then
		vim.g.everforest_background = selected_variant
		vim.g.everforest_transparent_background = 1
		vim.g.everforest_disable_italic_comment = 1
	end

	-- Apply colorscheme
	vim.cmd.colorscheme(theme.colorscheme)
	ApplyTransparentBg()

	-- Save selection
	SaveTheme(theme_name, selected_variant)

	vim.notify(string.format("Theme: %s (%s)", theme_name, selected_variant))
end

-- Theme switching command with tab completion
vim.api.nvim_create_user_command("ThemeSwitch", function(opts)
	local args = vim.split(opts.args, "%s+")
	local theme_name = args[1]
	local variant = args[2]

	if not theme_name or theme_name == "" then
		vim.notify("Usage: ThemeSwitch <theme> [variant]", vim.log.levels.ERROR)
		return
	end

	SetTheme(theme_name, variant)
end, {
	nargs = "+",
	complete = function(ArgLead, CmdLine, CursorPos)
		local args = vim.split(CmdLine, "%s+")
		local themes = {"tokyonight", "catppuccin", "onedark", "everforest"}

		-- Complete theme name
		if #args <= 2 then
			local matches = {}
			for _, theme in ipairs(themes) do
				if vim.startswith(theme, ArgLead) then
					table.insert(matches, theme)
				end
			end
			return matches
		end

		-- Complete variant based on selected theme
		if #args == 3 then
			local variants_map = {
				tokyonight = {"storm", "night", "moon", "day"},
				catppuccin = {"mocha", "macchiato", "frappe", "latte"},
				onedark = {"dark", "darker", "cool", "deep", "warm", "warmer"},
				everforest = {"hard", "medium", "soft"},
			}

			local theme = args[2]
			local variants = variants_map[theme]
			if variants then
				local matches = {}
				for _, variant in ipairs(variants) do
					if vim.startswith(variant, ArgLead) then
						table.insert(matches, variant)
					end
				end
				return matches
			end
		end

		return {}
	end,
})

-- Plugin definitions
return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false,
		priority = 1000,
	},
	{
		"navarasu/onedark.nvim",
		lazy = false,
		priority = 1000,
	},
	{
		"sainnhe/everforest",
		lazy = false,
		priority = 1000,
		config = function()
			-- Load persisted theme on startup
			local theme, variant = LoadPersistedTheme()
			SetTheme(theme, variant)
		end,
	},
}