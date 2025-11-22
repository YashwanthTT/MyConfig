return {
	{
		"github/copilot.vim",
		config = function()
			vim.g.copilot_enabled = true
			vim.cmd([[
  highlight CopilotSuggestion guifg=#666666 ctermfg=DarkGrey
]])
		end,
	},
}
