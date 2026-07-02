-- Native LSP start using Neovim's built-in feature
vim.lsp.start({
	name = "svelte",
	cmd = { "svelteserver", "--stdio" },
	root_dir = vim.fs.root(0, { "package.json", "svelte.config.js", ".git" }),
	capabilities = _G.lsp_capabilities,
})
