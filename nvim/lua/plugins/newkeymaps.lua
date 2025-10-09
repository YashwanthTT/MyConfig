 return {
   {
     "folke/snacks.nvim",
     opts = {
       picker = {
         sources = {
           files = {
             layout = {
               preset = "default",
                layout = {
                  box = "horizontal",
                  width = 0.9,
                  min_width = 120,
                  height = 0.8,
                  {
                    box = "vertical",
                    border = "rounded",
                    title = "{title} {live} {flags}",
                    { win = "input", height = 1, border = "bottom" },
                    { win = "list", border = "none" },
                  },
                  { win = "preview", title = "{preview}", border = "rounded", width = 0.6 },
                },
             },
           },
         },
       },
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
