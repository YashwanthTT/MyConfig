vim.diagnostic.config({
	signs = {
		text = {
			-- [vim.diagnostic.severity.ERROR] = " ",
			-- [vim.diagnostic.severity.WARN] = " ",
			-- [vim.diagnostic.severity.INFO] = " ",
			-- [vim.diagnostic.severity.HINT] = " ",
			[vim.diagnostic.severity.ERROR] = " ",
			[vim.diagnostic.severity.WARN] = " ",
			[vim.diagnostic.severity.INFO] = " ",
			[vim.diagnostic.severity.HINT] = " ",
		},
	},
	virtual_text = true, -- show inline diagnostics
})

local lsp_servers = {
	lua_ls = {
		-- https://luals.github.io/wiki/settings/ | `:h nvim_get_runtime_file`
		Lua = { workspace = { library = vim.api.nvim_get_runtime_file("lua", true) } },
	},
	clangd = {},
	rust_analyzer = {},
	gopls = {},
	ts_ls = {},
	jdtls = {},
}

vim.pack.add({
	{ src = "https://github.com/neovim/nvim-lspconfig" }, -- default configs for lsps

	-- NOTE: if you'd rather install the lsps through your OS package manager you
	-- can delete the next three mason-related lines and their setup calls below.
	-- see `:h lsp-quickstart` for more details.
	{ src = "https://github.com/mason-org/mason.nvim" }, -- package manager
	{ src = "https://github.com/mason-org/mason-lspconfig.nvim" }, -- lspconfig bridge
	{ src = "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim" }, -- auto installer
}, { confirm = false })

require("mason").setup()
require("mason-lspconfig").setup()
require("mason-tool-installer").setup({
	ensure_installed = vim.tbl_keys(lsp_servers),
})

-- configure each lsp server on the table
-- to check what clients are attached to the current buffer, use
-- `:checkhealth vim.lsp`. to view default lsp keybindings, use `:h lsp-defaults`.
for server, config in pairs(lsp_servers) do
	vim.lsp.config(server, {
		settings = config,

		-- only create the keymaps if the server attaches successfully
		on_attach = function(_, bufnr)
			vim.keymap.set("n", "grd", vim.lsp.buf.definition, { buffer = bufnr, desc = "vim.lsp.buf.definition()" })

			vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, { buffer = bufnr, desc = "LSP: [F]ormat Document" })
		end,
	})
end
