-- Native LSP start using Neovim's built-in feature
vim.lsp.start({
	name = "lua_ls",
	cmd = { "lua-language-server" },
	root_dir = vim.fs.root(0, { ".luarc.json", ".git", "init.lua" }),
	settings = {
		Lua = {
			workspace = { library = vim.api.nvim_get_runtime_file("lua", true) },
		},
	},
	capabilities = _G.lsp_capabilities,
})
