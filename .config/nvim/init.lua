-- Automatically install packer
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = vim.fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  print("Installing packer close and reopen neovim...")
  vim.cmd([[packadd packer.nvim]])
  require("theo.plugins") -- loads in packer and installs plugins
  vim.cmd([[PackerCompile]])
end

require("theo.options") -- loads in options
require("theo.keymaps") -- loads in keybindings
require("theo.notify") -- changes notification system if plugin is installed
require("theo.plugins") -- loads in packer and installs plugins
require("theo.colorscheme") -- loads in colorscheme and settings
require("theo.autopairs") -- loads in auto-pairs with settings
require("theo.surround") -- loads in surround
require("theo.completion") -- loads in completion engine and snippets
require("theo.lsp") -- loads in LSP engine and servers
require("theo.telescope") -- loads in telescopes
require("theo.treesitter") -- loads in treesitter
require("theo.nvimtree") -- loads in nvimtree
require("theo.bufferline") -- loads in bufferline
require("theo.autosave") -- loads in autosave
require("theo.toggleterm") -- loads in terminal
require("theo.smartcolumn") -- hides/shows column
require("theo.lualine") -- loads better line
