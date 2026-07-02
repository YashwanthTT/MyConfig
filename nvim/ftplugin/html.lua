-- Native LSP start using Neovim's built-in feature
vim.lsp.start({
	name = "html",
	cmd = { "vscode-html-language-server", "--stdio" },
	root_dir = vim.fs.root(0, { "package.json", ".git" }),
	capabilities = _G.lsp_capabilities,
})
