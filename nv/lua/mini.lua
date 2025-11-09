vim.pack.add({
  {src = "https://github.com/nvim-mini/mini.nvim"}
})

require('mini.pick').setup()
vim.keymap.set('n','<leader><space>','<cmd>Pick files<cr>')
vim.keymap.set('n','<leader>fb','<cmd>Pick buffers<cr>')
vim.keymap.set('n','<leader>fg','<cmd>Pick grep_live<cr>')


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
require('mini.hipatterns').setup {}

require('mini.statusline').setup({
  content = {
    active = function()
      local mode = MiniStatusline.section_mode({})
      local filename = MiniStatusline.section_filename({})
      return MiniStatusline.combine_groups({
        { hl = 'MiniStatuslineMode', strings = { mode } },
        { hl = 'MiniStatuslineFilename', strings = { filename } },
      })
    end,
  },
  use_icons = true,
  set_vim_settings = true,
})

vim.cmd('hi! StatusLine guibg=NONE ctermbg=NONE')
vim.cmd('hi! MiniStatuslineFileinfo guibg=NONE ctermbg=NONE')
