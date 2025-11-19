return {
  'jiaoshijie/undotree',
  cmd = 'UndotreeToggle',
  keys = {
    { '<leader>t', desc = 'Toggle undo tree' },
  },
  config = function()
    require('undotree').setup {
      float_diff = true,
      layout = 'left_bottom',
      position = 'left',
      ignore_filetype = { 'undotree', 'undotreeDiff', 'qf' },
      window = {
        winblend = 30,
        border = 'rounded',
      },
      keymaps = {
        j = 'move_next',
        k = 'move_prev',
        gj = 'move2parent',
        J = 'move_change_next',
        K = 'move_change_prev',
        ['<cr>'] = 'action_enter',
        p = 'enter_diffbuf',
        q = 'quit',
      },
    }

    vim.keymap.set('n', '<leader>t', function()
      require('undotree').toggle()
    end, { noremap = true, silent = true, desc = 'Toggle undo tree' })
  end,
}
