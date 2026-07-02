require("config.options")

-- Enable module caching for faster startup (replaces lazy.nvim's automatic caching)
vim.loader.enable()

-- Disable unused built-in plugins (preserves Lazy.nvim's disabled_plugins list)
vim.g.loaded_gzip = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_tohtml = 1
vim.g.loaded_tutor = 1
vim.g.loaded_zipPlugin = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_matchit = 1
vim.g.loaded_matchparen = 1

-- Load plugin configurations
-- Order matters: colorscheme first, then UI, then functional plugins
require("plugins.colorscheme")
require("plugins.snacks")
require("plugins.mini")
require("plugins.Oil")
require("plugins.blink")
require("plugins.lsp")
require("plugins.tree-sitter")
require("plugins.conform")
require("plugins.linting")
require("plugins.trouble")
-- copilot.lua is intentionally skipped (currently commented out)

require("config.keymaps")
require("config.autocmds")
