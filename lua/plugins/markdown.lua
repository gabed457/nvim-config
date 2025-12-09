-- Markdown/Documentation
return {
  -- Markdown preview
  {
    'iamcco/markdown-preview.nvim',
    cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
    ft = { 'markdown' },
    build = function()
      vim.fn['mkdp#util#install']()
    end,
    keys = {
      { '<leader>mp', '<cmd>MarkdownPreviewToggle<cr>', desc = 'Markdown Preview' },
    },
    config = function()
      vim.g.mkdp_auto_close = 0
      vim.g.mkdp_theme = 'dark'
    end,
  },

  -- Table mode
  {
    'dhruvasagar/vim-table-mode',
    ft = { 'markdown', 'org' },
    cmd = { 'TableModeToggle', 'TableModeEnable' },
    keys = {
      { '<leader>mt', '<cmd>TableModeToggle<cr>', desc = 'Table Mode' },
    },
  },
}
