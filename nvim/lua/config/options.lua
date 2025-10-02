-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

-- Increase leader‐key mapping wait time
opt.timeoutlen = 1500
opt.ttimeoutlen = 100

vim.opt.swapfile = false

vim.o.winborder = "rounded"
