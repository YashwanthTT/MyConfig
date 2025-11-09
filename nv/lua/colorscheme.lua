vim.pack.add({
	{ src = "https://github.com/vague2k/vague.nvim" },
})

vim.cmd("colorscheme vague")

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
        ]])
