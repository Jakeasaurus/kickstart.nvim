---- nvim v0.8.0
--return {
--  'kdheepak/lazygit.nvim',
--  lazy = true,
--  cmd = {
--    'LazyGit',
--    'LazyGitConfig',
--    'LazyGitCurrentFile',
--    'LazyGitFilter',
--    'LazyGitFilterCurrentFile',
--  },
--  -- optional for floating window border decoration
--  dependencies = {
--    'nvim-lua/plenary.nvim',
--  },
--  -- setting the keybinding for LazyGit with 'keys' is recommended in
--  -- order to load the plugin when the command is run for the first time
--  keys = {
--    { '<leader>lg', '<cmd>LazyGit<cr>', desc = 'LazyGit' },
--  },
--}

-- lazy.nvim
return {
  'folke/snacks.nvim',
  ---@type snacks.Config
  opts = {
    lazygit = {
      -- your lazygit configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },
}
