return {
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					lua = { "stylua" },
					python = { "isort", "black" },
					javascript = { "prettierd", "prettier", stop_after_first = true },
					typescript = { "prettierd", "prettier", stop_after_first = true },
					javascriptreact = { "prettierd", "prettier", stop_after_first = true },
					typescriptreact = { "prettierd", "prettier", stop_after_first = true },
					-- json = { "prettierd", "prettier", stop_after_first = true },
					-- yaml = { "prettierd", "prettier", stop_after_first = true },
					-- markdown = { "prettierd", "prettier", stop_after_first = true },
					-- html = { "prettierd", "prettier", stop_after_first = true },
					-- css = { "prettierd", "prettier", stop_after_first = true },
					-- scss = { "prettierd", "prettier", stop_after_first = true },
					-- rust = { "rustfmt" },
					-- go = { "gofmt", "goimports" },
					-- sh = { "shfmt" },
					-- c = { "clang_format" },
					-- cpp = { "clang_format" },
				},
				format_on_save = {
					timeout_ms = 500,
					lsp_fallback = true,
				},
			})

			vim.keymap.set({ "n", "v" }, "<leader>cf", function()
				require("conform").format({
					lsp_fallback = true,
					async = false,
					timeout_ms = 500,
				})
			end, { desc = "Format file or range" })
		end,
	},
}
