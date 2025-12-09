-- Navigation & Productivity
return {
  -- Harpoon for quick file access
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
      {
        '<leader>ha',
        function()
          require('harpoon'):list():add()
        end,
        desc = 'Harpoon Add',
      },
      {
        '<leader>hh',
        function()
          local harpoon = require 'harpoon'
          harpoon.ui:toggle_quick_menu(harpoon:list())
        end,
        desc = 'Harpoon Menu',
      },
      {
        '<leader>1',
        function()
          require('harpoon'):list():select(1)
        end,
        desc = 'Harpoon 1',
      },
      {
        '<leader>2',
        function()
          require('harpoon'):list():select(2)
        end,
        desc = 'Harpoon 2',
      },
      {
        '<leader>3',
        function()
          require('harpoon'):list():select(3)
        end,
        desc = 'Harpoon 3',
      },
      {
        '<leader>4',
        function()
          require('harpoon'):list():select(4)
        end,
        desc = 'Harpoon 4',
      },
      {
        '<leader>5',
        function()
          require('harpoon'):list():select(5)
        end,
        desc = 'Harpoon 5',
      },
    },
    opts = {},
  },

  -- Symbol outline
  {
    'stevearc/aerial.nvim',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-tree/nvim-web-devicons',
    },
    keys = {
      { '<leader>co', '<cmd>AerialToggle<cr>', desc = 'Code Outline' },
      { '<leader>cO', '<cmd>AerialNavToggle<cr>', desc = 'Code Outline Nav' },
    },
    opts = {
      backends = { 'lsp', 'treesitter', 'markdown', 'man' },
      layout = {
        min_width = 30,
        default_direction = 'right',
      },
      attach_mode = 'global',
      filter_kind = false,
    },
  },

  -- Better marks
  {
    'chentoast/marks.nvim',
    event = 'BufReadPre',
    opts = {
      default_mappings = true,
      signs = true,
    },
  },

  -- Undo tree
  {
    'mbbill/undotree',
    cmd = 'UndotreeToggle',
    keys = {
      { '<leader>uu', '<cmd>UndotreeToggle<cr>', desc = 'Undo Tree' },
    },
  },
}
