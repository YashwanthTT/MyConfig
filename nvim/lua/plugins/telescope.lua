return {
  "nvim-telescope/telescope.nvim",
  lazy = true,
  keys = {
    {
      "<space><space>",
      function()
        require("telescope.builtin").find_files({ cwd = vim.loop.cwd() })
      end,
      desc = "Telescope: Find files in current directory",
      mode = "n",
    },
    {
      "<space>:",
      function()
        require("telescope.builtin").command_history()
      end,
      desc = "Telescope: Command History",
      mode = "n",
    },
  },
  opts = {
    defaults = {
      -- your default telescope settings here
    },
  },
}
