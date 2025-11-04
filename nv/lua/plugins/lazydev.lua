return {
  'folke/lazydev.nvim',
  event = 'BufReadPre',
  ft = 'lua',
  opts = {
    library = {
      { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
    },
  },
}
