return {
	{
		"saghen/blink.cmp",
		lazy = false,
		dependencies = "rafamadriz/friendly-snippets",
		version = "v0.*",
		opts = {
			keymap = {
				preset = "default",
				["<CR>"] = { "accept", "fallback" },
			},
			appearance = {
				use_nvim_cmp_as_default = true,
				nerd_font_variant = "mono",
			},
			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
			},
			completion = {
				documentation = {
					auto_show = true,
					auto_show_delay_ms = 500,
				},
			},
			signature = { enabled = true },
		},
		opts_extend = { "sources.default" },
	},
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"saghen/blink.cmp",
		},
		config = function()
			require("mason").setup({
				ui = {
					border = "rounded",
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})

			local mason_lspconfig = require("mason-lspconfig")
			mason_lspconfig.setup({
				ensure_installed = {
					"lua_ls",
					"pyright",
					"ts_ls",
					"rust_analyzer",
					"gopls",
					"clangd",
					"html",
					"cssls",
					"jsonls",
					"yamlls",
					"bashls",
				},
				automatic_installation = true,
			})

			local on_attach = function(client, bufnr)
				local opts = { buffer = bufnr }

				vim.keymap.set(
					"n",
					"gd",
					vim.lsp.buf.definition,
					vim.tbl_extend("force", opts, { desc = "Go to definition" })
				)
				vim.keymap.set(
					"n",
					"gD",
					vim.lsp.buf.declaration,
					vim.tbl_extend("force", opts, { desc = "Go to declaration" })
				)
				vim.keymap.set(
					"n",
					"gi",
					vim.lsp.buf.implementation,
					vim.tbl_extend("force", opts, { desc = "Go to implementation" })
				)
				vim.keymap.set(
					"n",
					"gt",
					vim.lsp.buf.type_definition,
					vim.tbl_extend("force", opts, { desc = "Go to type definition" })
				)
				vim.keymap.set(
					"n",
					"gr",
					vim.lsp.buf.references,
					vim.tbl_extend("force", opts, { desc = "Show references" })
				)
				vim.keymap.set(
					"n",
					"K",
					vim.lsp.buf.hover,
					vim.tbl_extend("force", opts, { desc = "Hover documentation" })
				)
				vim.keymap.set(
					"n",
					"<leader>ca",
					vim.lsp.buf.code_action,
					vim.tbl_extend("force", opts, { desc = "Code action" })
				)
				vim.keymap.set(
					"n",
					"<leader>rn",
					vim.lsp.buf.rename,
					vim.tbl_extend("force", opts, { desc = "Rename symbol" })
				)
				vim.keymap.set(
					"n",
					"<leader>ds",
					vim.lsp.buf.document_symbol,
					vim.tbl_extend("force", opts, { desc = "Document symbols" })
				)
				vim.keymap.set(
					"n",
					"<leader>ws",
					vim.lsp.buf.workspace_symbol,
					vim.tbl_extend("force", opts, { desc = "Workspace symbols" })
				)
				vim.keymap.set(
					"n",
					"[d",
					vim.diagnostic.goto_prev,
					vim.tbl_extend("force", opts, { desc = "Previous diagnostic" })
				)
				vim.keymap.set(
					"n",
					"]d",
					vim.diagnostic.goto_next,
					vim.tbl_extend("force", opts, { desc = "Next diagnostic" })
				)
				vim.keymap.set(
					"n",
					"<leader>cd",
					vim.diagnostic.open_float,
					vim.tbl_extend("force", opts, { desc = "Show diagnostic" })
				)

				vim.keymap.set(
					"i",
					"<C-h>",
					vim.lsp.buf.signature_help,
					vim.tbl_extend("force", opts, { desc = "Signature help" })
				)
			end

			local capabilities = require("blink.cmp").get_lsp_capabilities(vim.lsp.protocol.make_client_capabilities())

			local default_config = {
				on_attach = on_attach,
				capabilities = capabilities,
			}

			vim.lsp.config(
				"lua_ls",
				vim.tbl_deep_extend("force", default_config, {
					settings = {
						Lua = {
							runtime = { version = "LuaJIT" },
							workspace = {
								checkThirdParty = false,
								library = {
									vim.env.VIMRUNTIME,
								},
							},
							completion = {
								callSnippet = "Replace",
							},
							diagnostics = {
								globals = { "vim" },
							},
						},
					},
				})
			)

			vim.lsp.config(
				"pyright",
				vim.tbl_deep_extend("force", default_config, {
					settings = {
						python = {
							analysis = {
								autoSearchPaths = true,
								diagnosticMode = "workspace",
								useLibraryCodeForTypes = true,
							},
						},
					},
				})
			)

			vim.lsp.config(
				"ts_ls",
				vim.tbl_deep_extend("force", default_config, {
					settings = {
						typescript = {
							inlayHints = {
								includeInlayParameterNameHints = "all",
								includeInlayParameterNameHintsWhenArgumentMatchesName = false,
								includeInlayFunctionParameterTypeHints = true,
								includeInlayVariableTypeHints = true,
								includeInlayPropertyDeclarationTypeHints = true,
								includeInlayFunctionLikeReturnTypeHints = true,
								includeInlayEnumMemberValueHints = true,
							},
						},
						javascript = {
							inlayHints = {
								includeInlayParameterNameHints = "all",
								includeInlayParameterNameHintsWhenArgumentMatchesName = false,
								includeInlayFunctionParameterTypeHints = true,
								includeInlayVariableTypeHints = true,
								includeInlayPropertyDeclarationTypeHints = true,
								includeInlayFunctionLikeReturnTypeHints = true,
								includeInlayEnumMemberValueHints = true,
							},
						},
					},
				})
			)

			for _, server in ipairs({
				"rust_analyzer",
				"gopls",
				"clangd",
				"html",
				"cssls",
				"jsonls",
				"yamlls",
				"bashls",
			}) do
				vim.lsp.config(server, default_config)
			end

			vim.lsp.enable({
				"lua_ls",
				"pyright",
				"ts_ls",
				"rust_analyzer",
				"gopls",
				"clangd",
				"html",
				"cssls",
				"jsonls",
				"yamlls",
				"bashls",
			})

			vim.diagnostic.config({
				virtual_text = true,
				signs = false,
				underline = true,
				update_in_insert = false,
				severity_sort = true,
				float = {
					border = "rounded",
					source = "always",
					header = "",
					prefix = "",
				},
			})
		end,
	},
	{
		"williamboman/mason.nvim",
		cmd = "Mason",
		build = ":MasonUpdate",
	},
}
