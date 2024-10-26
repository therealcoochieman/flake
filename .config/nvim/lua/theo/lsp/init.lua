local ok, lsp = pcall(require, "lspconfig")
if not ok then
    vim.notify("Could not load lsp!")
    return
end

require("theo.lsp.mason")
require("theo.lsp.handlers").setup()
-- require("theo.lsp.null-ls")
