return {
  {
    "stevearc/oil.nvim",
    opts = {}, -- your Oil setup opts

    -- Optional dependencies
    dependencies = {
      {
        "echasnovski/mini.icons",
        opts = {},
      },
      -- OR use this instead if you prefer web-devicons
      -- "nvim-tree/nvim-web-devicons",
    },

    -- Lazy loading not recommended for oil.nvim
    lazy = false,
  },
}
