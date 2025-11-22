local keymap = vim.keymap.set

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

keymap("n", "<C-d>", "<C-d>zz", { desc = "Scroll down and center" })
keymap("n", "<C-u>", "<C-u>zz", { desc = "Scroll up and center" })

keymap({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete without yanking" })

keymap("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Replace word under cursor" })

keymap("n", "<leader>ww", "<cmd>w<CR>", { desc = "Save file" })
keymap("n", "<leader>qq", "<cmd>x<CR>", { desc = "Save and quit" })

keymap("n", "<leader>e", function()
	require("oil").open()
end, { desc = "Open oil" })

keymap("n", "<leader>gh", function()
	require("gitsigns").diffthis()
end, { desc = "Show git diff in gitsigns" })

keymap("n", "<leader>a", function()
	require("harpoon"):list():add()
end, { desc = "Add file to harpoon" })

keymap("n", "<leader>h", function()
	require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())
end, { desc = "Toggle harpoon menu" })

keymap("n", "<leader>1", function()
	require("harpoon"):list():select(1)
end, { desc = "Select harpoon 1" })

keymap("n", "<leader>2", function()
	require("harpoon"):list():select(2)
end, { desc = "Select harpoon 2" })

keymap("n", "<leader>3", function()
	require("harpoon"):list():select(3)
end, { desc = "Select harpoon 3" })

keymap("n", "<leader>4", function()
	require("harpoon"):list():select(4)
end, { desc = "Select harpoon 4" })
