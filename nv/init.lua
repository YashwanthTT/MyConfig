local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("options")
require("keymap")
require("autocmds")

require("lazy").setup({
  require("plugins.colorscheme"),
  require("plugins.neotree"),
  require("plugins.mini"),
  require("plugins.mason"),
  require("plugins.lspconfig"),
  require("plugins.blink"),
  require("plugins.noice"),
  require("plugins.copilot"),
  require("plugins.undotree"),
  require("plugins.snacks"),
  require("plugins.format"),
  require("plugins.harpoon"),
})
