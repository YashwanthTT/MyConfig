-- Native LSP start using Neovim's built-in feature
vim.lsp.start({
	name = "ts_ls",
	cmd = { "typescript-language-server", "--stdio" },
	root_dir = vim.fs.root(0, { "package.json", "tsconfig.json", "jsconfig.json", ".git" }),
	capabilities = _G.lsp_capabilities,
	on_attach = _G.lsp_on_attach,
})
