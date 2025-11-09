vim.pack.add({
  { src = "https://github.com/mfussenegger/nvim-lint"},
})

local ok, lint = pcall(require, 'lint')
if ok then
  lint.setup({
  linters = {
    clangtidy = {
      cmd = '/opt/homebrew/opt/llvm/bin/clang-tidy'
    }
  },
  linters_by_ft = {
    c = { 'clangtidy' },
    cpp = { 'clangtidy' },
    go = { 'golangcilint' },
    javascript = { 'eslint' },
    typescript = { 'eslint' },
    javascriptreact = { 'eslint' },
    typescriptreact = { 'eslint' },
  }
})

  local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })
  vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
    group = lint_augroup,
    callback = function()
      if vim.bo.modifiable then
        lint.try_lint()
      end
    end,
  })
end
