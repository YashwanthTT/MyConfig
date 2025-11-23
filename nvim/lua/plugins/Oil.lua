return {
	{
		"stevearc/oil.nvim",
		---@module 'oil'
		---@type oil.SetupOpts
		cmd = "Oil",
		keys = {
			{ "-", "<cmd>Oil<cr>", desc = "Open parent directory" },
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
