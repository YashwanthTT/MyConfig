vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

--Write and Quit
vim.keymap.set('n', '<leader>qq', '<cmd>quit<CR>', { desc = 'Quit' })
vim.keymap.set('n', '<leader>ww', '<cmd>write<CR>', { desc = 'Write' })

-- Terminal mode exit
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Window navigation
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Window management
vim.keymap.set('n', '<leader>wv', '<C-w>v', { desc = 'Split window vertically' })
vim.keymap.set('n', '<leader>wh', '<C-w>s', { desc = 'Split window horizontally' })
vim.keymap.set('n', '<leader>wd', '<cmd>close<CR>', { desc = 'Close current window' })

-- Visual mode
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move line down' })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move line up' })

-- Replace word under cursor
vim.keymap.set('n', '<leader>rr', [[:%s/\<<C-r><C-w>\>//g<Left><Left>]], { desc = 'Live preview replace' })
vim.keymap.set('v', '<leader>rr', [[:s/\<<C-r><C-w>\>//g<Left><Left>]], { desc = 'Replace word under cursor (selection)' })

-- Swap ; and :
vim.keymap.set({ 'n', 'v', 'x' }, ';', ':')
vim.keymap.set({ 'n', 'v', 'x' }, ':', ';')

-- Mini
vim.keymap.set('n', '<leader><space>', '<cmd>Pick files<CR>', { desc = 'Files' })
vim.keymap.set('n', '<leader>ff', '<cmd>Pick files<CR>', { desc = 'Files' })
vim.keymap.set('n', '<leader>fb', '<cmd>Pick buffers<CR>', { desc = 'Buffers' })
vim.keymap.set('n', '<leader>fg', '<cmd>Pick grep_live<CR>', { desc = 'Live Grep' })

