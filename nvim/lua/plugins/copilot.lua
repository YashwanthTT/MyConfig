return {
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		keys = {
			{ "<leader>ce", "<cmd>Copilot enable<cr>", desc = "Copilot Enable" },
			{ "<leader>cd", "<cmd>Copilot disable<cr>", desc = "Copilot Disable" },
			{ "<leader>ct", "<cmd>Copilot toggle<cr>", desc = "Copilot Toggle" },
		},
		opts = {
			-- Disable the panel — we only want inline ghost text
			panel = { enabled = false },

			suggestion = {
				enabled = true,
				auto_trigger = true, -- Show suggestions automatically as you type
				hide_during_completion = true, -- Hide ghost text when blink.cmp menu is visible
				debounce = 75,
				trigger_on_accept = true, -- Chain suggestions after accepting one
				keymap = {
					accept = "<Tab>", -- Accept the full suggestion with Tab
					accept_word = "<M-Right>", -- Accept next word
					accept_line = "<M-Down>", -- Accept next line
					next = "<M-]>", -- Cycle to next suggestion
					prev = "<M-[>", -- Cycle to previous suggestion
					dismiss = "<C-]>", -- Dismiss suggestion
				},
			},
		},
		config = function(_, opts)
			require("copilot").setup(opts)

			-- Ghost text highlight — dimmed white/grey like VS Code's Copilot ghost text
			-- Applied via ColorScheme autocmd so it persists across colorscheme reloads
			vim.api.nvim_create_autocmd("ColorScheme", {
				pattern = "*",
				callback = function()
					vim.api.nvim_set_hl(0, "CopilotSuggestion", { fg = "#6b7280", italic = true })
					vim.api.nvim_set_hl(0, "CopilotAnnotation", { fg = "#6b7280", italic = true })
				end,
			})

			-- Apply immediately for the current colorscheme
			vim.api.nvim_set_hl(0, "CopilotSuggestion", { fg = "#6b7280", italic = true })
			vim.api.nvim_set_hl(0, "CopilotAnnotation", { fg = "#6b7280", italic = true })

			-- Leader keymaps for Copilot enable/disable
			vim.keymap.set("n", "<leader>ce", "<cmd>Copilot enable<cr>", { desc = "Copilot Enable" })
			vim.keymap.set("n", "<leader>cd", "<cmd>Copilot disable<cr>", { desc = "Copilot Disable" })
		end,
	},
}
