return {
  --   "folke/snacks.nvim",
  --   opts = {
  --     dashboard = {
  --       enabled = true,
  --       preset = {
  --         header = [[
  --
  -- ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
  -- ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
  -- ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
  -- ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
  -- ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
  -- ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
  --
  --         ]],
  --         keys = {
  --           { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
  --           { icon = "󱔳 ", key = "x", desc = "Lazy Extras", action = ":LazyExtras" },
  --           -- { icon = " ", key = "q", desc = "Quit", action = ":qa" },
  --         },
  --       },
  --     },
  --   },

  {
    "nvim-mini/mini.nvim",
    version = "*",
    config = function()
      require("mini.starter").setup({
        items = {
          require("mini.starter").sections.recent_files(5, true),
          { name = "Lazy", action = "Lazy", section = "Actions" },
          { name = "Quit", action = "qa", section = "Actions" },
        },
        content_hooks = {
          require("mini.starter").gen_hook.adding_bullet(),
          require("mini.starter").gen_hook.indexing("all", { "Actions" }),
          require("mini.starter").gen_hook.padding(3, 2),
          require("mini.starter").gen_hook.aligning("center", "center"),
        },
        footer = "",
        header = "",
      })
    end,
  },
}
