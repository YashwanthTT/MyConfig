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

keymap("n", "<leader>z", function()
	local command = ""
	local source_file = vim.fn.expand("%:p")
	local executable_file = vim.fn.expand("%:p:r")

	if vim.o.filetype == "c" then
		command = command .. vim.fn.expand("gcc ")
	elseif vim.o.filetype == "cpp" then
		command = command .. vim.fn.expand("g++ ")
	else
		command = command .. vim.fn.expand("chmod +x ")
		command = command .. source_file
		command = command .. vim.fn.expand(" && ")
	end
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
	elseif vim.o.filetype == "javascript" then
		command = command .. vim.fn.expand("bun ")
		command = command .. source_file
	elseif vim.o.filetype == "typescript" then
		command = command .. vim.fn.expand("bun ")
		command = command .. source_file
	elseif vim.o.filetype == "go" then
		command = command .. vim.fn.expand("go run ")
		command = command .. source_file
	elseif vim.o.filetype == "python" then
		command = command .. vim.fn.expand("python3 ")
		command = command .. source_file
	elseif vim.o.filetype == "lua" then
		command = command .. vim.fn.expand("lua ")
		command = command .. source_file
	elseif vim.o.filetype == "java" then
		command = command .. vim.fn.expand("java ")
		command = command .. source_file
	else
		print("Unknown file type `" .. vim.o.filetype .. "`")
	end

	if command ~= "" then
		vim.cmd("belowright 10 split")
		vim.cmd("terminal " .. command)
		vim.cmd("startinsert")
	end
end, { desc = "Compile and run the current file" })
