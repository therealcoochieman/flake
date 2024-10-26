local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- function name shortcut
local keymap = vim.api.nvim_set_keymap

-- remap space as leader key?
keymap("", "<space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--     normal       n
--     insert       i
--     visual       v
--     visual block x
--     terminal     t
--     command      c

--------------------------------------------------NORMAL--------------------------------------------------

-- Window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-j>", "<C-w>j", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Telescope
local builtin = require('telescope.builtin')
local themes = require('telescope.themes')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '"', builtin.registers, {})
keymap('n', '<leader>ld', ":Telescope diagnostics bufnr=0 theme=dropdown<CR>", opts)
keymap("n", "<leader>ln", ":Telescope notify<CR>", opts)

--NvimTree
keymap("n", "<leader>e", ":NvimTreeToggle path=\"\"<CR>", opts)

-- bufferline
keymap("n", "<S-l>", "gt", opts)
keymap("n", "<S-h>", "gT", opts)
keymap("n", "<S-b>", ":BufferLinePick<CR>", opts)

-- toggleterm
 -- keymap("n", "<C-Space>", ":ToggleTerm direction=float<CR>", opts)
