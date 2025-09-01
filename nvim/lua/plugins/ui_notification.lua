return {
  -- Disable snacks.nvim notifications
  {
    "folke/snacks.nvim",
    opts = {
      notifier = { enabled = false },
    },
  },

  -- Disable notifications in noice.nvim
  {
    "folke/noice.nvim",
    opts = {
      notify = { enabled = false },
      -- You can add other noice options here as needed
    },
  },

  -- Configure nvim-notify to minimize intrusive notifications
  {
    "rcarriga/nvim-notify",
    opts = {
      timeout = 1000, -- Notification timeout in ms (set low to hide quickly)
      stages = "fade_in_slide_out", -- Animation style
      -- You can completely disable notifications by using a small timeout or custom on_open to close immediately if needed
      on_open = function(win)
        -- For example, to close all notifications immediately (comment out if not desired)
        -- vim.api.nvim_win_close(win, true)
      end,
    },
  },
}
