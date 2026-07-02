-- Native LSP start using Neovim's built-in feature
vim.lsp.start({
	name = "clangd",
	cmd = { "clangd" },
	root_dir = vim.fs.root(0, { "compile_commands.json", "compile_flags.txt", ".git" }),
	capabilities = _G.lsp_capabilities,
})
