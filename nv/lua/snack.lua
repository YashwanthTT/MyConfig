vim.pack.add({
  -- prefer full src for clarity; short "folke/snacks.nvim" also works
  { src = "https://github.com/folke/snacks.nvim", version = "*" },
})

-- -- Important: setup should run early (before using modules)
package.path = package.path .. ";/Users/yashwanth/.local/share/nvim/site/pack/start/snacks.nvim/lua/?.lua;/Users/yashwanth/.local/share/nvim/site/pack/start/snacks.nvim/lua/?/init.lua"
local Snacks = require("snacks")

Snacks.setup({
  bigfile = { enabled = true },
  dashboard = { enabled = true },
  explorer = { enabled = true },
  indent = { enabled = true },
  input = { enabled = true },
  notifier = {
    enabled = true,
    timeout = 3000,
  },
  quickfile = { enabled = true },
  scope = { enabled = true },
  scroll = { enabled = true },
  statuscolumn = { enabled = true },
  words = { enabled = true },
  styles = {
    notification = {
      -- wo = { wrap = true },
    },
  },
})


-- Define keymaps after Snacks.setup()
local map = vim.keymap.set

-- Top Pickers & Explorer
map("n", "<leader>:",       function() Snacks.picker.command_history() end, { desc = "Command History" })
map("n", "<leader>n",       function() Snacks.picker.notifications() end, { desc = "Notification History" })

-- git
map("n", "<leader>gb", function() Snacks.picker.git_branches() end, { desc = "Git Branches" })
map("n", "<leader>gl", function() Snacks.picker.git_log() end, { desc = "Git Log" })
map("n", "<leader>gL", function() Snacks.picker.git_log_line() end, { desc = "Git Log Line" })
map("n", "<leader>gs", function() Snacks.picker.git_status() end, { desc = "Git Status" })
map("n", "<leader>gS", function() Snacks.picker.git_stash() end, { desc = "Git Stash" })
map("n", "<leader>gd", function() Snacks.picker.git_diff() end, { desc = "Git Diff (Hunks)" })
map("n", "<leader>gf", function() Snacks.picker.git_log_file() end, { desc = "Git Log File" })


-- Grep
map("n", "<leader>sb", function() Snacks.picker.lines() end, { desc = "Buffer Lines" })
map("n", "<leader>sB", function() Snacks.picker.grep_buffers() end, { desc = "Grep Open Buffers" })
map("n", "<leader>sg", function() Snacks.picker.grep() end, { desc = "Grep" })
map({ "n", "x" }, "<leader>sw", function() Snacks.picker.grep_word() end, { desc = "Visual selection or word" })

map("n", "<leader>sC", function() Snacks.picker.commands() end, { desc = "Commands" })
map("n", "<leader>sd", function() Snacks.picker.diagnostics() end, { desc = "Diagnostics" })
-- LSP
map("n", "gd",  function() Snacks.picker.lsp_definitions() end,      { desc = "Goto Definition" })
map("n", "gD",  function() Snacks.picker.lsp_declarations() end,     { desc = "Goto Declaration" })
map("n", "gr",  function() Snacks.picker.lsp_references() end,       { nowait = true, desc = "References" })
map("n", "gI",  function() Snacks.picker.lsp_implementations() end,  { desc = "Goto Implementation" })
map("n", "gy",  function() Snacks.picker.lsp_type_definitions() end, { desc = "Goto T[y]pe Definition" })
map("n", "gai", function() Snacks.picker.lsp_incoming_calls() end,   { desc = "Calls Incoming" })
map("n", "gao", function() Snacks.picker.lsp_outgoing_calls() end,   { desc = "Calls Outgoing" })
map("n", "<leader>ss", function() Snacks.picker.lsp_symbols() end,   { desc = "LSP Symbols" })
map("n", "<leader>sS", function() Snacks.picker.lsp_workspace_symbols() end, { desc = "LSP Workspace Symbols" })

map("n", "<leader>.",  function() Snacks.scratch() end,     { desc = "Toggle Scratch Buffer" })
map({ "n", "v" }, "<leader>gB", function() Snacks.gitbrowse() end, { desc = "Git Browse" })
map("n", "<leader>gg", function() Snacks.lazygit() end,     { desc = "Lazygit" })
map("n", "<leader>un", function() Snacks.notifier.hide() end, { desc = "Dismiss All Notifications" })
map("n", "<c-/>",      function() Snacks.terminal() end,    { desc = "Toggle Terminal" })
map("n", "<c-_>",      function() Snacks.terminal() end,    { desc = "which_key_ignore" })
map({ "n", "t" }, "]]", function() Snacks.words.jump(vim.v.count1) end, { desc = "Next Reference" })
map({ "n", "t" }, "[[", function() Snacks.words.jump(-vim.v.count1) end, { desc = "Prev Reference" })
