return {
  {
    "zbirenbaum/copilot.lua",
    opts = {
      suggestion = {
        enabled = true,
        auto_trigger = true,
        debounce = 75,
        keymap = {
          accept = "<Tab>",
          next = "<M-]>",
          prev = "<M-[>",
          dismiss = "<C-]>",
        },
      },
      panel = { enabled = false },
    },
    config = function()
      -- Highlight copilot ghost text in grey
      vim.cmd([[highlight CopilotSuggestion guifg=#888888 gui=nocombine]])
    end,
  },
}
