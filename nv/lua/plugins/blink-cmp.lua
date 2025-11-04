return {
  'saghen/blink.cmp',
  event = 'InsertEnter',
  version = '1.*',
  dependencies = {
    {
      'L3MON4D3/LuaSnip',
      event = 'InsertEnter',
      version = '2.*',
      build = (function()
        if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
          return
        end
        return 'make install_jsregexp'
      end)(),
      config = function()
        require('luasnip').config.set_config {
          region_check_events = 'InsertEnter',
          delete_check_events = 'InsertLeave',
        }
      end,
    },
    'folke/lazydev.nvim',
  },
  opts = {
    keymap = {
      preset = 'default',
    },
    appearance = {
      nerd_font_variant = 'mono',
    },
    completion = {
      menu = {
        enabled = true,
      },
      documentation = { auto_show = false, auto_show_delay_ms = 500 },
    },
    sources = {
      default = { 'lsp', 'path', 'buffer', 'snippets' },
      cmdline = {},
      providers = {
        lsp = { score_offset = 100 },
        path = { score_offset = 50 },
        buffer = { score_offset = 25 },
        snippets = { score_offset = 10 },
      },
    },
    snippets = { preset = 'luasnip' },
    fuzzy = { implementation = 'lua' },
    signature = { enabled = true },
  },
}
