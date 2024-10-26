local ok, smartcolumn = pcall(require, "smartcolumn")
if not ok then
    vim.notify("could not load smart columns!")
    return
end

smartcolumn.setup({
   colorcolumn = "80",
   disabled_filetypes = { "help", "text", "markdown" },
   custom_colorcolumn = {},
   scope = "file",
})
