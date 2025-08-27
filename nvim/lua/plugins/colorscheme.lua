-- return {
--   {
--     "folke/tokyonight.nvim",
--     lazy = true,
--     priority = 1000,
--     opts = {
--       transparent = true,
--       styles = {
--         sidebars = "transparent",
--         floats = "transparent",
--       },
--     },
--     config = function()
--       require("tokyonight").setup({
--         transparent = true,
--         styles = {
--           sidebars = "transparent",
--           floats = "transparent",
--         },
--       })
--       vim.cmd([[colorscheme tokyonight]])
--
--       local function set_transparency()
--         vim.cmd([[
--           hi Normal guibg=NONE ctermbg=NONE
--           hi NormalNC guibg=NONE ctermbg=NONE
--           hi SignColumn guibg=NONE ctermbg=NONE
--           hi StatusLine guibg=NONE ctermbg=NONE
--           hi StatusLineNC guibg=NONE ctermbg=NONE
--           hi VertSplit guibg=NONE ctermbg=NONE
--           hi Pmenu guibg=NONE ctermbg=NONE
--           hi PmenuSel guibg=NONE ctermbg=NONE
--           hi TabLine guibg=NONE ctermbg=NONE
--           hi TabLineFill guibg=NONE ctermbg=NONE
--           hi TabLineSel guibg=NONE ctermbg=NONE
--           hi NeoTreeNormal guibg=NONE ctermbg=NONE
--           hi NeoTreeNormalNC guibg=NONE ctermbg=NONE
--           hi NeoTreeWinSeparator guibg=NONE ctermbg=NONE
--           hi CursorLine guibg=NONE ctermbg=NONE
--         ]])
--       end
--
--       set_transparency()
--
--       vim.api.nvim_create_autocmd("BufEnter", {
--         pattern = "*",
--         callback = set_transparency,
--       })
--     end,
--   },
-- }

-- return {
--   -- Tokyonight with transparent UI
--   {
--     "folke/tokyonight.nvim",
--     lazy = true,
--     priority = 1000,
--     opts = {
--       transparent = true,
--       styles = {
--         sidebars = "transparent",
--         floats = "transparent",
--       },
--     },
--     config = function()
--       require("tokyonight").setup({
--         transparent = true,
--         styles = {
--           sidebars = "transparent",
--           floats = "transparent",
--         },
--       })
--       vim.cmd([[colorscheme tokyonight]])
--
--       local function set_transparency()
--         vim.cmd([[
--           hi Normal guibg=NONE ctermbg=NONE
--           hi NormalNC guibg=NONE ctermbg=NONE
--           hi SignColumn guibg=NONE ctermbg=NONE
--           hi StatusLine guibg=NONE ctermbg=NONE
--           hi StatusLineNC guibg=NONE ctermbg=NONE
--           hi VertSplit guibg=NONE ctermbg=NONE
--           hi Pmenu guibg=NONE ctermbg=NONE
--           hi PmenuSel guibg=NONE ctermbg=NONE
--           hi TabLine guibg=NONE ctermbg=NONE
--           hi TabLineFill guibg=NONE ctermbg=NONE
--           hi TabLineSel guibg=NONE ctermbg=NONE
--           hi NeoTreeNormal guibg=NONE ctermbg=NONE
--           hi NeoTreeNormalNC guibg=NONE ctermbg=NONE
--           hi NeoTreeWinSeparator guibg=NONE ctermbg=NONE
--           hi CursorLine guibg=NONE ctermbg=NONE
--         ]])
--       end
--
--       set_transparency()
--
--       vim.api.nvim_create_autocmd("BufEnter", {
--         pattern = "*",
--         callback = set_transparency,
--       })
--     end,
--   },
--
--   -- Lualine with hex color foregrounds, transparent backgrounds, rounded corners
--   {
--     "nvim-lualine/lualine.nvim",
--     event = "VeryLazy",
--     opts = function()
--       require("lualine").setup({
--         options = {
--           theme = "auto",
--           component_separators = { left = "", right = "" },
--           section_separators = { left = "", right = "" },
--           globalstatus = true,
--         },
--         sections = {
--           lualine_a = {{
--             "mode",
--             color = { fg = "#bb9af7", bg = "NONE" },   -- purple
--           }},
--           lualine_b = {{
--             "branch",
--             color = { fg = "#7dcfff", bg = "NONE" },   -- cyan
--           }},
--           lualine_c = {{
--             "filename",
--             color = { fg = "#ff9e64", bg = "NONE" },   -- orange
--             path = 1,
--           }},
--           lualine_x = {{
--             "diagnostics",
--             sources = { "nvim_diagnostic" },
--             symbols = { error = " ", warn = " ", info = " " },
--             color = { fg = "#f7768e", bg = "NONE" },   -- red
--           }},
--           lualine_y = {{
--             "progress",
--             color = { fg = "#9ece6a", bg = "NONE" },   -- green
--           }},
--           lualine_z = {{
--             "location",
--             color = { fg = "#7aa2f7", bg = "NONE" },   -- blue
--           }},
--         },
--         inactive_sections = {
--           lualine_a = {},
--           lualine_b = {},
--           lualine_c = {{
--             "filename",
--             color = { fg = "#5c6370", bg = "NONE" },   -- gray
--             path = 1,
--           }},
--           lualine_x = {},
--           lualine_y = {},
--           lualine_z = {},
--         },
--       })
--     end,
--   },
-- }

