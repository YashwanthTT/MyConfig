return {
  {
    'github/copilot.vim',
    lazy = false,
    config = function()
      vim.g.copilot_enabled = true
      vim.cmd [[
      highlight CopilotSuggestion guifg=#666666 ctermfg=DarkGrey
    ]]
    end,
  },
}
