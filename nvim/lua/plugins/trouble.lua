return {
	{
		"folke/trouble.nvim",
		opts = { use_diagnostic_signs = true },
		cmd = "Trouble",
		keys = {
			{
				"<leader>st",
				"<cmd>Trouble<CR>",
			},
			{
				"<leader>xx",
				"<cmd>Trouble diagnostics toggle focus=true<CR>",
			},
			{
				"[d",
				"<cmd>Trouble diagnostics next focus=true<CR>",
			},
			{
				"]d",
				"<cmd>Trouble diagnostics prev focus=true<CR>",
			},
		},
	},
}
