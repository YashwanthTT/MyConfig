vim.pack.add({
	{ src = "https://github.com/stevearc/conform.nvim" },
})

require("conform").setup({
	-- Map of filetype to formatters
	formatters_by_ft = {
		lua = { "stylua" },
		go = { "goimports", "gofmt" },
		rust = { "rustfmt", lsp_format = "fallback" },
		python = function(bufnr)
			if require("conform").get_formatter_info("ruff_format", bufnr).available then
				return { "ruff_format" }
			else
				return { "isort", "black" }
			end
		end,
		markdown = { "prettier" },
		["*"] = { "codespell" },
		["_"] = { "trim_whitespace" },
		javascript = { "prettier", "eslint_d" },
		typescript = { "prettier", "eslint_d" },
	},
	default_format_opts = {
		lsp_format = "fallback",
	},
	format_on_save = {
		lsp_format = "fallback",
		timeout_ms = 500,
	},
	format_after_save = {
		lsp_format = "fallback",
	},
	log_level = vim.log.levels.ERROR,
	notify_on_error = true,
	notify_no_formatters = true,
	formatters = {
		my_formatter = {
			command = "my_cmd",
			args = { "--stdin-from-filename", "$FILENAME" },
			range_args = function(self, ctx)
				return { "--line-start", ctx.range.start[1], "--line-end", ctx.range["end"][1] }
			end,
			stdin = true,
			cwd = require("conform.util").root_file({ ".editorconfig", "package.json" }),
			require_cwd = true,
			tmpfile_format = ".conform.$RANDOM.$FILENAME",
			condition = function(self, ctx)
				return vim.fs.basename(ctx.filename) ~= "README.md"
			end,
			exit_codes = { 0, 1 },
			env = {
				VAR = "value",
			},
			inherit = true,
			prepend_args = { "--use-tabs" },
			append_args = { "--trailing-comma" },
		},
		other_formatter = function(bufnr)
			return {
				command = "my_cmd",
			}
		end,
	},
})

require("conform").formatters_by_ft.lua = { "stylua" }
require("conform").formatters.my_formatter = {
	command = "my_cmd",
}
