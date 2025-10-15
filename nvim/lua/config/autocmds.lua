-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

vim.cmd("autocmd BufEnter * set formatoptions-=cro")
vim.cmd("autocmd BufEnter * setlocal formatoptions-=cro")

vim.keymap.set("n", "<leader>z", function()
  local command = ""
  local source_file = vim.fn.expand("%:p")
  local executable_file = vim.fn.expand("%:p:r")

  if vim.o.filetype == "c" then
    command = command .. vim.fn.expand("gcc ")
  elseif vim.o.filetype == "cpp" then
    command = command .. vim.fn.expand("g++ ")
  else
    command = command .. vim.fn.expand("chmod +x ")
    command = command .. source_file
    command = command .. vim.fn.expand(" && ")
  end
  if vim.o.filetype == "c" or vim.o.filetype == "cpp" then
    command = command .. vim.fn.expand(" -Wall")
    command = command .. vim.fn.expand(" -Wextra")
    command = command .. vim.fn.expand(" -o ")
    command = command .. executable_file
    command = command .. vim.fn.expand(" ")
    command = command .. source_file
    command = command .. vim.fn.expand(" && ")
    command = command .. executable_file
  elseif string.match(vim.fn.getline(1), "^#!/") then
    command = command .. vim.fn.shellescape(source_file)
  elseif vim.o.filetype == "python" then
    command = command .. vim.fn.expand("python3 ")
    command = command .. source_file
  elseif vim.o.filetype == "lua" then
    command = command .. vim.fn.expand("lua ")
    command = command .. source_file
  else
    print("Unknown file type `" .. vim.o.filetype .. "`")
  end

  if command ~= "" then
    vim.cmd("10 split")
    vim.cmd("terminal " .. command)
    vim.cmd("startinsert")
    vim.cmd(":wincmd j")
  end
end, { desc = "Compile and run the current file" })
