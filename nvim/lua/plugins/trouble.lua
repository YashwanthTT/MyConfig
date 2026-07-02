vim.pack.add({ "https://github.com/folke/trouble.nvim" })

-- Trouble.nvim configuration (diagnostics UI)
-- Changed: Removed Lazy.nvim spec wrapper. Calls setup() directly and sets keymaps.

require("trouble").setup({ use_diagnostic_signs = true })

vim.keymap.set("n", "<leader>st", "<cmd>Trouble<CR>")
vim.keymap.set("n", "<leader>xx", "<cmd>Trouble diagnostics toggle focus=true<CR>")
vim.keymap.set("n", "[d", "<cmd>Trouble diagnostics next focus=true<CR>")
vim.keymap.set("n", "]d", "<cmd>Trouble diagnostics prev focus=true<CR>")
