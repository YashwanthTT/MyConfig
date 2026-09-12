local vim = vim
local function augroup(name)
	return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

-- highlight on yank
vim.api.nvim_create_autocmd("textyankpost", {
	group = augroup("highlight_yank"),
	callback = function()
		(vim.highlight).on_yank()
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

local UI = {
	width = 0.4,
	row = 0.08,
	timeout = 500,
	prompt_icon = "❯",
}

require("vim._core.ui2").enable({
	msg = {
		targets = { default = "msg" },
		msg = { timeout = UI.timeout },
	},
})

local ui = require("vim._core.ui2")
local messages = require("vim._core.ui2.messages")
local cmdline = require("vim._core.ui2.cmdline")

local function center_cmdline()
	local win = ui.wins.cmd
	if not vim.api.nvim_win_is_valid(win) then
		return
	end
	local width = math.floor(vim.o.columns * UI.width)
	vim.api.nvim_win_set_config(win, {
		relative = "editor",
		anchor = "NW",
		row = math.floor(vim.o.lines * UI.row),
		col = math.floor((vim.o.columns - width) / 2),
		width = width,
		border = "single",
	})
end

local function style_notification()
	local win = ui.wins.msg
	if vim.api.nvim_win_is_valid(win) then
		vim.api.nvim_win_set_config(win, { border = "none" })
	end
end

local check_targets = ui.check_targets
function ui.check_targets()
	check_targets()
	center_cmdline()
	style_notification()
end

local set_pos = messages.set_pos
function messages.set_pos(target)
	set_pos(target)
	if target == nil or target == "cmd" then
		center_cmdline()
	end
	if target == nil or target == "msg" then
		style_notification()
	end
end

local function pin_cmdheight()
	if vim.o.cmdheight == 0 then
		return
	end
	vim._with({ noautocmd = true, o = { splitkeep = "screen" } }, function()
		vim.o.cmdheight = 0
	end)
end

for _, name in ipairs({ "cmdline_show", "cmdline_hide" }) do
	local original = cmdline[name]
	cmdline[name] = function(...)
		original(...)
		pin_cmdheight()
	end
end

local prompt_ns = vim.api.nvim_create_namespace("cmdline_prompt")
local function restyle_prompt()
	local buf = ui.bufs.cmd
	if not vim.api.nvim_buf_is_valid(buf) then
		return
	end
	local srow, erow = ui.cmd.srow, ui.cmd.erow
	vim.api.nvim_buf_clear_namespace(buf, prompt_ns, srow, erow + 1)
	for row = srow, erow do
		local line = vim.api.nvim_buf_get_lines(buf, row, row + 1, false)[1]
		if line and line:sub(1, 1) == ":" then
			vim.api.nvim_buf_set_extmark(buf, prompt_ns, row, 0, {
				virt_text = { { UI.prompt_icon, "Special" } },
				virt_text_pos = "overlay",
			})
		end
	end
end

for _, name in ipairs({ "cmdline_show", "cmdline_block_show", "cmdline_block_append" }) do
	local original = cmdline[name]
	cmdline[name] = function(...)
		original(...)
		restyle_prompt()
	end
end

vim.api.nvim_create_autocmd({ "VimEnter", "VimResized", "TabEnter" }, { callback = center_cmdline })
