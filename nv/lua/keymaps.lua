vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Normal mode
vim.keymap.set('n', '<leader>nh', ':nohl<CR>', { desc = 'Clear search highlights' })
vim.keymap.set('n', '<leader>+', '<C-a>', { desc = 'Increment number' })
vim.keymap.set('n', '<leader>-', '<C-x>', { desc = 'Decrement number' })
vim.keymap.set('n', '<leader>e', '<cmd>Ex<cr>', { desc = 'Open the file explorer' })

-- Window management
vim.keymap.set('n', '<leader>wv', '<C-w>v', { desc = 'Split window vertically' })
vim.keymap.set('n', '<leader>wh', '<C-w>s', { desc = 'Split window horizontally' })
vim.keymap.set('n', '<leader>we', '<C-w>=', { desc = 'Make splits equal size' })
vim.keymap.set('n', '<leader>wd', '<cmd>close<CR>', { desc = 'Close current window' })

-- Tab management
vim.keymap.set('n', '<leader>to', '<cmd>tabnew<CR>', { desc = 'Open new tab' })
vim.keymap.set('n', '<leader>tx', '<cmd>tabclose<CR>', { desc = 'Close current tab' })
vim.keymap.set('n', '<leader>tn', '<cmd>tabn<CR>', { desc = 'Go to next tab' })
vim.keymap.set('n', '<leader>tp', '<cmd>tabp<CR>', { desc = 'Go to previous tab' })

-- Visual mode
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move line down' })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move line up' })

-- Replace word under cursor
vim.keymap.set('n', '<leader>rr', [[:%s/\<<C-r><C-w>\>//g<Left><Left>]], { desc = 'Live preview replace' })
vim.keymap.set('v', '<leader>rr', [[:s/\<<C-r><C-w>\>//g<Left><Left>]], { desc = 'Replace word under cursor (selection)' })

-- Insert mode
vim.keymap.set('i', 'jk', '<ESC>', { desc = 'Exit insert mode' })

vim.keymap.set({ 'n', 'v', 'x' }, ';', ':')
vim.keymap.set({ 'n', 'v', 'x' }, ':', ';')

-- Neotree
vim.keymap.set('n', '<leader>e', '<cmd>Neotree toggle<CR>', { desc = 'neotree' })

-- Mini
vim.keymap.set('n', '<leader><space>', '<cmd>Pick files<CR>', { desc = 'Files' })
vim.keymap.set('n', '<leader>ff', '<cmd>Pick files<CR>', { desc = 'Files' })
vim.keymap.set('n', '<leader>fb', '<cmd>Pick buffers<CR>', { desc = 'Buffers' })
vim.keymap.set('n', '<leader>fg', '<cmd>Pick grep_live<CR>', { desc = 'Live Grep' })

-- Lazygit
-- vim.keymap.set("n", "<leader>gg", "<cmd>LazyGit<CR>", { desc = "Lazygit" })