return {
  -- Tokyonight with transparent UI
  {
    "folke/tokyonight.nvim",
    lazy = true,
    priority = 1000,
    opts = {
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
    config = function()
      require("tokyonight").setup({
        transparent = true,
        styles = {
          sidebars = "transparent",
          floats = "transparent",
        },
      })
      vim.cmd([[colorscheme tokyonight]])

      local function set_transparency()
        vim.cmd([[
          hi Normal guibg=NONE ctermbg=NONE
          hi NormalNC guibg=NONE ctermbg=NONE
          hi SignColumn guibg=NONE ctermbg=NONE
          hi StatusLine guibg=NONE ctermbg=NONE
          hi StatusLineNC guibg=NONE ctermbg=NONE
          hi VertSplit guibg=NONE ctermbg=NONE
          hi Pmenu guibg=NONE ctermbg=NONE
          hi PmenuSel guibg=NONE ctermbg=NONE
          hi TabLine guibg=NONE ctermbg=NONE
          hi TabLineFill guibg=NONE ctermbg=NONE
          hi TabLineSel guibg=NONE ctermbg=NONE
          hi NeoTreeNormal guibg=NONE ctermbg=NONE
          hi NeoTreeNormalNC guibg=NONE ctermbg=NONE
          hi NeoTreeWinSeparator guibg=NONE ctermbg=NONE
          hi CursorLine guibg=NONE ctermbg=NONE
        ]])
      end

      set_transparency()

      vim.api.nvim_create_autocmd("BufEnter", {
        pattern = "*",
        callback = set_transparency,
      })
    end,
  },

  -- Lualine with hex color foregrounds, transparent backgrounds, rounded corners
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function()
      require("lualine").setup({
        options = {
          theme = "auto",
          component_separators = { left = "", right = "" },
          section_separators = { left = "", right = "" },
          globalstatus = true,
        },
        sections = {
          lualine_a = {
            {
              "mode",
              color = { fg = "#bb9af7", bg = "NONE" }, -- purple
            },
          },
          lualine_b = {
            {
              "branch",
              color = { fg = "#7dcfff", bg = "NONE" }, -- cyan
            },
          },
          lualine_c = {
            {
              "filename",
              color = { fg = "#ff9e64", bg = "NONE" }, -- orange
              path = 1,
            },
          },
          lualine_x = {
            {
              "diagnostics",
              sources = { "nvim_diagnostic" },
              symbols = { error = " ", warn = " ", info = " " },
              color = { fg = "#f7768e", bg = "NONE" }, -- red
            },
          },
          lualine_y = {
            {
              "progress",
              color = { fg = "#9ece6a", bg = "NONE" }, -- green
            },
          },
          -- This section is now empty to remove the "location" component
          lualine_z = {},
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = {
            {
              "filename",
              color = { bg = "NONE" }, -- gray
              path = 1,
            },
          },
          lualine_x = {},
          lualine_y = {},
          lualine_z = {},
        },
      })
    end,
  },
}
