vim.pack.add({ "https://github.com/nvim-treesitter/nvim-treesitter" })

-- Treesitter configuration
-- Changed: Removed Lazy.nvim spec wrapper.
-- Note: Neovim 0.13 has built-in treesitter highlighting enabled via ftplugins for
-- bundled parsers (C, Lua, Markdown, Vimscript, Vimdoc, Query).
-- nvim-treesitter (main branch) is now primarily a parser installer.
-- Highlighting and indentation are handled natively by Neovim.

-- Configure the parser installer
require("nvim-treesitter").setup()

-- Register bash parser for zsh files
vim.treesitter.language.register("bash", "zsh")

-- Auto-install parsers when a file is opened and no parser is available
local installing = {}

vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("treesitter_auto_install", { clear = true }),
	callback = function(ev)
		local lang = vim.treesitter.language.get_lang(ev.match) or ev.match
		
		-- Svelte files require html, css, javascript, typescript for injections
		local dependencies = {}
		if lang == "svelte" then
			dependencies = { "html", "css", "javascript", "typescript" }
		end
		
		local langs_to_check = { lang }
		for _, dep in ipairs(dependencies) do
			table.insert(langs_to_check, dep)
		end

		local ts = require("nvim-treesitter")
		local available = ts.get_available()
		local installed = ts.get_installed()

		for _, l in ipairs(langs_to_check) do
			if not vim.tbl_contains(installed, l) and vim.tbl_contains(available, l) and not installing[l] then
				installing[l] = true
				pcall(function() ts.install(l) end)
			end
		end

		if vim.treesitter.language.add(lang) then
			-- Parser available, enable highlighting
			vim.treesitter.start(ev.buf, lang)
		else
			-- Start highlighting later once install finishes
			vim.defer_fn(function()
				if vim.treesitter.language.add(lang) then
					pcall(function() vim.treesitter.start(ev.buf, lang) end)
				end
			end, 3000)
		end
	end,
})
