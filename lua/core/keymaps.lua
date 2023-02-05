vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("n", "<leader>sv", "<C-w>v")
keymap.set("n", "<leader>sh", "<C-w>s")

keymap.set("n", "S", ":w<CR>")
keymap.set("n", "Q", ":q<CR>")
keymap.set("n", "Y", ":set relativenumber<CR>")
keymap.set("n", "U", ":set norelativenumber<CR>")
keymap.set("n", "J", "10j")
keymap.set("n", "K", "10k")
keymap.set("n", "H", "^")
keymap.set("n", "L", "$")
keymap.set("n", "<leader>h", ":nohlsearch<CR>")
keymap.set("n", "=", "n")
keymap.set("n", "-", "N")
keymap.set("n", ";", ":")

keymap.set("v", "Y", "\"+y")

-- nvim-tree
keymap.set("n", "<C-b>", ":NvimTreeToggle<CR>")

-- change buffer
keymap.set("n", "<C-]>", ":bnext<CR>")
keymap.set("n", "<C-[>", ":bprevious<CR>")
