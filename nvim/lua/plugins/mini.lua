return {
	{
		"echasnovski/mini.icons",
		lazy = false,
		config = function()
			require("mini.icons").setup()
			MiniIcons.mock_nvim_web_devicons()
		end,
	},
	{
		"echasnovski/mini.nvim",
		lazy = false,
		config = function()
			-- Mini.statusline
			require("mini.statusline").setup({
				content = {
					active = function()
						local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 120 })
						local git = MiniStatusline.section_git({ trunc_width = 40 })
						local diff = MiniStatusline.section_diff({ trunc_width = 75 })
						local filename = MiniStatusline.section_filename({ trunc_width = 140 })
						return MiniStatusline.combine_groups({
							{ hl = mode_hl, strings = { mode } },
							{ hl = "MiniStatuslineDevinfo", strings = { git, diff } },
							"%<",
							{ hl = "MiniStatuslineFilename", strings = { filename } },
						})
					end,
					inactive = function()
						return "%#MiniStatuslineInactive#%F"
					end,
				},
			})

			local mode_colors = {
				MiniStatuslineModeNormal = "#9ccfd8", -- foam
				MiniStatuslineModeInsert = "#c4a7e7", -- iris
				MiniStatuslineModeVisual = "#f6c177", -- gold
				MiniStatuslineModeReplace = "#eb6f92", -- love
				MiniStatuslineModeCommand = "#ebbcba", -- rose
				MiniStatuslineModeOther = "#ea9a97", -- rose
			}

			local statusline_highlights = {
				"MiniStatuslineModeNormal",
				"MiniStatuslineModeInsert",
				"MiniStatuslineModeVisual",
				"MiniStatuslineModeReplace",
				"MiniStatuslineModeCommand",
				"MiniStatuslineModeOther",
				"MiniStatuslineDevinfo",
				"MiniStatuslineFilename",
				"MiniStatuslineFileinfo",
				"MiniStatuslineInactive",
			}

			local function make_statusline_transparent()
				for _, group in ipairs(statusline_highlights) do
					local highlight = vim.api.nvim_get_hl(0, { name = group, link = false })
					highlight.fg = mode_colors[group] or highlight.fg
					highlight.bg = "none"
					highlight.ctermbg = "none"
					vim.api.nvim_set_hl(0, group, highlight)
				end
			end

			make_statusline_transparent()
			vim.api.nvim_create_autocmd("ColorScheme", {
				group = vim.api.nvim_create_augroup("mini_statusline_transparency", { clear = true }),
				callback = make_statusline_transparent,
			})

			require("mini.pairs").setup()
			-- require("mini.surround").setup()
			-- require("mini.comment").setup()
			require("mini.ai").setup()
			-- require("mini.splitjoin").setup()
			require("mini.hipatterns").setup({
				highlighters = {
					hex_color = require("mini.hipatterns").gen_highlighter.hex_color(),
				},
			})
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
					{ name = "Lazy", action = "Lazy", section = "Actions" },
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
	{
		"windwp/nvim-ts-autotag",
		event = { "BufReadPre", "BufNewFile" },
		opts = {},
	},
}
