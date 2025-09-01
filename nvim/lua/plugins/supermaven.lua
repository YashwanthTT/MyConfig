return {
  "supermaven-inc/supermaven-nvim",
  event = "InsertEnter",
  opts = {
    keymaps = {
      accept_suggestion = "<Tab>",
      clear_suggestion = "<C-]>",
      accept_word = "<C-j>",
    },
    color = {
      suggestion_color = "#808080",
      cterm = 244,
    },
    disable_inline_completion = false, -- IMPORTANT: enables ghost text
    ignore_filetypes = { "bigfile", "snacks_input", "snacks_notif" },
    log_level = "info",
    disable_keymaps = false,
    condition = function()
      return false
    end,
  },
}
