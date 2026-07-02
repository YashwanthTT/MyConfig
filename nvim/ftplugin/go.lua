-- Native LSP start using Neovim's built-in feature
vim.lsp.start({
	name = "gopls",
	cmd = { "gopls" },
	root_dir = vim.fs.root(0, { "go.mod", ".git" }),
	capabilities = _G.lsp_capabilities,
})
