return {
	{
		"stevearc/oil.nvim",
		---@module 'oil'
		---@type oil.SetupOpts
		cmd = "Oil",
		keys = { { "-", "<cmd>Oil<cr>", desc = "Open parent directory" } },
		opts = {},
		dependencies = { { "nvim-mini/mini.icons", opts = {} } },
	},
	{
		"stevearc/quicker.nvim",
		ft = "qf",
		---@module "quicker"
		---@type quicker.SetupOptions
		opts = {},
	},
}
