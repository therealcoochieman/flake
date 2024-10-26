local ok, autosave = pcall(require, "auto-save")
if not ok then
    vim.notify("autosave was not loaded!")
    return
end

autosave.setup {
    -- your config goes here
    -- or just leave it empty :)
    execution_message = {
        message = function() -- message to print on save
            vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]
            return ""
        end,
        dim = 0.18, -- dim the color of `message`
    },
}
