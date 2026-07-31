return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
		},
		config = function()
			vim.diagnostic.config({
				underline = false,
				signs = {
					text = {
						[vim.diagnostic.severity.ERROR] = " ",
						[vim.diagnostic.severity.WARN] = " ",
						[vim.diagnostic.severity.INFO] = " ",
						[vim.diagnostic.severity.HINT] = " ",
					},
				},
				virtual_text = true,
			})

			-- Keep mason for manual installations
			require("mason").setup()
			require("mason-lspconfig").setup()
			require("mason-tool-installer").setup({
				ensure_installed = { "lua_ls", "clangd", "rust_analyzer", "gopls", "ts_ls", "html", "svelte" },
				run_on_start = false,
			})
		end,
	},
}
