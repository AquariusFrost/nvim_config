vim.lsp.handlers["textDocument/hover"] = function(_, result, ctx, config)
  config = config or {}
  config.focusable = true
  config.border = "rounded"
  vim.lsp.handlers.hover(_, result, ctx, config)
end
