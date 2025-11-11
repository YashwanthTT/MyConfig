vim.pack.add({
	{ src = "https://github.com/saghen/blink.cmp" },
})

require("blink.cmp").setup({
	completion = {
		documentation = {
			auto_show = true,
		},
	},
	sources = {
		default = { "lsp", "snippets", "path" },
	},
	keymap = {
		["<C-p>"] = { "select_prev", "fallback_to_mappings" },
		["<C-n>"] = { "select_next", "fallback_to_mappings" },
		["<CR>"] = { "select_and_accept", "fallback" },
		["<C-e>"] = { "cancel", "fallback" },
		["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
		["<Tab>"] = { "snippet_forward", "fallback" },
		["<S-Tab>"] = { "snippet_backward", "fallback" },
		["<C-b>"] = { "scroll_documentation_up", "fallback" },
		["<C-f>"] = { "scroll_documentation_down", "fallback" },
		["<C-k>"] = { "show_signature", "hide_signature", "fallback" },
	},
	fuzzy = {
		implementation = "lua",
	},
})
