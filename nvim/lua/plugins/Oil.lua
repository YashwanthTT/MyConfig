return {
	{
		"stevearc/oil.nvim",
		cmd = "Oil",
		keys = {
			{
				"<leader>e",
				function()
					require("oil").open()
				end,
				desc = "Open oil",
			},
		},
		opts = {
			skip_confirm_for_simple_edits = true,
		},
		dependencies = { { "nvim-mini/mini.icons", opts = {} } },
	},
	{
		"stevearc/quicker.nvim",
		ft = "qf",
		opts = {},
	},
}
