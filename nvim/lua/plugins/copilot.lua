return {
  {
    'github/copilot.vim',
    lazy = false,
    config = function()
      vim.cmd [[
      highlight CopilotSuggestion guifg=#666666 ctermfg=DarkGrey
    ]]
    end,
  },
}
