-- Backend Development Tools
-- Database, env files, logs, and search/replace

return {
  -- Database client (vim-dadbod)
  {
    'tpope/vim-dadbod',
    cmd = { 'DB', 'DBUI', 'DBUIToggle', 'DBUIAddConnection', 'DBUIFindBuffer' },
    dependencies = {
      {
        'kristijanhusak/vim-dadbod-ui',
        cmd = { 'DBUI', 'DBUIToggle', 'DBUIAddConnection', 'DBUIFindBuffer' },
        init = function()
          vim.g.db_ui_use_nerd_fonts = 1
          vim.g.db_ui_show_database_icon = 1
          vim.g.db_ui_force_echo_notifications = 1
          vim.g.db_ui_win_position = 'left'
          vim.g.db_ui_winwidth = 40
          vim.g.db_ui_icons = {
            expanded = '▾',
            collapsed = '▸',
            saved_query = '*',
            new_query = '+',
            tables = '~',
            buffers = '»',
            connection_ok = '✓',
            connection_error = '✕',
          }
        end,
      },
      {
        'kristijanhusak/vim-dadbod-completion',
        ft = { 'sql', 'mysql', 'plsql' },
        init = function()
          vim.api.nvim_create_autocmd('FileType', {
            pattern = { 'sql', 'mysql', 'plsql' },
            callback = function()
              require('cmp').setup.buffer { sources = { { name = 'vim-dadbod-completion' } } }
            end,
          })
        end,
      },
    },
    keys = {
      { '<leader>Dt', '<cmd>DBUIToggle<cr>', desc = 'Toggle DB UI' },
      { '<leader>Df', '<cmd>DBUIFindBuffer<cr>', desc = 'Find DB Buffer' },
      { '<leader>Da', '<cmd>DBUIAddConnection<cr>', desc = 'Add Connection' },
      { '<leader>Dr', '<cmd>DBUIRenameBuffer<cr>', desc = 'Rename Buffer' },
      { '<leader>Dq', '<cmd>DBUILastQueryInfo<cr>', desc = 'Last Query Info' },
    },
  },

  -- Environment variables (.env files)
  {
    'ellisonleao/dotenv.nvim',
    config = function()
      require('dotenv').setup {
        enable_on_load = true,
        verbose = false,
      }
    end,
  },

  -- JSON exploration (jqx)
  {
    'gennaro-tedesco/nvim-jqx',
    ft = { 'json', 'yaml' },
    keys = {
      { '<leader>jq', '<cmd>JqxList<cr>', desc = 'Jqx List' },
      { '<leader>jQ', '<cmd>JqxQuery<cr>', desc = 'Jqx Query' },
    },
  },

  -- Log file syntax highlighting
  {
    'fei6409/log-highlight.nvim',
    ft = { 'log' },
    opts = {
      extension = { 'log', '*.log.*' },
      filename = {
        'messages',
        'access.log',
        'error.log',
      },
      pattern = {
        '/var/log/.*',
        'messages%.%d',
        '*.log',
      },
    },
  },

  -- Project-wide search and replace (Spectre)
  {
    'nvim-pack/nvim-spectre',
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
      { '<leader>Sr', function() require('spectre').open() end, desc = 'Search & Replace' },
      { '<leader>Sw', function() require('spectre').open_visual { select_word = true } end, desc = 'Search Word' },
      { '<leader>Sf', function() require('spectre').open_file_search { select_word = true } end, desc = 'Search in File' },
      { '<leader>Sr', function() require('spectre').open_visual() end, mode = 'v', desc = 'Search Selection' },
    },
    opts = {
      open_cmd = 'noswapfile vnew',
      live_update = true,
      is_insert_mode = false,
      highlight = {
        ui = 'String',
        search = 'DiffChange',
        replace = 'DiffDelete',
      },
    },
  },

  -- Better quickfix window
  {
    'kevinhwang91/nvim-bqf',
    ft = 'qf',
    opts = {
      preview = {
        winblend = 0,
        border = 'rounded',
      },
    },
  },
}
