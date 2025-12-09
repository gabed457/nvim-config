-- Git Integration for Backend Development
return {
  {
    'kdheepak/lazygit.nvim',
    cmd = { 'LazyGit', 'LazyGitConfig', 'LazyGitCurrentFile', 'LazyGitFilter' },
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
      { '<leader>gg', '<cmd>LazyGit<cr>', desc = 'LazyGit' },
      { '<leader>gf', '<cmd>LazyGitCurrentFile<cr>', desc = 'File History' },
      { '<leader>gl', '<cmd>LazyGitFilter<cr>', desc = 'Log' },
    },
  },
  {
    'sindrets/diffview.nvim',
    cmd = { 'DiffviewOpen', 'DiffviewClose', 'DiffviewFileHistory', 'DiffviewToggleFiles' },
    keys = {
      {
        '<leader>gd',
        function()
          local lib = require 'diffview.lib'
          local view = lib.get_current_view()
          if view then
            vim.cmd 'DiffviewClose'
          else
            vim.cmd 'DiffviewOpen'
          end
        end,
        desc = 'Diff View',
      },
      { '<leader>gD', '<cmd>DiffviewOpen --staged<cr>', desc = 'Staged Diff' },
      { '<leader>gU', '<cmd>DiffviewOpen<cr>', desc = 'Unstaged Diff' },
      { '<leader>gC', '<cmd>DiffviewOpen HEAD<cr>', desc = 'Compare All' },
      { '<leader>gh', '<cmd>DiffviewFileHistory %<cr>', desc = 'File History' },
      { '<leader>gH', '<cmd>DiffviewFileHistory<cr>', desc = 'Branch History' },
    },
    opts = {
      enhanced_diff_hl = true,
      view = {
        default = { layout = 'diff2_horizontal' },
        merge_tool = { layout = 'diff3_mixed', disable_diagnostics = true },
      },
      file_panel = {
        listing_style = 'tree',
        win_config = { position = 'left', width = 35 },
      },
    },
  },
  {
    'f-person/git-blame.nvim',
    event = 'BufReadPre',
    opts = {
      enabled = true,
      message_template = '<author> • <date> • <summary>',
      date_format = '%Y-%m-%d',
      virtual_text_column = 80,
      delay = 500,
    },
    keys = {
      { '<leader>gb', '<cmd>GitBlameToggle<cr>', desc = 'Blame' },
      { '<leader>go', '<cmd>GitBlameOpenCommitURL<cr>', desc = 'Open in Browser' },
    },
  },
  {
    'akinsho/git-conflict.nvim',
    version = '*',
    event = 'BufReadPre',
    opts = { default_mappings = false, disable_diagnostics = true },
    keys = {
      { '<leader>gco', '<cmd>GitConflictChooseOurs<cr>', desc = 'Choose Ours' },
      { '<leader>gct', '<cmd>GitConflictChooseTheirs<cr>', desc = 'Choose Theirs' },
      { '<leader>gcb', '<cmd>GitConflictChooseBoth<cr>', desc = 'Choose Both' },
      { '<leader>gc0', '<cmd>GitConflictChooseNone<cr>', desc = 'Choose None' },
      { ']x', '<cmd>GitConflictNextConflict<cr>', desc = 'Next Conflict' },
      { '[x', '<cmd>GitConflictPrevConflict<cr>', desc = 'Prev Conflict' },
    },
  },
  {
    'NeogitOrg/neogit',
    dependencies = { 'nvim-lua/plenary.nvim', 'sindrets/diffview.nvim', 'nvim-telescope/telescope.nvim' },
    cmd = 'Neogit',
    keys = {
      { '<leader>gn', '<cmd>Neogit<cr>', desc = 'Neogit' },
      { '<leader>gc', '<cmd>Neogit commit<cr>', desc = 'Commit' },
      { '<leader>gp', '<cmd>Neogit push<cr>', desc = 'Push' },
      { '<leader>gP', '<cmd>Neogit pull<cr>', desc = 'Pull' },
    },
    opts = { integrations = { diffview = true, telescope = true } },
  },
}
