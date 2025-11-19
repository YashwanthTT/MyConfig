-- vim.pack.add({
-- 	{ src = "https://github.com/folke/tokyonight.nvim" },
-- })
--
-- require("tokyonight").setup({
-- 	transparent = true,
-- 	styles = {
-- 		sidebars = "transparent",
-- 		floats = "transparent",
-- 	},
-- })
--
-- vim.cmd.colorscheme("tokyonight")
--
-- -- apply extended transparency to various ui elements
-- local function set_transparency()
-- 	vim.cmd([[
--     hi pmenu guibg=none ctermbg=none
--     hi pmenusel guibg=#137ec9 ctermbg=none
--     hi normal guibg=none ctermbg=none
--     hi normalnc guibg=none ctermbg=none
--     hi signcolumn guibg=none ctermbg=none
--     hi statusline guibg=none ctermbg=none
--     hi statuslinenc guibg=none ctermbg=none
--     hi vertsplit guibg=none ctermbg=none
--     hi tabline guibg=none ctermbg=none
--     hi tablinefill guibg=none ctermbg=none
--     hi tablinesel guibg=none ctermbg=none
--     hi neotreenormal guibg=none ctermbg=none
--     hi neotreenormalnc guibg=none ctermbg=none
--     hi neotreewinseparator guibg=none ctermbg=none
--     hi cursorline guibg=none ctermbg=none
--     hi MiniStatuslineMode guibg=none ctermbg=none
--     hi MiniStatuslineFilename guibg=none ctermbg=none
--     hi MiniStatuslineFileinfo guibg=none ctermbg=none
--     hi MiniStatuslineInactive guibg=none ctermbg=none
--   ]])
-- end
--
-- set_transparency()
-- vim.api.nvim_create_autocmd("bufenter", {
-- 	pattern = "*",
-- 	callback = set_transparency,
-- })

vim.pack.add({
	{ src = "https://github.com/scottmckendry/cyberdream.nvim" },
})

require("cyberdream").setup({
	transparent = true,
})

vim.cmd("colorscheme cyberdream")

vim.cmd([[
    hi pmenu guibg=none ctermbg=none
    hi pmenusel guibg=#137ec9 ctermbg=none
    hi normal guibg=none ctermbg=none
    hi normalnc guibg=none ctermbg=none
    hi signcolumn guibg=none ctermbg=none
    hi statusline guibg=none ctermbg=none
    hi statuslinenc guibg=none ctermbg=none
    hi vertsplit guibg=none ctermbg=none
    hi tabline guibg=none ctermbg=none
    hi tablinefill guibg=none ctermbg=none
    hi tablinesel guibg=none ctermbg=none
    hi neotreenormal guibg=none ctermbg=none
    hi neotreenormalnc guibg=none ctermbg=none
    hi neotreewinseparator guibg=none ctermbg=none
    hi cursorline guibg=none ctermbg=none
    hi MiniStatuslineMode guibg=none ctermbg=none
    hi LineNr guibg=none ctermbg=none
    hi CursorLineNr guibg=none ctermbg=none
    hi Folded guibg=none ctermbg=none
    hi FoldColumn guibg=none ctermbg=none
    hi EndOfBuffer guibg=none ctermbg=none
    hi WinSeparator guibg=none ctermbg=none
    hi FloatBorder guibg=none ctermbg=none
    hi NormalFloat guibg=none ctermbg=none
  ]])
