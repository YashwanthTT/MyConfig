vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Changed : to ;
vim.keymap.set({ "n", "v", "x" }, ";", ":")
vim.keymap.set({ "n", "v", "x" }, ":", ";")

-- Normal Mode
vim.keymap.set("n", "<leader>o", "<cmd>so<cr>")
vim.keymap.set("n", "<leader>w", "<cmd>write<cr>")
vim.keymap.set("n", "<leader>q", "<cmd>quit<cr>")

-- Split focus
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- Window management
vim.keymap.set("n", "<leader>wd", "<cmd>close<cr>")
vim.keymap.set("n", "<leader>wv", "<cmd>vsplit<cr>")
vim.keymap.set("n", "<leader>wh", "<cmd>split<cr>")

