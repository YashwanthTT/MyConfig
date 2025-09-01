return {
  "supermaven-inc/supermaven-nvim",
  event = "InsertEnter",
  config = function()
    local supermaven = require("supermaven-nvim")

    supermaven.setup({
      keymaps = {
        accept_suggestion = "<Tab>",
        clear_suggestion = "<C-]>",
        accept_word = "<C-j>",
      },
      color = {
        suggestion_color = "#808080",
        -- suggestion_color = "#C0C0C0",
        cterm = 250,
      },
      disable_inline_completion = false, -- IMPORTANT: enables ghost text
      ignore_filetypes = { "bigfile", "snacks_input", "snacks_notif" },
      log_level = "info",
      disable_keymaps = false,
      condition = function()
        return false
      end,
    })

    -- Fix for lazy loading color issue
    -- Set the highlight group immediately when plugin loads
    local config = require("supermaven-nvim.config")
    if config.color and config.color.suggestion_color and config.color.cterm then
      vim.api.nvim_set_hl(0, "SupermavenSuggestion", {
        fg = config.color.suggestion_color,
        ctermfg = config.color.cterm,
      })
      require("supermaven-nvim.completion_preview").suggestion_group = "SupermavenSuggestion"
    end
  end,
}
