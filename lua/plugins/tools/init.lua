-- Development tools and utilities

return {
  -- File manager
  {
    'stevearc/oil.nvim',
    opts = {},
    dependencies = { { 'echasnovski/mini.icons', opts = {} } },
    lazy = false,
  },

  -- Better notifications and command line UI
  {
    'folke/noice.nvim',
    event = 'VeryLazy',
    enabled = true, -- Enabled: provides enhanced UI for messages, cmdline and popupmenu
    opts = {
      cmdline = {
        view = "cmdline_popup", -- Use popup view for command line
        opts = {}, -- global options for the cmdline_popup view
      },
      lsp = {
        -- Override markdown rendering so that **cmp** and other plugins use **Treesitter**
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },
      -- You can enable a preset for easier configuration
      presets = {
        bottom_search = false, -- Don't use classic bottom cmdline for search
        command_palette = true, -- Position the cmdline and popupmenu together
        long_message_to_split = true, -- Long messages will be sent to a split
        inc_rename = false, -- Enables an input dialog for inc-rename.nvim
        lsp_doc_border = false, -- Add a border to hover docs and signature help
      },
      views = {
        cmdline_popup = {
          position = {
            row = "50%", -- Center vertically
            col = "50%", -- Center horizontally
          },
          size = {
            width = 60,
            height = "auto",
          },
        },
      },
    },
    dependencies = {
      'MunifTanjim/nui.nvim',
      'rcarriga/nvim-notify',
    },
  },
}
