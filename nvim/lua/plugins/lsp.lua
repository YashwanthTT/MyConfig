vim.diagnostic.config({
	signs = {
		text = {
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

return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup()
		end,
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		config = function()
			require("mason-tool-installer").setup({
				ensure_installed = vim.tbl_keys(lsp_servers),
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("blink-cmp").get_lsp_capabilities()

			-- configure each lsp server on the table lazily
			-- to check what clients are attached to the current buffer, use
			-- `:checkhealth vim.lsp`. to view default lsp keybindings, use `:h lsp-defaults`.
			local lsp_setup_done = false
			vim.api.nvim_create_autocmd("BufReadPost", {
				once = true,
				callback = function()
					if not lsp_setup_done then
						lsp_setup_done = true
						for server, config in pairs(lsp_servers) do
							vim.lsp.config(server, {
								capabilities = capabilities,
								settings = config,

								-- only create the keymaps if the server attaches successfully
								on_attach = function(_, bufnr)
									vim.keymap.set(
										"n",
										"grd",
										vim.lsp.buf.definition,
										{ buffer = bufnr, desc = "vim.lsp.buf.definition()" }
									)

									vim.keymap.set(
										"n",
										"<leader>f",
										vim.lsp.buf.format,
										{ buffer = bufnr, desc = "LSP: [F]ormat Document" }
									)
								end,
							})
						end
					end
				end,
			})
		end,
	},
}
