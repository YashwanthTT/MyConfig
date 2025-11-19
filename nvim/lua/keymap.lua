vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Changed : to ;
vim.keymap.set({ "n", "v", "x" }, ";", ":")
vim.keymap.set({ "n", "v", "x" }, ":", ";")

-- Normal Mode
vim.keymap.set("n", "<leader>o", "<cmd>so<cr>")
vim.keymap.set("n", "<leader>ww", "<cmd>write<cr>")
vim.keymap.set("n", "<leader>qq", "<cmd>quit<cr>")

-- Split focus
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- Window management
vim.keymap.set("n", "<leader>wd", "<cmd>close<cr>")
vim.keymap.set("n", "<leader>wv", "<cmd>vsplit<cr>")
vim.keymap.set("n", "<leader>wh", "<cmd>split<cr>")

vim.keymap.set("n", "<leader>rr", [[:%s/\<<C-r><C-w>\>//g<Left><Left>]], { desc = "Live preview replace" })

vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { noremap = true, silent = true })
