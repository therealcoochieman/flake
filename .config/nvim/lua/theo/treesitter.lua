local ok, configs = pcall(require, "nvim-treesitter.configs")
if not ok then
    vim.notify("Treesitter could not be loaded!")
    return
end

configs.setup({
    ensure_installed = {"cpp", "python", "lua"},
    sync_installed = false,
    auto_install = true,
    ignore_install = {""},
    highlight = {
        enable = true,
        disable = {""},
        additional_vim_regex_highlighting = false, -- buggy?
    },
    indent = {
        enable = true,
    },
    rainbow = {
        enable = true,
        -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
        extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
        max_file_lines = nil, -- Do not enable for files with more than n lines, int
        -- colors = {}, -- table of hex strings
        -- termcolors = {} -- table of colour name strings
    },
    autopairs = {enable = true},
})
