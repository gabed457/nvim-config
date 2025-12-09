-- Backend Node.js/TypeScript Development
return {
  {
    'pmizio/typescript-tools.nvim',
    dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
    ft = { 'typescript', 'typescriptreact', 'javascript', 'javascriptreact' },
    opts = {
      on_attach = function(client, bufnr)
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
      end,
      settings = {
        separate_diagnostic_server = true,
        publish_diagnostic_on = 'insert_leave',
        expose_as_code_action = 'all',
        tsserver_max_memory = 'auto',
        tsserver_file_preferences = {
          includeInlayParameterNameHints = 'all',
          includeInlayFunctionParameterTypeHints = true,
          includeInlayVariableTypeHints = true,
          includeInlayPropertyDeclarationTypeHints = true,
          includeInlayFunctionLikeReturnTypeHints = true,
          includeInlayEnumMemberValueHints = true,
        },
        complete_function_calls = true,
        include_completions_with_insert_text = true,
      },
    },
  },
  {
    'vuki656/package-info.nvim',
    dependencies = { 'MunifTanjim/nui.nvim' },
    ft = 'json',
    opts = { icons = { enable = true }, autostart = true },
    keys = {
      { '<leader>ns', function() require('package-info').show() end, desc = 'Show versions' },
      { '<leader>nc', function() require('package-info').hide() end, desc = 'Hide versions' },
      { '<leader>nt', function() require('package-info').toggle() end, desc = 'Toggle versions' },
      { '<leader>nu', function() require('package-info').update() end, desc = 'Update package' },
      { '<leader>nd', function() require('package-info').delete() end, desc = 'Delete package' },
      { '<leader>ni', function() require('package-info').install() end, desc = 'Install package' },
      { '<leader>np', function() require('package-info').change_version() end, desc = 'Change version' },
    },
  },
  {
    'stevanmilic/nvim-lspimport',
    ft = { 'typescript', 'typescriptreact', 'javascript', 'javascriptreact' },
    keys = {
      { '<leader>ci', function() require('lspimport').import() end, desc = 'Auto Import' },
    },
  },
  {
    'axelvc/template-string.nvim',
    ft = { 'typescript', 'typescriptreact', 'javascript', 'javascriptreact' },
    opts = {
      filetypes = { 'typescript', 'javascript', 'typescriptreact', 'javascriptreact' },
      remove_template_string = true,
    },
  },
  {
    'folke/todo-comments.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    event = 'VimEnter',
    opts = {
      signs = true,
      keywords = {
        FIX = { icon = ' ', color = 'error', alt = { 'FIXME', 'BUG', 'ISSUE' } },
        TODO = { icon = ' ', color = 'info' },
        HACK = { icon = ' ', color = 'warning' },
        WARN = { icon = ' ', color = 'warning', alt = { 'WARNING', 'XXX' } },
        PERF = { icon = ' ', alt = { 'OPTIM', 'PERFORMANCE', 'OPTIMIZE' } },
        NOTE = { icon = ' ', color = 'hint', alt = { 'INFO' } },
        TEST = { icon = '⏲ ', color = 'test', alt = { 'TESTING', 'PASSED', 'FAILED' } },
      },
    },
    keys = {
      { ']t', function() require('todo-comments').jump_next() end, desc = 'Next TODO' },
      { '[t', function() require('todo-comments').jump_prev() end, desc = 'Prev TODO' },
      { '<leader>st', '<cmd>TodoTelescope<cr>', desc = 'Search TODOs' },
      { '<leader>tT', '<cmd>TodoTrouble<cr>', desc = 'TODO List' },
    },
  },
  {
    'mistweaverco/kulala.nvim',
    ft = { 'http', 'rest' },
    opts = {
      default_view = 'body',
      split_direction = 'vertical',
      default_env = 'dev',
    },
    keys = {
      { '<leader>rr', function() require('kulala').run() end, desc = 'Run Request' },
      { '<leader>rt', function() require('kulala').toggle_view() end, desc = 'Toggle View' },
      { '<leader>rp', function() require('kulala').jump_prev() end, desc = 'Prev Request' },
      { '<leader>rn', function() require('kulala').jump_next() end, desc = 'Next Request' },
      { '<leader>rc', function() require('kulala').copy() end, desc = 'Copy as cURL' },
    },
    config = function(_, opts)
      require('kulala').setup(opts)
      vim.filetype.add({ extension = { bru = 'http' } })
    end,
  },
  {
    'nvim-neotest/neotest',
    dependencies = {
      'nvim-neotest/nvim-nio',
      'nvim-lua/plenary.nvim',
      'antoinemadec/FixCursorHold.nvim',
      'nvim-treesitter/nvim-treesitter',
      'nvim-neotest/neotest-jest',
      'marilari88/neotest-vitest',
    },
    keys = {
      { '<leader>tt', function() require('neotest').run.run() end, desc = 'Run Test' },
      { '<leader>tf', function() require('neotest').run.run(vim.fn.expand '%') end, desc = 'Run File' },
      { '<leader>ts', function() require('neotest').summary.toggle() end, desc = 'Summary' },
      { '<leader>to', function() require('neotest').output.open { enter = true } end, desc = 'Output' },
      { '<leader>td', function() require('neotest').run.run { strategy = 'dap' } end, desc = 'Debug Test' },
      { '[T', function() require('neotest').jump.prev { status = 'failed' } end, desc = 'Prev Failed' },
      { ']T', function() require('neotest').jump.next { status = 'failed' } end, desc = 'Next Failed' },
    },
    config = function()
      require('neotest').setup {
        adapters = {
          require 'neotest-jest' {
            jestCommand = 'npm test --',
            jestConfigFile = 'jest.config.js',
            env = { CI = true },
            cwd = function() return vim.fn.getcwd() end,
          },
          require 'neotest-vitest',
        },
        status = { virtual_text = true },
        output = { open_on_run = true },
      }
    end,
  },
}
