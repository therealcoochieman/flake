local ok, packer = pcall(require, "packer")
if not ok then
    vim.notify('require("packer") failed! is it installed?')
    return
end

packer.init({
    display = {
        open_fn = function()
            return require("packer.util").float({ border = "rounded" })
        end,
    },
})

-- plugins go here
return packer.startup(function(use)
    -- misceallenous
    use("wbthomason/packer.nvim") -- Have packer manage itself
    use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim
    use("nvim-lua/plenary.nvim") -- Useful lua functions used in lots of plugins
    use("rcarriga/nvim-notify") -- better notification system
    use("windwp/nvim-autopairs") -- autopair plugin (highly customizable!)
    use("kylechui/nvim-surround") -- cool plugin to surround text
    use("catppuccin/nvim") -- theme
    use('nyoom-engineering/oxocarbon.nvim') -- theme
    use("Pocco81/auto-save.nvim") --autosave
    use("akinsho/bufferline.nvim") -- cuter tabs
    use("akinsho/toggleterm.nvim") -- toggleterm
    use("m4xshen/smartcolumn.nvim") -- columns appear/disappear
    -- lualine
    use("nvim-lualine/lualine.nvim") -- lualine

    -- cmp plugins
    use("hrsh7th/nvim-cmp") -- The completion plugin
    use("hrsh7th/cmp-buffer") -- buffer completions
    use("hrsh7th/cmp-path") -- path completions
    use("hrsh7th/cmp-cmdline") -- cmdline completions
    use("saadparwaiz1/cmp_luasnip") -- snippet completions
    use("hrsh7th/cmp-nvim-lsp") -- LSP snippet support
    use({
        "hrsh7th/cmp-nvim-lua", -- completion for nvim config
        opt = true,
    }) -- lazy loading bc it's occasionnally used

    -- LSP
    use("neovim/nvim-lspconfig") -- LSP engine
    use("jose-elias-alvarez/null-ls.nvim") -- linters/formatters
    use("RishabhRD/lspactions") --better UX

    -- snippets
    use("L3MON4D3/LuaSnip") --snippet engine
    use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

    -- telescope plugins
    use({
        "nvim-telescope/telescope.nvim",
        tag = "0.1.3",
        requires = { { "nvim-lua/plenary.nvim" } }, -- telescope
    })
    use({
        "nvim-telescope/telescope-fzf-native.nvim",
        run = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release &&"
            .. " cmake --build build --config Release &&"
            .. " cmake --install build --prefix build",
    })

    -- treesitter plugins
    use({
        "nvim-treesitter/nvim-treesitter", -- treesitter
        run = ":TSUpdate",
    })
    use("p00f/nvim-ts-rainbow") -- rainbow brackets

    -- NvimTree
    use("kyazdani42/nvim-tree.lua") -- file explorer
    use("kyazdani42/nvim-web-devicons") -- devicons (requires a nerdfont!)

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    ---@diagnostic disable-next-line: undefined-global
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
