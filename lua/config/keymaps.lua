-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- Terminal Mappings
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = "Hide Terminal" })
vim.keymap.set("n", "oo", "o<Esc>k", { desc = "add newline below" })
vim.keymap.set("n", "OO", "O<Esc>j", { desc = "add newline above" })
vim.keymap.set("i", "<C-j>", "<Esc><C-j>", { remap = true, desc = "switch windows in insert mode" })
vim.keymap.set("i", "<C-k>", "<Esc><C-k>", { remap = true, desc = "switch windows in insert mode" })
vim.keymap.set("i", "<C-h>", "<Esc><C-h>", { remap = true, desc = "switch windows in insert mode" })
vim.keymap.set("i", "<C-l>", "<Esc><C-l>", { remap = true, desc = "switch windows in insert mode" })
vim.keymap.set({ "n", "i" }, "<C-g>", "<C-b>", { remap = true, desc = "scroll upwards" })
vim.keymap.set("n", "Q", "q", { remap = false, desc = "Record macro" })
vim.keymap.set("n", "q", "<nop>")
