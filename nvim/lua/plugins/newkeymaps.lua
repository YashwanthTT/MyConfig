return {
  {
    "folke/snacks.nvim",
    opts = {
      picker = {},
      explorer = {},
    },
    keys = {
      {
        "<leader><space>",
        function()
          Snacks.picker.files()
        end,
        desc = "Find Files",
      },
    },
  },
  {
    "nvim-mini/mini.snippets",
    config = function()
      require("mini.snippets").setup({
        mappings = {
          expand_or_jump = "<C-j>",
          jump_next = "<M-n>",
          jump_prev = "<C-h>",
          select_choice = "<M-;>",
          stop = "<C-c>",
        },
        snippets = {
          -- your snippets here
        },
      })
    end,
  },
}
