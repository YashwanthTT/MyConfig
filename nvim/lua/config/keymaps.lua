local keymap = vim.keymap.set
local vim = vim

keymap({ "n", "v", "x" }, ";", ":")
keymap({ "n", "v", "x" }, ":", ";")

keymap("n", "<Esc>", "<cmd>nohlsearch<CR>")

keymap("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

keymap("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
keymap("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
keymap("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
keymap("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

keymap("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move line down" })
keymap("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move line up" })

-- Window management
keymap("n", "<leader>wd", "<cmd>close<cr>")
keymap("n", "<leader>wv", "<cmd>vsplit<cr>")
keymap("n", "<leader>wh", "<cmd>split<cr>")

keymap("n", "<leader>rr", [[:%s/\<<C-r><C-w>\>//g<Left><Left>]], { desc = "Live preview replace" })

keymap("n", "<leader>ww", "<cmd>w<CR>", { desc = "Save file" })
keymap("n", "<leader>qq", "<cmd>x<CR>", { desc = "Save and quit" })

-- GitSigns
keymap("n", "<leader>gh", "<cmd>Gitsigns<CR>", { desc = "Gitsigns" })
