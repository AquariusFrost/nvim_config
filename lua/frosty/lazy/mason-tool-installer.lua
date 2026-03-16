return {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = {
        "williamboman/mason.nvim",
    },
    opts = {
        ensure_installed = {
            -- Formatters (non-LSP tools)
            "prettierd",    -- Fast Prettier daemon for JS/TS/React/Vue
            "prettier",     -- Fallback if prettierd not available
            
            -- Note: LSP servers (vtsls, eslint, etc.) are handled by mason-lspconfig
            -- This plugin only manages tools that aren't LSP servers
        },
        auto_update = false,
        run_on_start = true,
    },
}
