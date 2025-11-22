return {
	{
		"github/copilot.vim",
		event = "InsertEnter",
		config = function()
			vim.g.copilot_enabled = true
			vim.api.nvim_set_hl(0, "CopilotSuggestion", { fg = "#666666", ctermfg = "DarkGrey" })
		end,
	},
}
