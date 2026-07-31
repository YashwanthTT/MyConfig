return {
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		opts = {},
		keys = {
			{ "s", function() require("flash").jump() end, mode = { "n", "x", "o" }, desc = "Flash" },
		},
	},
}
