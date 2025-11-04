return {
  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'MunifTanjim/nui.nvim',
      'nvim-tree/nvim-web-devicons', -- optional, but recommended
    },
    lazy = false, -- neo-tree will lazily load itself
    config = function()
      require('neo-tree').setup {
        filesystem = {
          filtered_items = {
            visible = true,
            hide_dotfiles = false,
            hide_gitignored = false,
          },
        },
        default_component_configs = {
          diagnostics = {
            symbols = {
              hint = '',
              info = '',
              warn = '',
              error = '',
            },
          },
        },
      }
    end,
  },
}

---help
