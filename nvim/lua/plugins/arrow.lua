return {
	{
		"otavioschwanck/arrow.nvim",
		opts = {
			show_icons = false,
			hide_handbook = true,
			leader_key = "<Plug>(arrow-disabled)",
		},
		keys = {
			{
				"<leader>h",
				function()
					require("arrow.ui").openMenu()
				end,
				desc = "Arrow bookmarks",
			},
			{
				"<leader>1",
				function()
					require("arrow.persist").go_to(1)
				end,
				desc = "Arrow bookmark 1",
			},
			{
				"<leader>2",
				function()
					require("arrow.persist").go_to(2)
				end,
				desc = "Arrow bookmark 2",
			},
			{
				"<leader>3",
				function()
					require("arrow.persist").go_to(3)
				end,
				desc = "Arrow bookmark 3",
			},
			{
				"<leader>4",
				function()
					require("arrow.persist").go_to(4)
				end,
				desc = "Arrow bookmark 4",
			},
			{
				"<leader>5",
				function()
					require("arrow.persist").go_to(5)
				end,
				desc = "Arrow bookmark 5",
			},
			{
				"<leader>6",
				function()
					require("arrow.persist").go_to(6)
				end,
				desc = "Arrow bookmark 6",
			},
			{
				"<leader>7",
				function()
					require("arrow.persist").go_to(7)
				end,
				desc = "Arrow bookmark 7",
			},
			{
				"<leader>8",
				function()
					require("arrow.persist").go_to(8)
				end,
				desc = "Arrow bookmark 8",
			},
			{
				"<leader>9",
				function()
					require("arrow.persist").go_to(9)
				end,
				desc = "Arrow bookmark 9",
			},
		},
	},
}
