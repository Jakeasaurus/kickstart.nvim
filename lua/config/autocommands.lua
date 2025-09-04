-- [[ Basic Autocommands ]]
-- See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Set HCL file comment string for Terraform
vim.api.nvim_create_autocmd('FileType', {
  desc = 'Set HCL comment string',
  group = vim.api.nvim_create_augroup('hcl-filetype', { clear = true }),
  pattern = 'hcl',
  callback = function()
    vim.bo.commentstring = '# %s'
  end,
})
