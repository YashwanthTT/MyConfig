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

keymap({ "n", "v" }, "<leader>y", '"+y', { desc = "Yank to system clipboard" })
keymap({ "n", "v" }, "<leader>p", '"+p', { desc = "Paste from system clipboard" })

keymap("n", "<leader>ww", "<cmd>w<CR>", { desc = "Save file" })
keymap("n", "<leader>qq", "<cmd>x<CR>", { desc = "Save and quit" })

-- Native snippet expansion
keymap({ "i", "s" }, "<Tab>", function()
	if vim.snippet.active({ direction = 1 }) then
		return "<cmd>lua vim.snippet.jump(1)<cr>"
	else
		return "<Tab>"
	end
end, { expr = true, silent = true, desc = "Jump to next snippet placeholder" })

keymap({ "i", "s" }, "<S-Tab>", function()
	if vim.snippet.active({ direction = -1 }) then
		return "<cmd>lua vim.snippet.jump(-1)<cr>"
	else
		return "<S-Tab>"
	end
end, { expr = true, silent = true, desc = "Jump to previous snippet placeholder" })

keymap("n", "<leader>ld", function()
	local enabled = vim.diagnostic.is_enabled()
	vim.diagnostic.enable(not enabled)
	vim.notify("Diagnostics " .. (enabled and "hidden" or "shown"))
end, { desc = "Toggle diagnostics" })

keymap("n", "<leader>z", function()
	local command = ""
	local source_file = vim.fn.expand("%:p")
	local executable_file = vim.fn.expand("%:p:r")
	if vim.o.filetype == "c" or vim.o.filetype == "cpp" then
		command = command .. vim.fn.expand(" -Wall")
		command = command .. vim.fn.expand(" -Wextra")
		command = command .. vim.fn.expand(" -o ")
		command = command .. executable_file
		command = command .. vim.fn.expand(" ")
		command = command .. source_file
		command = command .. vim.fn.expand(" && ")
		command = command .. executable_file
	elseif string.match(vim.fn.getline(1), "^#!/") then
		command = command .. vim.fn.shellescape(source_file)
	elseif vim.o.filetype == "python" then
		command = command .. vim.fn.expand("python3 ")
		command = command .. source_file
	else
		print("Unknown file type `" .. vim.o.filetype .. "`")
	end

	if command ~= "" then
		vim.cmd("w")
		vim.cmd("botright vsplit")
		vim.cmd("terminal " .. command)
		vim.cmd("startinsert")
	end
end, { desc = "Compile and run the current file" })
