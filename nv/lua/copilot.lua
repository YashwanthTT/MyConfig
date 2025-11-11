vim.pack.add({
	{ src = "https://github.com/github/copilot.vim" },
})

vim.g.copilot_enabled = true
vim.cmd([[
  highlight CopilotSuggestion guifg=#666666 ctermfg=DarkGrey
]])
