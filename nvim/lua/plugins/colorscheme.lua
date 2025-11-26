return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("tokyonight").setup({
				style = "night",
				transparent = true,
				terminal_colors = true,
				styles = {
					comments = { italic = true },
					keywords = { italic = true },
					functions = {},
					variables = {},
					sidebars = "transparent",
					floats = "transparent",
				},
				sidebars = { "qf", "help" },
				day_brightness = 0.3,
				hide_inactive_statusline = false,
				dim_inactive = false,
				lualine_bold = false,
				on_colors = function(colors) end,
				on_highlights = function(highlights, colors)
					-- Custom highlights for transparency
					highlights.Normal = { bg = "none" }
					highlights.NormalNC = { bg = "none" }
					highlights.SignColumn = { bg = "none" }
					highlights.StatusLine = { bg = "none" }
					highlights.StatusLineNC = { bg = "none" }
					highlights.VertSplit = { bg = "none" }
					highlights.TabLine = { bg = "none" }
					highlights.TabLineFill = { bg = "none" }
					highlights.TabLineSel = { bg = "none" }
					highlights.Pmenu = { bg = "none" }
					highlights.PmenuSel = { bg = "#7aa2f7" }
					highlights.CursorLine = { bg = "none" }
					-- Mini statusline
					highlights.MiniStatuslineMode = { bg = "none" }
					highlights.MiniStatuslineFilename = { bg = "none" }
					highlights.MiniStatuslineFileinfo = { bg = "none" }
					highlights.MiniStatuslineInactive = { bg = "none" }
					-- NeoTree
					highlights.NeoTreeNormal = { bg = "none" }
					highlights.NeoTreeNormalNC = { bg = "none" }
					highlights.NeoTreeWinSeparator = { bg = "none" }
				end,
			})

			vim.cmd.colorscheme("tokyonight")

			-- Apply extended transparency to various UI elements
			local function set_transparency()
				vim.cmd([[
					hi pmenu guibg=none ctermbg=none
					hi pmenusel guibg=#7aa2f7 ctermbg=none
					hi normal guibg=none ctermbg=none
					hi normalnc guibg=none ctermbg=none
					hi signcolumn guibg=none ctermbg=none
					hi statusline guibg=none ctermbg=none
					hi statuslinenc guibg=none ctermbg=none
					hi vertsplit guibg=none ctermbg=none
					hi tabline guibg=none ctermbg=none
					hi tablinefill guibg=none ctermbg=none
					hi tablinesel guibg=none ctermbg=none
					hi neotreenormal guibg=none ctermbg=none
					hi neotreenormalnc guibg=none ctermbg=none
					hi neotreewinseparator guibg=none ctermbg=none
					hi cursorline guibg=none ctermbg=none
					hi MiniStatuslineMode guibg=none ctermbg=none
					hi MiniStatuslineFilename guibg=none ctermbg=none
					hi MiniStatuslineFileinfo guibg=none ctermbg=none
					hi MiniStatuslineInactive guibg=none ctermbg=none
				]])
			end

			set_transparency()
			vim.api.nvim_create_autocmd("BufEnter", {
				pattern = "*",
				callback = set_transparency,
			})
		end,
	},
}
