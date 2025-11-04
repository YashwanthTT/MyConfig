return {
  'nvim-treesitter/nvim-treesitter',
  event = 'BufReadPost',
  build = function()
    pcall(require('nvim-treesitter.install').update { with_sync = false })
  end,
  main = 'nvim-treesitter.configs',
  opts = {
    ensure_installed = {},
    auto_install = false,
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
    indent = { enable = true, disable = { 'ruby' } },
  },
}
