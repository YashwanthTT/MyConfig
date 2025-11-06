return {
  {
    'nvim-mini/mini.nvim',
    version = '*',
    config = function()
      require('mini.pick').setup {}
      vim.api.nvim_set_hl(0, 'MiniPickMatchCurrent', { bg = '#2c323c' })
      require('mini.align').setup {}
      require('mini.surround').setup {}
      require('mini.starter').setup {
        items = {
          function()
            local recent_files = require('mini.starter').sections.recent_files(5, true, false)()
            for _, item in ipairs(recent_files) do
              item.section = 'Recent files'
            end
            return recent_files
          end,
          { name = 'Lazy', action = 'Lazy', section = 'Actions' },
          { name = 'Quit', action = 'qa', section = 'Actions' },
        },
        content_hooks = {
          require('mini.starter').gen_hook.adding_bullet(),
          require('mini.starter').gen_hook.padding(3, 2),
          require('mini.starter').gen_hook.aligning('center', 'center'),
        },
        footer = '',
        header = '',
      }
      require('mini.pairs').setup {}
      require('mini.icons').setup {}
       require('mini.hipatterns').setup {
         highlighters = {
           hex_color = require('mini.hipatterns').gen_highlighter.hex_color(),
         },
       }
    end,
  },
}
