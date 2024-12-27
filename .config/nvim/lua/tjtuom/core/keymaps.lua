vim.g.mapleader = " "
vim.g.maplocalleader = ","

local keymap = vim.keymap -- for conciseness

keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

keymap.set("n", "<esc>", "<cmd>noh<cr><esc>", { silent = true })

keymap.set({ "n", "i" }, "\x03", "<cmd>w<CR>", { desc = "Terminal compatibility to save with cmd-s" })
keymap.set({ "n", "i" }, "\x04", "<esc><cmd>q<CR>", { desc = "Terminal compatibility to quit with cmd-q" })

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

-- buffer management --

keymap.set("n", "<leader>bb", "<cmd>:b#<CR>", { desc = "Change to last open buffer" })
keymap.set("n", "<leader>bd", "<cmd>:CloseCurrentBuffer<CR>", { desc = "Kill the current buffer" })
