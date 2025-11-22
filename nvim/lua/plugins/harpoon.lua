return {

	{
		"theprimeagen/harpoon",
		branch = "harpoon2",
		keys = (function()
			local keys = {
				{
					"<leader>H",
					function()
						require("harpoon"):list():add()
					end,
					desc = "Add file to harpoon",
				},
				{
					"<leader>h",
					function()
						require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())
					end,
					desc = "Toggle harpoon menu",
				},
			}
			for i = 1, 9 do
				table.insert(keys, {
					"<leader>" .. i,
					function()
						require("harpoon"):list():select(i)
					end,
					desc = "Select harpoon " .. i,
				})
			end
			return keys
		end)(),
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("harpoon"):setup()
		end,
	},
}
