vim.pack.add({
	"https://github.com/echasnovski/mini.icons",
	"https://github.com/echasnovski/mini.nvim",
	"https://github.com/windwp/nvim-ts-autotag",
})

require("mini.icons").setup()
MiniIcons.mock_nvim_web_devicons()

-- Mini.nvim configuration
-- Changed: Removed Lazy.nvim spec wrapper. Calls setup() for each mini module directly.

require("mini.statusline").setup({
	content = {
		active = function()
			local mode = MiniStatusline.section_mode({})
			local filename = MiniStatusline.section_filename({})
			return MiniStatusline.combine_groups({
				{ hl = "MiniStatuslineMode", strings = { mode } },
				{ hl = "MiniStatuslineFilename", strings = { filename } },
			})
		end,
	},
	use_icons = true,
	set_vim_settings = true,
})

local highlights = {
	"StatusLine",
	"MiniStatuslineFileinfo",
	"MiniStatuslineMode",
	"MiniStatuslineFilename",
}
for _, hl in ipairs(highlights) do
	vim.api.nvim_set_hl(0, hl, { bg = "none", ctermbg = "none" })
end

require("mini.pairs").setup()
-- require("mini.surround").setup()
-- require("mini.comment").setup()
require("mini.ai").setup()
-- require("mini.splitjoin").setup()
require("mini.hipatterns").setup({
	highlighters = {
		hex_color = require("mini.hipatterns").gen_highlighter.hex_color(),
	},
})
require("mini.starter").setup({
	items = {
		function()
			local recent_files = require("mini.starter").sections.recent_files(5, true, false)()
			for _, item in ipairs(recent_files) do
				item.section = "Recent files"
			end
			return recent_files
		end,
		{ name = "Quit", action = "qa", section = "Actions" },
		-- Changed: "Lazy" action replaced with "Pack Update" since Lazy.nvim is removed
		{ name = "Pack Update", action = "lua vim.pack.update()", section = "Actions" },
	},
	content_hooks = {
		require("mini.starter").gen_hook.adding_bullet(),
		require("mini.starter").gen_hook.padding(3, 2),
		require("mini.starter").gen_hook.aligning("center", "center"),
	},
	footer = "",
	header = "",
})

-- nvim-ts-autotag (was bundled in mini.lua's Lazy spec)
require("nvim-ts-autotag").setup({})
