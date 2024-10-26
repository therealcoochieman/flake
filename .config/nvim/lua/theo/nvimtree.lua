local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
    vim.notify("nvimtree could not be loaded")
    return
end

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

nvim_tree.setup {
    diagnostics = {
        enable = true,
    },
    git = {
        enable = false,
    },
}
