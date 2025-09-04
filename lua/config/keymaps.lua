-- [[ Basic Keymaps ]]
-- See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = 'Clear search highlights' })

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode with double escape
vim.keymap.set('t', '<Esc><Esc>', '<C-\\\\><C-n>', { desc = 'Exit terminal mode' })

-- Window navigation with Ctrl+hjkl
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- [[ Warp Terminal Integration ]]
-- Function to open Warp in current directory
local function open_warp_here()
  local current_dir = vim.fn.getcwd()
  vim.fn.system('open -a Warp "' .. current_dir .. '"')
end

-- Function to open Warp in current file's directory
local function open_warp_file_dir()
  local file_dir = vim.fn.expand('%:p:h')
  vim.fn.system('open -a Warp "' .. file_dir .. '"')
end

-- Create user commands for Warp
vim.api.nvim_create_user_command('WarpHere', open_warp_here, { desc = 'Open Warp in current working directory' })
vim.api.nvim_create_user_command('WarpFile', open_warp_file_dir, { desc = 'Open Warp in current file directory' })

-- Keymaps for Warp
vim.keymap.set('n', '<leader>tw', open_warp_here, { desc = '[T]erminal [W]arp here' })
vim.keymap.set('n', '<leader>tf', open_warp_file_dir, { desc = '[T]erminal [F]ile directory in Warp' })

-- [[ Disabled helpful arrow key reminders ]]
-- Uncomment these if you want to learn hjkl movement
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')
