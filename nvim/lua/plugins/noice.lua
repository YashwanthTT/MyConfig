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
		lsp = {
			progress = {
				enabled = false,
			},
		},
		lint = {
			progress = {
				enabled = false,
			},
		},
	},
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
	},
}

