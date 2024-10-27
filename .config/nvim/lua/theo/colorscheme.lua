local ok, cat_theme = pcall(require, "catppuccin")
if not ok then
        vim.notify("Could not load theme")
        return
end

cat_theme.setup({
    no_italic = false, -- Force no italic
    no_bold = false, -- Force no bold
    no_underline = false, -- Force no underline
    styles = {
        comments = { "italic" },
        keywords = { "bold" },
        functions = { "italic" },
    },
    term_colors = true, -- sets terminal colors (e.g. `g:terminal_color_0`)
    -- add integrations
    integrations = {
        notify = true,
        cmp = true,
        mason = true,
        treesitter = true,
        native_lsp = {
            enabled = true,
            virtual_text = {
                errors = { "italic" },
                hints = { "italic" },
                warnings = { "italic" },
                information = { "italic" },
            },
            underlines = {
                errors = { "underline" },
                hints = { "underline"          },
                warnings = { "underline" },
                information = { "underline" },
            },
            inlay_hints = {
                background = true,
            },
        },
    },
})

vim.cmd.colorscheme "catppuccin-macchiato"
