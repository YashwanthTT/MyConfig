-- Native LSP start using Neovim's built-in feature
vim.lsp.start({
	name = "rust_analyzer",
	cmd = { "rust-analyzer" },
	root_dir = vim.fs.root(0, { "Cargo.toml", ".git" }),
	capabilities = _G.lsp_capabilities,
})
