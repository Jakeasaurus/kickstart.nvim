-- =====================================================================
-- ==================== KICKSTART.NVIM MODULAR CONFIG ================
-- =====================================================================
--
-- Kickstart.nvim is a starting point for your own configuration.
-- The goal is that you can read every line of code, understand
-- what your configuration is doing, and modify it to suit your needs.
--
-- If you don't know anything about Lua, I recommend:
--   - https://learnxinyminutes.com/docs/lua/
--   - :help lua-guide
--   - (HTML version): https://neovim.io/doc/user/lua-guide.html
--
-- Kickstart Guide:
--   1. Run `:Tutor` in Neovim (if you're new to Vim)
--   2. Run `:help` to learn about Neovim's help system
--   3. Use `<space>sh` to search help documentation
--   4. Run `:checkhealth` to diagnose any issues
--
-- NOTE: This configuration has been modularized for better organization.
-- Each module can be found in lua/config/ and lua/plugins/

-- [[ Import core configuration ]]
require 'config.options'      -- Editor settings and options
require 'config.keymaps'      -- Key bindings
require 'config.autocommands' -- Auto commands
require 'config.lazy'         -- Plugin management

-- Configuration is complete! 
-- Your journey with Neovim starts here. Happy coding! 🚀

-- vim: ts=2 sts=2 sw=2 et
