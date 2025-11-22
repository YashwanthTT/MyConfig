local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

local general = augroup("General", { clear = true })

autocmd("TextYankPost", {
  group = general,
  pattern = "*",
  callback = function()
    vim.highlight.on_yank({ timeout = 200 })
  end,
  desc = "Highlight on yank",
})

autocmd("BufReadPost", {
  group = general,
  pattern = "*",
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
  desc = "Restore cursor position",
})

autocmd("FileType", {
  group = general,
  pattern = { "help", "man", "qf" },
  callback = function()
    vim.keymap.set("n", "q", "<cmd>close<CR>", { buffer = true })
  end,
  desc = "Close with q",
})
