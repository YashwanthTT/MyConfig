return {
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			cmdline = {
				view = "cmdline_popup",
			},
			views = {
				cmdline_popup = {
					position = {
						row = 3,
						col = "50%",
					},
					anchor = "NW",
				},
			},
		},
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
	},
}

