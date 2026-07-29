vim.pack.add({ "https://github.com/folke/snacks.nvim" })

-- Snacks.nvim configuration
-- Changed: Removed Lazy.nvim spec wrapper. Calls setup() directly and sets keymaps imperatively.

require("snacks").setup({
	bigfile = { enabled = true },
	indent = { enabled = true },
	notifier = {
		enabled = true,
		timeout = 1000,
	},
	picker = {
		enabled = true,
		sources = {
			undo = {
				layout = {
					fullscreen = false,
					layout = {
						box = "horizontal",
						width = 0.9,
						height = 0.9,
						{
							box = "vertical",
							border = true,
							title = "{title} {live} {flags}",
							width = 0.3,
							{ win = "input", height = 1, border = "bottom" },
							{ win = "list", border = "none" },
						},
						{ win = "preview", title = "{preview}", border = true, width = 0.7 },
					},
				},
			},
		},
	},
	quickfile = { enabled = true },
	scope = { enabled = true },
	scroll = { enabled = true },
	statuscolumn = {
		enabled = true,
		left = { "mark", "sign", "git" },
		right = { "fold" },
		folds = {
			open = false,
			git_hl = false,
		},
		git = {
			patterns = { "GitSign", "MiniDiffSign" },
		},
		refresh = 50,
	},
	words = { enabled = true },
	styles = {
		notification = {
			-- wo = { wrap = true } -- Wrap notifications
		},
	},
})

-- Keymaps (previously in Lazy.nvim keys spec)
local keymap = vim.keymap.set

-- find
keymap("n", "<leader>fc", function()
	Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
end, { desc = "Find Config File" })
keymap("n", "<leader><space>", function()
	Snacks.picker.files()
end, { desc = "Find Files" })
-- git
keymap("n", "<leader>gl", function()
	Snacks.picker.git_log()
end, { desc = "Git Log" })
-- Grep
keymap("n", "<leader>sg", function()
	Snacks.picker.grep()
end, { desc = "Grep" })
-- search
keymap("n", "<leader>sd", function()
	Snacks.picker.diagnostics()
end, { desc = "Diagnostics" })
keymap("n", "<leader>su", function()
	Snacks.picker.undo()
end, { desc = "Undo History" })
-- LSP
keymap("n", "gd", function()
	Snacks.picker.lsp_definitions()
end, { desc = "Goto Definition" })
keymap("n", "gD", function()
	Snacks.picker.lsp_declarations()
end, { desc = "Goto Declaration" })
keymap("n", "gr", function()
	Snacks.picker.lsp_references()
end, { desc = "References" })
keymap("n", "gI", function()
	Snacks.picker.lsp_implementations()
end, { desc = "Goto Implementation" })
keymap("n", "gy", function()
	Snacks.picker.lsp_type_definitions()
end, { desc = "Goto T[y]pe Definition" })
keymap("n", "gai", function()
	Snacks.picker.lsp_incoming_calls()
end, { desc = "C[a]lls Incoming" })
keymap("n", "gao", function()
	Snacks.picker.lsp_outgoing_calls()
end, { desc = "C[a]lls Outgoing" })
keymap("n", "<leader>un", function()
	Snacks.notifier.hide()
end, { desc = "Dismiss All Notifications" })
