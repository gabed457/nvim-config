-- Testing and debugging for Node.js/TypeScript
return {
  -- Neotest - Universal test runner
  {
    'nvim-neotest/neotest',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
      'antoinemadec/FixCursorHold.nvim',
      'nvim-neotest/nvim-nio',
      -- Test adapters
      'nvim-neotest/neotest-jest',
      'marilari88/neotest-vitest',
      'nvim-neotest/neotest-plenary',
    },
    keys = {
      {
        '<leader>tr',
        function()
          require('neotest').run.run()
        end,
        desc = '▶️  Run Nearest',
      },
      {
        '<leader>tf',
        function()
          require('neotest').run.run(vim.fn.expand '%')
        end,
        desc = '📄 Run File',
      },
      {
        '<leader>td',
        function()
          require('neotest').run.run { strategy = 'dap' }
        end,
        desc = '🐛 Debug Test',
      },
      {
        '<leader>ts',
        function()
          require('neotest').run.stop()
        end,
        desc = '⏹️  Stop',
      },
      {
        '<leader>ta',
        function()
          require('neotest').run.attach()
        end,
        desc = '📎 Attach',
      },
      {
        '<leader>to',
        function()
          require('neotest').output.open { enter = true }
        end,
        desc = '📋 Output',
      },
      {
        '<leader>tO',
        function()
          require('neotest').output_panel.toggle()
        end,
        desc = '📊 Output Panel',
      },
      {
        '<leader>tS',
        function()
          require('neotest').summary.toggle()
        end,
        desc = '📑 Summary',
      },
    },
    config = function()
      require('neotest').setup {
        adapters = {
          require 'neotest-jest' {
            jestCommand = 'npm test --',
            jestConfigFile = 'jest.config.js',
            env = { CI = true },
            cwd = function()
              return vim.fn.getcwd()
            end,
          },
          require 'neotest-vitest' {
            filter_dir = function(name)
              return name ~= 'node_modules'
            end,
          },
          require 'neotest-plenary',
        },
        status = {
          virtual_text = true,
          signs = true,
        },
        output = {
          open_on_run = true,
        },
        quickfix = {
          open = function()
            vim.cmd 'Trouble quickfix'
          end,
        },
      }
    end,
  },

  -- DAP (Debug Adapter Protocol) - Core debugging
  {
    'mfussenegger/nvim-dap',
    dependencies = {
      -- UI for DAP
      {
        'rcarriga/nvim-dap-ui',
        dependencies = { 'nvim-neotest/nvim-nio' },
        keys = {
          {
            '<leader>du',
            function()
              require('dapui').toggle {}
            end,
            desc = '🎨 UI',
          },
          {
            '<leader>de',
            function()
              require('dapui').eval()
            end,
            desc = '🔍 Eval',
            mode = { 'n', 'v' },
          },
        },
        opts = {},
        config = function(_, opts)
          local dap = require 'dap'
          local dapui = require 'dapui'
          dapui.setup(opts)
          dap.listeners.after.event_initialized['dapui_config'] = function()
            dapui.open {}
          end
          dap.listeners.before.event_terminated['dapui_config'] = function()
            dapui.close {}
          end
          dap.listeners.before.event_exited['dapui_config'] = function()
            dapui.close {}
          end
        end,
      },

      -- Virtual text for debugging
      {
        'theHamsta/nvim-dap-virtual-text',
        opts = {},
      },

      -- JavaScript/TypeScript debugging
      {
        'mxsdev/nvim-dap-vscode-js',
        dependencies = {
          {
            'microsoft/vscode-js-debug',
            build = 'npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out',
          },
        },
        config = function()
          require('dap-vscode-js').setup {
            debugger_path = vim.fn.stdpath 'data' .. '/lazy/vscode-js-debug',
            adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' },
          }

          local dap = require 'dap'

          -- Language specific configurations
          for _, language in ipairs { 'typescript', 'javascript', 'typescriptreact', 'javascriptreact' } do
            dap.configurations[language] = {
              {
                type = 'pwa-node',
                request = 'launch',
                name = 'Launch file',
                program = '${file}',
                cwd = '${workspaceFolder}',
              },
              {
                type = 'pwa-node',
                request = 'attach',
                name = 'Attach',
                processId = require('dap.utils').pick_process,
                cwd = '${workspaceFolder}',
              },
              {
                type = 'pwa-node',
                request = 'launch',
                name = 'Debug Jest Tests',
                runtimeExecutable = 'node',
                runtimeArgs = {
                  './node_modules/jest/bin/jest.js',
                  '--runInBand',
                },
                rootPath = '${workspaceFolder}',
                cwd = '${workspaceFolder}',
                console = 'integratedTerminal',
                internalConsoleOptions = 'neverOpen',
              },
              {
                type = 'pwa-chrome',
                request = 'launch',
                name = 'Start Chrome with "localhost"',
                url = 'http://localhost:3000',
                webRoot = '${workspaceFolder}',
                userDataDir = '${workspaceFolder}/.vscode/vscode-chrome-debug-userdatadir',
              },
            }
          end
        end,
      },
    },
    keys = {
      {
        '<leader>db',
        function()
          require('dap').toggle_breakpoint()
        end,
        desc = '🔴 Breakpoint',
      },
      {
        '<leader>dB',
        function()
          require('dap').set_breakpoint(vim.fn.input 'Breakpoint condition: ')
        end,
        desc = '🎯 Conditional BP',
      },
      {
        '<leader>dc',
        function()
          require('dap').continue()
        end,
        desc = '▶️  Continue',
      },
      {
        '<leader>dC',
        function()
          require('dap').run_to_cursor()
        end,
        desc = '🎯 Run to Cursor',
      },
      {
        '<leader>dg',
        function()
          require('dap').goto_()
        end,
        desc = '⏭️  Go to Line',
      },
      {
        '<leader>di',
        function()
          require('dap').step_into()
        end,
        desc = '⬇️  Step Into',
      },
      {
        '<leader>dj',
        function()
          require('dap').down()
        end,
        desc = '⬇️  Down',
      },
      {
        '<leader>dk',
        function()
          require('dap').up()
        end,
        desc = '⬆️  Up',
      },
      {
        '<leader>dl',
        function()
          require('dap').run_last()
        end,
        desc = '🔄 Run Last',
      },
      {
        '<leader>do',
        function()
          require('dap').step_out()
        end,
        desc = '⬆️  Step Out',
      },
      {
        '<leader>dO',
        function()
          require('dap').step_over()
        end,
        desc = '➡️  Step Over',
      },
      {
        '<leader>dp',
        function()
          require('dap').pause()
        end,
        desc = '⏸️  Pause',
      },
      {
        '<leader>dr',
        function()
          require('dap').repl.toggle()
        end,
        desc = '💻 REPL',
      },
      {
        '<leader>ds',
        function()
          require('dap').session()
        end,
        desc = '📊 Session',
      },
      {
        '<leader>dt',
        function()
          require('dap').terminate()
        end,
        desc = '⏹️  Terminate',
      },
      {
        '<leader>dw',
        function()
          require('dap.ui.widgets').hover()
        end,
        desc = '🔍 Widgets',
      },
    },
  },

  -- Better quickfix/diagnostics window
  {
    'folke/trouble.nvim',
    cmd = { 'TroubleToggle', 'Trouble' },
    opts = { use_diagnostic_signs = true },
    keys = {
      { '<leader>xx', '<cmd>TroubleToggle document_diagnostics<cr>', desc = '📄 Document Diagnostics' },
      { '<leader>xX', '<cmd>TroubleToggle workspace_diagnostics<cr>', desc = '📁 Workspace Diagnostics' },
      { '<leader>xL', '<cmd>TroubleToggle loclist<cr>', desc = '📍 Location List' },
      { '<leader>xQ', '<cmd>TroubleToggle quickfix<cr>', desc = '📋 Quickfix' },
      {
        '[q',
        function()
          if require('trouble').is_open() then
            require('trouble').previous { skip_groups = true, jump = true }
          else
            local ok, err = pcall(vim.cmd.cprev)
            if not ok then
              vim.notify(err, vim.log.levels.ERROR)
            end
          end
        end,
        desc = '⬆️  Previous Item',
      },
      {
        ']q',
        function()
          if require('trouble').is_open() then
            require('trouble').next { skip_groups = true, jump = true }
          else
            local ok, err = pcall(vim.cmd.cnext)
            if not ok then
              vim.notify(err, vim.log.levels.ERROR)
            end
          end
        end,
        desc = '⬇️  Next Item',
      },
    },
  },
}
