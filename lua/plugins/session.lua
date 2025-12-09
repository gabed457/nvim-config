-- Session Management
return {
  {
    'folke/persistence.nvim',
    event = 'BufReadPre',
    keys = {
      {
        '<leader>qs',
        function()
          require('persistence').load()
        end,
        desc = 'Restore Session',
      },
      {
        '<leader>ql',
        function()
          require('persistence').load { last = true }
        end,
        desc = 'Restore Last',
      },
      {
        '<leader>qd',
        function()
          require('persistence').stop()
        end,
        desc = "Don't Save",
      },
    },
    opts = {
      dir = vim.fn.stdpath 'state' .. '/sessions/',
      options = { 'buffers', 'curdir', 'tabpages', 'winsize' },
    },
  },
}
