return {
  {
    'github/copilot.vim',
    event = 'InsertEnter',
    cond = function()
      local max_filesize = 100 * 1024
      local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(0))
      if ok and stats and stats.size > max_filesize then
        return false
      end
      return true
    end,
    config = function()
      vim.cmd [[
      highlight CopilotSuggestion guifg=#666666 ctermfg=DarkGrey
    ]]
      vim.g.copilot_filetypes = {
        ['*'] = true,
        cmdline = false,
      }
    end,
  },
}
