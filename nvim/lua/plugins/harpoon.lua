return {

	{
		"theprimeagen/harpoon",
		branch = "harpoon2",
		keys = {
			{ "<leader>a", function() require("harpoon"):list():add() end },
			{ "<C-e>", function() require("harpoon").ui:toggle_quick_menu(require("harpoon"):list()) end },
		},
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("harpoon"):setup()
		end,
	},
}
