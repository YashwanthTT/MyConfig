-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
--
vim.keymap.set("n", "<leader>r", [[:%s/\<<C-r><C-w>\>//g<Left><Left>]], { desc = "Live preview replace" })

vim.keymap.set(
  "v",
  "<leader>r",
  [[:s/\<<C-r><C-w>\>//g<Left><Left>]],
  { desc = "Replace word under cursor (selection)" }
)

vim.keymap.set("n", "<leader>ww", function()
  vim.cmd("write")
end)
