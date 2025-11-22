return {
	{
		"scottmckendry/cyberdream.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("cyberdream").setup({
				transparent = true,
			})

			vim.cmd("colorscheme cyberdream")

			vim.cmd([[
    hi pmenu guibg=none ctermbg=none
    hi pmenusel guibg=#137ec9 ctermbg=none
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
    hi LineNr guibg=none ctermbg=none
    hi CursorLineNr guibg=none ctermbg=none
    hi Folded guibg=none ctermbg=none
    hi FoldColumn guibg=none ctermbg=none
    hi EndOfBuffer guibg=none ctermbg=none
    hi WinSeparator guibg=none ctermbg=none
    hi FloatBorder guibg=none ctermbg=none
    hi NormalFloat guibg=none ctermbg=none
  ]])
		end,
	},
}
