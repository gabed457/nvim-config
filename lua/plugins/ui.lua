-- UI Configuration for Backend Development
-- Clean, minimal, professional
return {
  -- Notifications (non-intrusive)
  {
    'rcarriga/nvim-notify',
    opts = {
      timeout = 2000,
      max_height = function() return math.floor(vim.o.lines * 0.5) end,
      max_width = function() return math.floor(vim.o.columns * 0.4) end,
      render = 'compact',
      stages = 'fade',
      top_down = true,
    },
    keys = {
      { '<leader>un', function() require('notify').dismiss { silent = true, pending = true } end, desc = 'Dismiss Notifications' },
    },
  },

  -- Command palette and better UI
  {
    'folke/noice.nvim',
    event = 'VeryLazy',
    dependencies = { 'MunifTanjim/nui.nvim', 'rcarriga/nvim-notify' },
    opts = {
      lsp = {
        override = {
          ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
          ['vim.lsp.util.stylize_markdown'] = true,
          ['cmp.entry.get_documentation'] = true,
        },
      },
      routes = {
        { filter = { event = 'msg_show', any = { { find = '%d+L, %d+B' }, { find = '; after #%d+' }, { find = '; before #%d+' } } }, view = 'mini' },
      },
      presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
        lsp_doc_border = true,
      },
    },
  },

  -- Statusline (minimal, informative)
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    event = 'VeryLazy',
    opts = {
      options = {
        theme = 'auto',
        globalstatus = true,
        component_separators = { left = '│', right = '│' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = { statusline = { 'dashboard', 'alpha', 'starter', 'neo-tree' } },
      },
      sections = {
        lualine_a = { { 'mode', fmt = function(str) return str:sub(1, 1) end } },
        lualine_b = {
          'branch',
          { 'diff', symbols = { added = '+', modified = '~', removed = '-' } },
        },
        lualine_c = {
          { 'diagnostics', symbols = { error = 'E', warn = 'W', hint = 'H', info = 'I' } },
          { 'filename', path = 1, symbols = { modified = ' ●', readonly = ' ', unnamed = '[No Name]' } },
        },
        lualine_x = {
          { function() return require('noice').api.status.mode.get() end, cond = function() return package.loaded['noice'] and require('noice').api.status.mode.has() end },
        },
        lualine_y = { 'filetype' },
        lualine_z = { 'location' },
      },
      extensions = { 'neo-tree', 'lazy', 'trouble', 'toggleterm' },
    },
  },

  -- Buffer tabs (minimal)
  {
    'akinsho/bufferline.nvim',
    event = 'VeryLazy',
    keys = {
      { '<leader>bp', '<Cmd>BufferLineTogglePin<CR>', desc = 'Pin Buffer' },
      { '<leader>bP', '<Cmd>BufferLineGroupClose ungrouped<CR>', desc = 'Close Unpinned' },
      { '<leader>bo', '<Cmd>BufferLineCloseOthers<CR>', desc = 'Close Others' },
      { '<S-h>', '<cmd>BufferLineCyclePrev<cr>', desc = 'Prev Buffer' },
      { '<S-l>', '<cmd>BufferLineCycleNext<cr>', desc = 'Next Buffer' },
      { '[b', '<cmd>BufferLineCyclePrev<cr>', desc = 'Prev Buffer' },
      { ']b', '<cmd>BufferLineCycleNext<cr>', desc = 'Next Buffer' },
    },
    opts = {
      options = {
        mode = 'buffers',
        show_buffer_close_icons = false,
        show_close_icon = false,
        diagnostics = 'nvim_lsp',
        always_show_bufferline = false,
        indicator = { style = 'underline' },
        offsets = { { filetype = 'neo-tree', text = 'Files', highlight = 'Directory', text_align = 'left' } },
      },
    },
  },

  -- Buffer deletion
  {
    'echasnovski/mini.bufremove',
    keys = {
      { '<leader>bd', function()
        local bd = require('mini.bufremove').delete
        if vim.bo.modified then
          local choice = vim.fn.confirm(('Save changes to %q?'):format(vim.fn.bufname()), '&Yes\n&No\n&Cancel')
          if choice == 1 then vim.cmd.write(); bd(0)
          elseif choice == 2 then bd(0, true) end
        else bd(0) end
      end, desc = 'Delete Buffer' },
      { '<leader>bD', function() require('mini.bufremove').delete(0, true) end, desc = 'Force Delete' },
    },
  },

  -- Terminal
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    keys = {
      { '<C-\\>', '<cmd>ToggleTerm<cr>', desc = 'Toggle Terminal' },
      { '<leader>tt', '<cmd>ToggleTerm<cr>', desc = 'Terminal' },
      { '<leader>tg', function()
        local Terminal = require('toggleterm.terminal').Terminal
        local lazygit = Terminal:new { cmd = 'lazygit', hidden = true, direction = 'float' }
        lazygit:toggle()
      end, desc = 'LazyGit (Terminal)' },
      { '<leader>tn', function()
        local Terminal = require('toggleterm.terminal').Terminal
        local node = Terminal:new { cmd = 'node', hidden = true, direction = 'float' }
        node:toggle()
      end, desc = 'Node REPL' },
    },
    opts = {
      size = function(term) return term.direction == 'horizontal' and 15 or vim.o.columns * 0.4 end,
      open_mapping = [[<C-\>]],
      hide_numbers = true,
      shade_terminals = false,
      start_in_insert = true,
      direction = 'horizontal',
      close_on_exit = true,
      float_opts = { border = 'rounded' },
    },
  },

  -- Indent guides (subtle)
  {
    'lukas-reineke/indent-blankline.nvim',
    event = { 'BufReadPost', 'BufNewFile' },
    main = 'ibl',
    opts = {
      indent = { char = '▏' },
      scope = { enabled = false },
      exclude = { filetypes = { 'help', 'neo-tree', 'Trouble', 'lazy', 'mason', 'notify', 'toggleterm' } },
    },
  },

  -- Which-key (keybinding hints)
  {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    opts = {
      plugins = { spelling = { enabled = true, suggestions = 20 } },
      win = { border = 'rounded' },
    },
  },
}
