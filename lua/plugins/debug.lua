-- TypeScript/Node.js Debugger Configuration
-- Optimized for backend development with VSCode-like debugging experience

return {
  'mfussenegger/nvim-dap',
  dependencies = {
    -- Debugger UI (VSCode-like)
    'rcarriga/nvim-dap-ui',
    'nvim-neotest/nvim-nio',

    -- Virtual text for variable values (inline like VSCode)
    'theHamsta/nvim-dap-virtual-text',

    -- Mason integration
    'williamboman/mason.nvim',
    'jay-babu/mason-nvim-dap.nvim',

    -- JavaScript/TypeScript debugger (same as VSCode uses)
    'mxsdev/nvim-dap-vscode-js',
    {
      'microsoft/vscode-js-debug',
      build = 'npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out',
    },

    -- Persistent breakpoints (like VSCode)
    'Weissle/persistent-breakpoints.nvim',

    -- Telescope integration for better selection UI
    'nvim-telescope/telescope-dap.nvim',
  },

  keys = function(_, keys)
    local dap = require 'dap'
    local dapui = require 'dapui'
    local pb = require 'persistent-breakpoints.api'

    return {
      -- Start/Stop (VSCode-like F-keys)
      { '<F5>', dap.continue, desc = 'Debug: Start/Continue' },
      { '<S-F5>', dap.terminate, desc = 'Debug: Stop' },
      { '<C-S-F5>', dap.restart, desc = 'Debug: Restart' },
      { '<leader>dc', dap.continue, desc = 'Start/Continue' },
      { '<leader>dq', dap.terminate, desc = 'Stop' },
      { '<leader>dr', dap.restart, desc = 'Restart' },
      { '<leader>dp', dap.pause, desc = 'Pause' },

      -- Stepping (VSCode-like)
      { '<F10>', dap.step_over, desc = 'Debug: Step Over' },
      { '<F11>', dap.step_into, desc = 'Debug: Step Into' },
      { '<S-F11>', dap.step_out, desc = 'Debug: Step Out' },
      { '<leader>di', dap.step_into, desc = 'Step Into' },
      { '<leader>do', dap.step_over, desc = 'Step Over' },
      { '<leader>dO', dap.step_out, desc = 'Step Out' },
      { '<leader>dj', dap.down, desc = 'Down Stack Frame' },
      { '<leader>dk', dap.up, desc = 'Up Stack Frame' },
      { '<leader>dg', dap.goto_, desc = 'Go to Line (skip)' },
      { '<leader>dC', dap.run_to_cursor, desc = 'Run to Cursor' },

      -- Breakpoints (persistent - survives restarts like VSCode)
      { '<F9>', pb.toggle_breakpoint, desc = 'Debug: Toggle Breakpoint' },
      { '<leader>db', pb.toggle_breakpoint, desc = 'Toggle Breakpoint' },
      {
        '<leader>dB',
        function()
          pb.set_conditional_breakpoint(vim.fn.input 'Condition: ')
        end,
        desc = 'Conditional Breakpoint',
      },
      {
        '<leader>dl',
        function()
          pb.set_log_point(vim.fn.input 'Log message: ')
        end,
        desc = 'Log Point',
      },
      { '<leader>dx', pb.clear_all_breakpoints, desc = 'Clear All Breakpoints' },
      {
        '<leader>d?',
        function()
          require('telescope').extensions.dap.list_breakpoints {}
        end,
        desc = 'List Breakpoints (Telescope)',
      },

      -- UI Controls
      { '<leader>du', dapui.toggle, desc = 'Toggle Debug UI' },
      {
        '<leader>dU',
        function()
          dapui.toggle { reset = true }
        end,
        desc = 'Reset Debug UI',
      },

      -- Hover/Eval (like VSCode hover)
      {
        '<leader>dh',
        function()
          require('dap.ui.widgets').hover()
        end,
        desc = 'Hover Variable',
      },
      {
        '<leader>dH',
        function()
          require('dap.ui.widgets').preview()
        end,
        desc = 'Preview Variable',
      },
      { '<leader>de', dapui.eval, desc = 'Eval Expression', mode = { 'n', 'v' } },
      {
        '<leader>dE',
        function()
          dapui.eval(vim.fn.input 'Expression: ')
        end,
        desc = 'Eval Input',
      },

      -- Floating windows (like VSCode panels)
      {
        '<leader>ds',
        function()
          require('dap.ui.widgets').centered_float(require('dap.ui.widgets').scopes)
        end,
        desc = 'Float Scopes',
      },
      {
        '<leader>df',
        function()
          require('dap.ui.widgets').centered_float(require('dap.ui.widgets').frames)
        end,
        desc = 'Float Stack Frames',
      },
      {
        '<leader>dw',
        function()
          dapui.float_element('watches', { enter = true })
        end,
        desc = 'Float Watches',
      },

      -- REPL & Console
      { '<leader>dR', dap.repl.toggle, desc = 'Toggle REPL' },
      {
        '<leader>dS',
        function()
          dap.repl.open({}, 'vsplit')
        end,
        desc = 'Open REPL (split)',
      },

      -- Telescope pickers (better UX than native)
      {
        '<leader>dD',
        function()
          require('telescope').extensions.dap.configurations {}
        end,
        desc = 'Debug Configurations',
      },
      {
        '<leader>dv',
        function()
          require('telescope').extensions.dap.variables {}
        end,
        desc = 'Debug Variables',
      },
      {
        '<leader>dF',
        function()
          require('telescope').extensions.dap.frames {}
        end,
        desc = 'Debug Frames',
      },

      -- Run configurations
      { '<leader>dL', dap.run_last, desc = 'Run Last' },
      {
        '<leader>dC',
        function()
          dap.run(dap.configurations[vim.bo.filetype])
        end,
        desc = 'Run Configuration',
      },

      unpack(keys),
    }
  end,

  config = function()
    local dap = require 'dap'
    local dapui = require 'dapui'

    -- Mason DAP setup
    require('mason-nvim-dap').setup {
      automatic_installation = true,
      ensure_installed = { 'js-debug-adapter' },
      handlers = {},
    }

    -- vscode-js-debug adapter setup
    require('dap-vscode-js').setup {
      debugger_path = vim.fn.stdpath 'data' .. '/lazy/vscode-js-debug',
      adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' },
    }

    -- TypeScript/JavaScript configurations
    for _, language in ipairs { 'typescript', 'javascript', 'typescriptreact', 'javascriptreact' } do
      dap.configurations[language] = {
        -- Launch current file with Node
        {
          type = 'pwa-node',
          request = 'launch',
          name = '📄 Launch Current File',
          program = '${file}',
          cwd = '${workspaceFolder}',
          sourceMaps = true,
          skipFiles = { '<node_internals>/**', 'node_modules/**' },
          resolveSourceMapLocations = {
            '${workspaceFolder}/**',
            '!**/node_modules/**',
          },
        },

        -- Launch with ts-node (for TypeScript without compilation)
        {
          type = 'pwa-node',
          request = 'launch',
          name = '🔷 Launch with ts-node',
          runtimeExecutable = 'npx',
          runtimeArgs = { 'ts-node' },
          args = { '${file}' },
          cwd = '${workspaceFolder}',
          sourceMaps = true,
          skipFiles = { '<node_internals>/**', 'node_modules/**' },
          resolveSourceMapLocations = {
            '${workspaceFolder}/**',
            '!**/node_modules/**',
          },
        },

        -- Launch with tsx (faster ts-node alternative)
        {
          type = 'pwa-node',
          request = 'launch',
          name = '⚡ Launch with tsx',
          runtimeExecutable = 'npx',
          runtimeArgs = { 'tsx' },
          args = { '${file}' },
          cwd = '${workspaceFolder}',
          sourceMaps = true,
          skipFiles = { '<node_internals>/**', 'node_modules/**' },
        },

        -- Launch npm script (dev, start, etc.)
        {
          type = 'pwa-node',
          request = 'launch',
          name = '📦 Launch npm script',
          runtimeExecutable = 'npm',
          runtimeArgs = function()
            local script = vim.fn.input 'Script (dev/start/debug): '
            return { 'run', script }
          end,
          cwd = '${workspaceFolder}',
          sourceMaps = true,
          skipFiles = { '<node_internals>/**', 'node_modules/**' },
        },

        -- Attach to running process
        {
          type = 'pwa-node',
          request = 'attach',
          name = '🔗 Attach to Process',
          processId = require('dap.utils').pick_process,
          cwd = '${workspaceFolder}',
          sourceMaps = true,
          skipFiles = { '<node_internals>/**', 'node_modules/**' },
        },

        -- Attach to port (for nodemon --inspect, etc.)
        {
          type = 'pwa-node',
          request = 'attach',
          name = '🌐 Attach to Port 9229',
          port = 9229,
          cwd = '${workspaceFolder}',
          sourceMaps = true,
          skipFiles = { '<node_internals>/**', 'node_modules/**' },
          restart = true,
        },

        -- Debug Jest tests
        {
          type = 'pwa-node',
          request = 'launch',
          name = '🧪 Debug Jest Tests',
          runtimeExecutable = 'npx',
          runtimeArgs = { 'jest', '--runInBand', '--no-coverage' },
          cwd = '${workspaceFolder}',
          console = 'integratedTerminal',
          sourceMaps = true,
          skipFiles = { '<node_internals>/**', 'node_modules/**' },
        },

        -- Debug Jest current file
        {
          type = 'pwa-node',
          request = 'launch',
          name = '🧪 Debug Jest Current File',
          runtimeExecutable = 'npx',
          runtimeArgs = { 'jest', '--runInBand', '--no-coverage', '${fileBasename}' },
          cwd = '${workspaceFolder}',
          console = 'integratedTerminal',
          sourceMaps = true,
          skipFiles = { '<node_internals>/**', 'node_modules/**' },
        },

        -- Debug Vitest tests
        {
          type = 'pwa-node',
          request = 'launch',
          name = '🧪 Debug Vitest Tests',
          runtimeExecutable = 'npx',
          runtimeArgs = { 'vitest', 'run', '--no-coverage' },
          cwd = '${workspaceFolder}',
          console = 'integratedTerminal',
          sourceMaps = true,
          skipFiles = { '<node_internals>/**', 'node_modules/**' },
        },

        -- NestJS application
        {
          type = 'pwa-node',
          request = 'launch',
          name = '🪺 Debug NestJS',
          runtimeExecutable = 'npm',
          runtimeArgs = { 'run', 'start:debug' },
          cwd = '${workspaceFolder}',
          sourceMaps = true,
          skipFiles = { '<node_internals>/**', 'node_modules/**' },
          restart = true,
        },

        -- Express/Fastify/Koa application (generic Node server)
        {
          type = 'pwa-node',
          request = 'launch',
          name = '🚀 Debug Server (dist/index.js)',
          program = '${workspaceFolder}/dist/index.js',
          cwd = '${workspaceFolder}',
          sourceMaps = true,
          skipFiles = { '<node_internals>/**', 'node_modules/**' },
          outFiles = { '${workspaceFolder}/dist/**/*.js' },
          preLaunchTask = 'npm: build',
        },

        -- Chrome debugging (for full-stack)
        {
          type = 'pwa-chrome',
          request = 'launch',
          name = '🌐 Debug in Chrome',
          url = function()
            return vim.fn.input('URL: ', 'http://localhost:3000')
          end,
          webRoot = '${workspaceFolder}',
          sourceMaps = true,
        },
      }
    end

    -- Virtual text for variable values (like VSCode inline display)
    require('nvim-dap-virtual-text').setup {
      enabled = true,
      enabled_commands = true,
      highlight_changed_variables = true,
      highlight_new_as_changed = true,
      show_stop_reason = true,
      commented = false,
      only_first_definition = true,
      all_references = false,
      clear_on_continue = false,
      display_callback = function(variable, buf, stackframe, node, options)
        if options.virt_text_pos == 'inline' then
          return ' = ' .. variable.value:gsub('%s+', ' ')
        else
          return '  ' .. variable.name .. ' = ' .. variable.value:gsub('%s+', ' ')
        end
      end,
      virt_text_pos = 'eol',
      all_frames = false,
      virt_lines = false,
      virt_text_win_col = nil,
    }

    -- Persistent breakpoints (breakpoints survive restarts like VSCode)
    require('persistent-breakpoints').setup {
      save_dir = vim.fn.stdpath 'data' .. '/breakpoints',
      load_breakpoints_event = { 'BufReadPost' },
      perf_record = false,
    }

    -- Telescope DAP integration
    pcall(function()
      require('telescope').load_extension 'dap'
    end)

    -- DAP UI setup (VSCode-like layout)
    dapui.setup {
      icons = {
        expanded = '',
        collapsed = '',
        current_frame = '',
      },
      mappings = {
        expand = { '<CR>', '<2-LeftMouse>' },
        open = 'o',
        remove = 'd',
        edit = 'e',
        repl = 'r',
        toggle = 't',
      },
      element_mappings = {},
      expand_lines = true,
      force_buffers = true,
      layouts = {
        -- VSCode-like left sidebar with variables, watches, call stack, breakpoints
        {
          elements = {
            { id = 'scopes', size = 0.35 },     -- Variables (like VSCode)
            { id = 'watches', size = 0.20 },    -- Watch expressions
            { id = 'stacks', size = 0.25 },     -- Call Stack
            { id = 'breakpoints', size = 0.20 }, -- Breakpoints
          },
          position = 'left',
          size = 55, -- Wider for better readability
        },
        -- Bottom panel with Debug Console and REPL
        {
          elements = {
            { id = 'console', size = 0.6 },  -- Debug Console (larger)
            { id = 'repl', size = 0.4 },     -- Debug REPL
          },
          position = 'bottom',
          size = 15, -- Taller for better output visibility
        },
      },
      floating = {
        max_height = 0.9,
        max_width = 0.9,
        border = 'rounded',
        mappings = { close = { 'q', '<Esc>' } },
      },
      controls = {
        enabled = true,
        element = 'console', -- Show controls in console (more visible)
        icons = {
          pause = '',
          play = '',
          step_into = '',
          step_over = '',
          step_out = '',
          step_back = '',
          run_last = '',
          terminate = '',
          disconnect = '',
        },
      },
      render = {
        max_type_length = 50,
        max_value_lines = 100,
        indent = 2,
      },
    }

    -- Auto open/close UI with better behavior
    dap.listeners.after.event_initialized['dapui_config'] = function()
      dapui.open { reset = true }
    end
    dap.listeners.before.event_terminated['dapui_config'] = function()
      -- Don't auto-close on terminate (VSCode behavior - lets you inspect final state)
    end
    dap.listeners.before.event_exited['dapui_config'] = function()
      -- Don't auto-close on exit
    end

    -- K to hover variables when debugging (like VSCode)
    local api = vim.api
    local keymap_restore = {}
    dap.listeners.after.event_initialized['me'] = function()
      for _, buf in pairs(api.nvim_list_bufs()) do
        local keymaps = api.nvim_buf_get_keymap(buf, 'n')
        for _, keymap in pairs(keymaps) do
          if keymap.lhs == 'K' then
            table.insert(keymap_restore, keymap)
            api.nvim_buf_del_keymap(buf, 'n', 'K')
          end
        end
      end
      api.nvim_set_keymap('n', 'K', '<Cmd>lua require("dap.ui.widgets").hover()<CR>', { silent = true })
    end

    dap.listeners.after.event_terminated['me'] = function()
      for _, keymap in pairs(keymap_restore) do
        api.nvim_buf_set_keymap(keymap.buffer, keymap.mode, keymap.lhs, keymap.rhs, { silent = keymap.silent == 1 })
      end
      keymap_restore = {}
    end

    -- Breakpoint signs (VSCode-like appearance with Nerd Font icons)
    vim.fn.sign_define('DapBreakpoint', { text = '', texthl = 'DapBreakpoint', linehl = '', numhl = '' })
    vim.fn.sign_define('DapBreakpointCondition', { text = '', texthl = 'DapBreakpointCondition', linehl = '', numhl = '' })
    vim.fn.sign_define('DapLogPoint', { text = '', texthl = 'DapLogPoint', linehl = '', numhl = '' })
    vim.fn.sign_define('DapStopped', { text = '', texthl = 'DapStopped', linehl = 'DapStoppedLine', numhl = '' })
    vim.fn.sign_define('DapBreakpointRejected', { text = '', texthl = 'DapBreakpointRejected', linehl = '', numhl = '' })

    -- Highlight groups (VSCode colors)
    vim.api.nvim_set_hl(0, 'DapBreakpoint', { fg = '#e51400' })           -- Red breakpoint
    vim.api.nvim_set_hl(0, 'DapBreakpointCondition', { fg = '#f5c211' })  -- Yellow conditional
    vim.api.nvim_set_hl(0, 'DapLogPoint', { fg = '#61afef' })             -- Blue log point
    vim.api.nvim_set_hl(0, 'DapStopped', { fg = '#98c379' })              -- Green current line arrow
    vim.api.nvim_set_hl(0, 'DapStoppedLine', { bg = '#2e4d3d' })          -- Highlight stopped line
    vim.api.nvim_set_hl(0, 'DapBreakpointRejected', { fg = '#656565' })  -- Gray rejected

    -- Virtual text highlights
    vim.api.nvim_set_hl(0, 'NvimDapVirtualText', { fg = '#7c8f8f', italic = true })
    vim.api.nvim_set_hl(0, 'NvimDapVirtualTextChanged', { fg = '#f5c211', italic = true })
    vim.api.nvim_set_hl(0, 'NvimDapVirtualTextError', { fg = '#e51400', italic = true })
    vim.api.nvim_set_hl(0, 'NvimDapVirtualTextInfo', { fg = '#61afef', italic = true })
  end,
}
