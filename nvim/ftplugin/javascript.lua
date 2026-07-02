-- Native LSP start using Neovim's built-in feature
local function start_ts_ls()
	vim.lsp.start({
		name = "ts_ls",
		cmd = { "typescript-language-server", "--stdio" },
		root_dir = vim.fs.root(0, { "package.json", "tsconfig.json", "jsconfig.json", ".git" }),
		capabilities = _G.lsp_capabilities,
	})
end
start_ts_ls()
