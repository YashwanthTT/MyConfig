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
          function()
            local recent_files = require("mini.starter").sections.recent_files(5, true, false)()
            for _, item in ipairs(recent_files) do
              item.section = "Recent files"
            end
            return recent_files
          end,
          { name = "Lazy", action = "Lazy", section = "Actions" },
          { name = "Quit", action = "qa", section = "Actions" },
        },
        content_hooks = {
          require("mini.starter").gen_hook.adding_bullet(),
          require("mini.starter").gen_hook.padding(3, 2),
          require("mini.starter").gen_hook.aligning("center", "center"),
        },
        footer = "",
        header = "",
      })
    end,
  },
}
