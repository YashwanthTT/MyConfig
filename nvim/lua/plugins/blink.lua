return {
	{
		"saghen/blink.cmp",
		version = "*",
		config = function()
			require("blink-cmp").setup({
				keymap = {
					preset = "default",
				},
				sources = {
					default = { "lsp", "path", "snippets", "buffer" },
				},
			})
		end,
	},
}