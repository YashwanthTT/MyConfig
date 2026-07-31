local vim = vim
local function augroup(name)
	return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

-- highlight on yank
vim.api.nvim_create_autocmd("textyankpost", {
	group = augroup("highlight_yank"),
	callback = function()
		(vim.hl or vim.highlight).on_yank()
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

-- open help in vertical split
vim.api.nvim_create_autocmd("BufWinEnter", {
	group = augroup("help_vertical"),
	pattern = "*",
	callback = function()
		if vim.bo.filetype == "help" then
			vim.cmd("wincmd L")
			vim.cmd("vertical resize 95")
		end
	end,
})

vim.cmd("autocmd BufEnter * set formatoptions-=cro")
vim.cmd("autocmd BufEnter * setlocal formatoptions-=cro")

vim.api.nvim_create_autocmd("VimEnter", {
	group = augroup("oil_on_dir"),
	callback = function()
		vim.defer_fn(function()
			local arg = vim.fn.argv(0)
			if arg == "." or (arg ~= "" and vim.fn.isdirectory(arg) == 1) then
				require("oil").open(arg)
			end
		end, 0)
	end,
})

-- Native LspAttach autocommand for mapping keys automatically
vim.api.nvim_create_autocmd("LspAttach", {
	group = augroup("lsp_attach"),
	callback = function(args)
		local bufnr = args.buf
		local opts = { buffer = bufnr }
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
	end,
})
