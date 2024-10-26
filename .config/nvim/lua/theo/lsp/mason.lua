-- local ok, installer = pcall(require, "mason")
-- if not ok then
--     vim.notify("Could not load LSP installer!", "error")
--     return
-- end

local servers = {
    "clangd",
    "nil_ls",
}

-- installer.setup({
--     ui = {
--         icons = {
--             package_installed = "✓",
--             package_pending = "➜ ",
--             package_uninstalled = "✗"
--         }
--     },
-- 
     log_level = vim.log.levels.INFO,
-- })

-- local mason = require("mason-lspconfig")
-- mason.setup({
-- 	ensure_installed = servers,
-- 	automatic_installation = true,
-- })

vim.lsp.set_log_level("debug")
local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
    vim.notify("Could not load LSP!", "error")
    return
end

--mason.setup_handlers({
--    function(server) lspconfig[server].setup({})
--    end
--})

local opts = {}

for _, server in pairs(servers) do
    opts = {
        on_attach = require("theo.lsp.handlers").on_attach,
        capabilities = require("theo.lsp.handlers").capabilities,
    }

    server = vim.split(server, "@")[1]
    local require_ok, conf_opts = pcall(require, "theo.lsp.settings." .. server)
    if require_ok then
        opts = vim.tbl_deep_extend("force", conf_opts, opts)
    else
        opts = vim.tbl_deep_extend("force", {}, opts)
    end

    lspconfig[server].setup(opts)
end
