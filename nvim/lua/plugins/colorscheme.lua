return {
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
}
