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

return {
  -- 1. TokyoNight Colorscheme with extended transparency
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
    config = function(_, opts)
      require("tokyonight").setup(opts)
      vim.cmd.colorscheme("tokyonight")

      -- Apply extended transparency to various UI elements
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

  -- 2. Lualine with custom theme (transparent center)
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local my_theme = {
        normal = {
          a = { fg = "#16161e", bg = "#7aa2f7", gui = "bold" }, -- Blue
          b = { fg = "#c0caf5", bg = "#292e42" },
          c = { fg = "#c0caf5", bg = "NONE" }, -- Transparent Background
        },
        insert = { a = { fg = "#16161e", bg = "#9ece6a", gui = "bold" } }, -- Green
        visual = { a = { fg = "#16161e", bg = "#bb9af7", gui = "bold" } }, -- Purple
        replace = { a = { fg = "#16161e", bg = "#f7768e", gui = "bold" } }, -- Red
        command = { a = { fg = "#16161e", bg = "#e0af68", gui = "bold" } }, -- Orange
        inactive = {
          a = { fg = "#a9b1d6", bg = "#24283b", gui = "bold" },
          b = { fg = "#a9b1d6", bg = "#24283b" },
          c = { fg = "#a9b1d6", bg = "NONE" }, -- Transparent Background
        },
      }

      require("lualine").setup({
        options = {
          theme = my_theme,
          component_separators = { left = "|", right = "|" },
          section_separators = { left = "", right = "" }, -- Rounded
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch" },
          lualine_c = {
            "diagnostics",
            { "filename", path = 1 }, -- relative path
          },
          lualine_x = { "filetype" },
          lualine_y = { "progress" },
          lualine_z = { "location" },
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { "filename" },
          lualine_x = { "location" },
          lualine_y = {},
          lualine_z = {},
        },
      })
    end,
  },
}
