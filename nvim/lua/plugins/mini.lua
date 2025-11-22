return {
	{
		"echasnovski/mini.nvim",
		version = false,
		config = function()
			require("mini.statusline").setup({
				content = {
					active = function()
						local mode = MiniStatusline.section_mode({})
						local filename = MiniStatusline.section_filename({})
						return MiniStatusline.combine_groups({
							{ hl = "MiniStatuslineMode", strings = { mode } },
							{ hl = "MiniStatuslineFilename", strings = { filename } },
						})
					end,
				},
				use_icons = true,
				set_vim_settings = true,
			})

			vim.cmd("hi! StatusLine guibg=NONE ctermbg=NONE")
			vim.cmd("hi! MiniStatuslineFileinfo guibg=NONE ctermbg=NONE")
			vim.cmd("hi! MiniStatuslineMode guibg=NONE ctermbg=NONE")
			vim.cmd("hi! MiniStatuslineFilename guibg=NONE ctermbg=NONE")
			require("mini.pairs").setup()
			require("mini.surround").setup()
			require("mini.comment").setup()
			require("mini.ai").setup()
			require("mini.splitjoin").setup()
			require("mini.starter").setup({
				items = {
					function()
						local recent_files = require("mini.starter").sections.recent_files(5, true, false)()
						for _, item in ipairs(recent_files) do
							item.section = "Recent files"
						end
						return recent_files
					end,
					{ name = "Quit", action = "qa", section = "Actions" },
				},
				content_hooks = {
					require("mini.starter").gen_hook.adding_bullet(),
					require("mini.starter").gen_hook.padding(3, 2),
					require("mini.starter").gen_hook.aligning("center", "center"),
				},
				footer = "",
				header = "",
			})
		end,
	},
}
