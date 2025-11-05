return {
  {
    'github/copilot.vim',
    event = 'VeryLazy',
    config = function()
      vim.cmd [[
      highlight CopilotSuggestion guifg=#666666 ctermfg=DarkGrey
    ]]
    end,
  },
}
