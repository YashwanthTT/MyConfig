return {
  "nvim-telescope/telescope.nvim",
  lazy = true,
  keys = {
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
