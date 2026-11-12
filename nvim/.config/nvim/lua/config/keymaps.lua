-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- toggle comment on current line, then move cursor (uses builtin `gcc`, treesitter-aware via ts-comments.nvim)
vim.keymap.set("n", "<C-A-j>", "gccj", { remap = true, desc = "Toggle comment in current line, move cursor down" })
vim.keymap.set("n", "<C-A-k>", "gcck", { remap = true, desc = "Toggle comment in current line, move cursor up" })
