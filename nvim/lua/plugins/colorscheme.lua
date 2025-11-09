return {
  -- 1. tokyonight colorscheme with extended transparency
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    opts = {
      transparent = true,
      styles = {
        sidebars = 'transparent',
        floats = 'transparent',
      },
    },
    config = function(_, opts)
      require('tokyonight').setup(opts)
      vim.cmd.colorscheme 'tokyonight'

      -- apply extended transparency to various ui elements
      local function set_transparency()
        vim.cmd [[
          hi pmenu guibg=none ctermbg=none
          hi pmenusel guibg=#137ec9 ctermbg=none
          hi normal guibg=none ctermbg=none
          hi normalnc guibg=none ctermbg=none
          hi signcolumn guibg=none ctermbg=none
          hi statusline guibg=none ctermbg=none
          hi statuslinenc guibg=none ctermbg=none
          hi vertsplit guibg=none ctermbg=none
          hi tabline guibg=none ctermbg=none
          hi tablinefill guibg=none ctermbg=none
          hi tablinesel guibg=none ctermbg=none
          hi neotreenormal guibg=none ctermbg=none
          hi neotreenormalnc guibg=none ctermbg=none
          hi neotreewinseparator guibg=none ctermbg=none
          hi cursorline guibg=none ctermbg=none
        ]]
      end

      set_transparency()
      vim.api.nvim_create_autocmd('bufenter', {
        pattern = '*',
        callback = set_transparency,
      })
    end,
  },

  -- 2. lualine with custom theme (transparent center)
  {
    'nvim-lualine/lualine.nvim',
    event = 'VeryLazy',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      local my_theme = {
        normal = {
          a = { fg = '#16161e', bg = '#7aa2f7', gui = 'bold' }, -- blue
          b = { fg = '#c0caf5', bg = '#292e42' },
          c = { fg = '#c0caf5', bg = 'none' }, -- transparent background
        },
        insert = { a = { fg = '#16161e', bg = '#9ece6a', gui = 'bold' } }, -- green
        visual = { a = { fg = '#16161e', bg = '#bb9af7', gui = 'bold' } }, -- purple
        replace = { a = { fg = '#16161e', bg = '#f7768e', gui = 'bold' } }, -- red
        command = { a = { fg = '#16161e', bg = '#e0af68', gui = 'bold' } }, -- orange
        inactive = {
          a = { fg = '#a9b1d6', bg = '#24283b', gui = 'bold' },
          b = { fg = '#a9b1d6', bg = '#24283b' },
          c = { fg = '#a9b1d6', bg = 'none' }, -- transparent background
        },
      }

      require('lualine').setup {
        options = {
          theme = my_theme,
          -- component_separators = { left = "|", right = "|" },
          component_separators = { left = ' ', right = ' ' },
          section_separators = { left = '', right = '' }, -- rounded
        },
        sections = {
          -- lualine_a = { { "mode", separator = { left = "" }, left_padding = 2 } },
          lualine_a = {
            {
              'mode',
              -- separator = { left = "" },
              padding = { left = 1, right = 1 },
            },
          },
          lualine_b = { 'branch' },
          lualine_c = {
            'diagnostics',
            {
              'filename',
              path = 1,
              symbols = {
                modified = '',
                readonly = '[-]',
                unnamed = '[no name]',
                newfile = '[new]',
              },
            }, -- relative path
          },
          lualine_x = { 'filetype' },
          lualine_y = { 'progress' },
          lualine_z = {
            {
              'location',
              -- separator = { right = "" }
            },
          },
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { 'filename' },
          lualine_x = { 'location' },
          lualine_y = {},
          lualine_z = {},
        },
      }
    end,
  },
}
