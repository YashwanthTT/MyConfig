return {
  {
    'nvim-mini/mini.nvim',
    version = '*',
    config = function()
      require('mini.pick').setup {}
      require('mini.align').setup {}
      require('mini.comment').setup {}
      require('mini.pairs').setup {}
      require('mini.surround').setup {}
      require('mini.starter').setup {}
      require('mini.pairs').setup {}
      require('mini.icons').setup {}
    end,
  },
}
