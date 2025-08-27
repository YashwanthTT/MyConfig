return {
  "nvim-lualine/lualine.nvim",
  opts = function(_, opts)
    -- 1. Define a custom theme with new colors
    local my_theme = {
      normal = {
        a = { bg = "#89b4fa", fg = "#1e1e2e", gui = "bold" }, -- Blue background, Dark text
        b = { bg = "#585b70", fg = "#cdd6f4" }, -- Gray background, Light text
        c = { bg = "#313244", fg = "#cdd6f4" }, -- Darker gray for filename background
      },
      insert = { a = { bg = "#a6e3a1", fg = "#1e1e2e", gui = "bold" } }, -- Green
      visual = { a = { bg = "#f9e2af", fg = "#1e1e2e", gui = "bold" } }, -- Yellow
      replace = { a = { bg = "#f38ba8", fg = "#1e1e2e", gui = "bold" } }, -- Red
      command = { a = { bg = "#fab387", fg = "#1e1e2e", gui = "bold" } }, -- Orange
      inactive = {
        a = { bg = "#313244", fg = "#6c7086", gui = "bold" },
        b = { bg = "#313244", fg = "#6c7086" },
        c = { bg = "#1e1e2e", fg = "#6c7086" },
      },
    }

    -- 2. Apply the theme and use rounded separators
    -- Make sure you have a Nerd Font installed for these icons to render correctly.
    opts.options = {
      theme = my_theme,
      component_separators = { left = "", right = "" }, -- Softer inner separators
      section_separators = { left = "", right = "" }, -- Rounded-edge separators
      disabled_filetypes = { statusline = {}, winbar = {} },
      always_divide_middle = true,
    }

    -- 3. Configure sections to remove command display and add the colored path
    -- Left Side
    opts.sections.lualine_a = { "mode" }
    opts.sections.lualine_b = { "branch" }

    -- Center Section with colored background and relative file path
    opts.sections.lualine_c = {
      {
        "filename",
        path = 1, -- 0 = just filename, 1 = relative path, 2 = absolute path
        shorting_rule = "winwidth",
      },
    }

    -- Right Side: We keep some useful info but remove the command display and percentage
    opts.sections.lualine_x = { "diagnostics", "filetype" }
    opts.sections.lualine_y = {} -- Ensure percentage is removed
    opts.sections.lualine_z = { "location" } -- Line and column number

    -- Configure inactive windows similarly
    opts.inactive_sections.lualine_c = { { "filename", path = 1 } }

    return opts
  end,
}
