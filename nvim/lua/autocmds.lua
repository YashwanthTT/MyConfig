local function augroup(name)
	return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

-- check if we need to reload the file when it changed
vim.api.nvim_create_autocmd({ "focusgained", "termclose", "termleave" }, {
	group = augroup("checktime"),
	callback = function()
		if vim.o.buftype ~= "nofile" then
			vim.cmd("checktime")
		end
	end,
})

-- highlight on yank
vim.api.nvim_create_autocmd("textyankpost", {
	group = augroup("highlight_yank"),
	callback = function()
		(vim.hl or vim.highlight).on_yank()
	end,
})

-- resize splits if window got resized
vim.api.nvim_create_autocmd({ "vimresized" }, {
	group = augroup("resize_splits"),
	callback = function()
		local current_tab = vim.fn.tabpagenr()
		vim.cmd("tabdo wincmd =")
		vim.cmd("tabnext " .. current_tab)
	end,
})

-- go to last loc when opening a buffer
vim.api.nvim_create_autocmd("bufreadpost", {
	group = augroup("last_loc"),
	callback = function(event)
		local exclude = { "gitcommit" }
		local buf = event.buf
		if vim.tbl_contains(exclude, vim.bo[buf].filetype) or vim.b[buf].lazyvim_last_loc then
			return
		end
		vim.b[buf].lazyvim_last_loc = true
		local mark = vim.api.nvim_buf_get_mark(buf, '"')
		local lcount = vim.api.nvim_buf_line_count(buf)
		if mark[1] > 0 and mark[1] <= lcount then
			pcall(vim.api.nvim_win_set_cursor, 0, mark)
		end
	end,
})

-- close some filetypes with <q>
vim.api.nvim_create_autocmd("filetype", {
	group = augroup("close_with_q"),
	pattern = {
		"plenarytestpopup",
		"checkhealth",
		"dbout",
		"gitsigns-blame",
		"grug-far",
		"help",
		"lspinfo",
		"neotest-output",
		"neotest-output-panel",
		"neotest-summary",
		"notify",
		"qf",
		"spectre_panel",
		"startuptime",
		"tsplayground",
	},
	callback = function(event)
		vim.bo[event.buf].buflisted = false
		vim.schedule(function()
			vim.keymap.set("n", "q", function()
				vim.cmd("close")
				pcall(vim.api.nvim_buf_delete, event.buf, { force = true })
			end, {
				buffer = event.buf,
				silent = true,
				desc = "quit buffer",
			})
		end)
	end,
})

-- make it easier to close man-files when opened inline
vim.api.nvim_create_autocmd("filetype", {
	group = augroup("man_unlisted"),
	pattern = { "man" },
	callback = function(event)
		vim.bo[event.buf].buflisted = false
	end,
})

-- wrap and check for spell in text filetypes
vim.api.nvim_create_autocmd("filetype", {
	group = augroup("wrap_spell"),
	pattern = { "text", "plaintex", "typst", "gitcommit", "markdown" },
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.spell = true
	end,
})

-- fix conceallevel for json files
vim.api.nvim_create_autocmd({ "filetype" }, {
	group = augroup("json_conceal"),
	pattern = { "json", "jsonc", "json5" },
	callback = function()
		vim.opt_local.conceallevel = 0
	end,
})

-- auto create dir when saving a file, in case some intermediate directory does not exist
vim.api.nvim_create_autocmd({ "bufwritepre" }, {
	group = augroup("auto_create_dir"),
	callback = function(event)
		if event.match:match("^%w%w+:[\\/][\\/]") then
			return
		end
		local file = vim.uv.fs_realpath(event.match) or event.match
		vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
	end,
})

vim.cmd("autocmd BufEnter * set formatoptions-=cro")
vim.cmd("autocmd BufEnter * setlocal formatoptions-=cro")

vim.keymap.set("n", "<leader>z", function()
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
