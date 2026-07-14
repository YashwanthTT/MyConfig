vim.pack.add({
	"https://github.com/saghen/blink.cmp",
	"https://github.com/saghen/blink.lib",
	"https://github.com/rafamadriz/friendly-snippets",
})

-- Blink.cmp configuration

local cmp = require("blink.cmp")

cmp.setup({
	keymap = {
		preset = "default",
		["<CR>"] = { "accept", "fallback" },
		-- Unbind Tab from blink so copilot.lua owns it for ghost text
		-- ["<Tab>"] = {},
		-- ["<S-Tab>"] = {},
	},
	appearance = {
		use_nvim_cmp_as_default = true,
		nerd_font_variant = "mono",
	},
	sources = {
		default = { "lsp", "path", "snippets", "buffer" },
	},
	completion = {
		documentation = { auto_show = true, auto_show_delay_ms = 500 },
		-- Disable blink's ghost text so it doesn't conflict with copilot.lua
		-- ghost_text = { enabled = false },
	},
	signature = {
		enabled = true,
	},
})
