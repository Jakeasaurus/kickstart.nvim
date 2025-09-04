-- Core essential plugins that are fundamental to the editor

return {
  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',

  -- Enhanced Lua development for Neovim
  {
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {
      library = {
        -- Load luvit types when the `vim.uv` word is found
        { path = 'luvit-meta/library', words = { 'vim%.uv' } },
      },
    },
  },
  { 'Bilal2453/luvit-meta', lazy = true },

  -- Highlight, edit, and navigate code
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    main = 'nvim-treesitter.configs',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    opts = {
      ensure_installed = {
        'bash',
        'c',
        'diff',
        'html',
        'lua',
        'luadoc',
        'markdown',
        'markdown_inline',
        'query',
        'vim',
        'vimdoc',
        'terraform',
        'hcl',
        'go',
        'latex',
        'norg',
        'scss',
        'tsx',
        'typst',
        'vue',
        'python',
        'javascript',
        'typescript',
      },
      auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = { 'ruby' },
      },
      indent = { enable = true, disable = { 'ruby' } },
      
      -- Enhanced text objects for better code navigation
      textobjects = {
        select = {
          enable = true,
          lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
          keymaps = {
            -- You can use the capture groups defined in textobjects.scm
            ['af'] = '@function.outer',
            ['if'] = '@function.inner',
            ['ac'] = '@class.outer',
            ['ic'] = '@class.inner',
            ['aa'] = '@parameter.outer',
            ['ia'] = '@parameter.inner',
            ['ab'] = '@block.outer',
            ['ib'] = '@block.inner',
            ['al'] = '@loop.outer',
            ['il'] = '@loop.inner',
            ['ai'] = '@conditional.outer',
            ['ii'] = '@conditional.inner',
            ['am'] = '@comment.outer',
            ['im'] = '@comment.inner',
          },
        },
        move = {
          enable = true,
          set_jumps = true, -- whether to set jumps in the jumplist
          goto_next_start = {
            [']f'] = '@function.outer',
            [']c'] = '@class.outer',
            [']a'] = '@parameter.inner',
            [']b'] = '@block.outer',
            [']l'] = '@loop.outer',
            [']i'] = '@conditional.outer',
            [']m'] = '@comment.outer',
          },
          goto_next_end = {
            [']F'] = '@function.outer',
            [']C'] = '@class.outer',
            [']A'] = '@parameter.inner',
            [']B'] = '@block.outer',
            [']L'] = '@loop.outer',
            [']I'] = '@conditional.outer',
            [']M'] = '@comment.outer',
          },
          goto_previous_start = {
            ['[f'] = '@function.outer',
            ['[c'] = '@class.outer',
            ['[a'] = '@parameter.inner',
            ['[b'] = '@block.outer',
            ['[l'] = '@loop.outer',
            ['[i'] = '@conditional.outer',
            ['[m'] = '@comment.outer',
          },
          goto_previous_end = {
            ['[F'] = '@function.outer',
            ['[C'] = '@class.outer',
            ['[A'] = '@parameter.inner',
            ['[B'] = '@block.outer',
            ['[L'] = '@loop.outer',
            ['[I'] = '@conditional.outer',
            ['[M'] = '@comment.outer',
          },
        },
        swap = {
          enable = true,
          swap_next = {
            ['<leader>na'] = '@parameter.inner', -- swap parameters/argument with next
            ['<leader>nf'] = '@function.outer', -- swap function with next
          },
          swap_previous = {
            ['<leader>pa'] = '@parameter.inner', -- swap parameters/argument with prev
            ['<leader>pf'] = '@function.outer', -- swap function with previous
          },
        },
      },
    },
  },

  -- Smart commenting for all languages
  {
    'numToStr/Comment.nvim',
    opts = {
      -- Add a space b/w comment and the line
      padding = true,
      -- Whether the cursor should stay at its position
      sticky = true,
      -- Lines to be ignored while (un)comment
      ignore = nil,
      -- LHS of toggle mappings in NORMAL mode
      toggler = {
        line = 'gcc', -- Line-comment toggle keymap
        block = 'gbc', -- Block-comment toggle keymap
      },
      -- LHS of operator-pending mappings in NORMAL and VISUAL mode
      opleader = {
        line = 'gc', -- Line-comment keymap
        block = 'gb', -- Block-comment keymap
      },
      -- LHS of extra mappings
      extra = {
        above = 'gcO', -- Add comment on the line above
        below = 'gco', -- Add comment on the line below
        eol = 'gcA', -- Add comment at the end of line
      },
      -- Enable keybindings
      mappings = {
        basic = true, -- Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
        extra = true, -- Extra mapping; `gco`, `gcO`, `gcA`
      },
      -- Function to call before (un)comment
      pre_hook = nil,
      -- Function to call after (un)comment
      post_hook = nil,
    },
    lazy = false,
  },

  -- Collection of various small independent plugins/modules
  {
    'echasnovski/mini.nvim',
    config = function()
      -- Better Around/Inside textobjects
      require('mini.ai').setup { n_lines = 500 }
      
      -- Add/delete/replace surroundings (brackets, quotes, etc.)
      require('mini.surround').setup()

      -- Simple statusline
      local statusline = require 'mini.statusline'
      statusline.setup { use_icons = vim.g.have_nerd_font }
      
      -- Custom statusline location format
      ---@diagnostic disable-next-line: duplicate-set-field
      statusline.section_location = function()
        return '%2l:%-2v'
      end

      -- Session management
      require('mini.sessions').setup()
    end,
  },
}
