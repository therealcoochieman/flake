local ok, surround = pcall(require, "nvim-surround")
if not ok then
    vim.notify("surround was not enabled")
    return
end

surround.setup({})
