-- Code Coverage
return {
  {
    'andythigpen/nvim-coverage',
    dependencies = { 'nvim-lua/plenary.nvim' },
    cmd = { 'Coverage', 'CoverageToggle', 'CoverageSummary', 'CoverageLoad' },
    keys = {
      { '<leader>tC', '<cmd>CoverageToggle<cr>', desc = 'Coverage Toggle' },
      { '<leader>tc', '<cmd>CoverageSummary<cr>', desc = 'Coverage Summary' },
      { '<leader>tL', '<cmd>CoverageLoad<cr>', desc = 'Coverage Load' },
    },
    opts = {
      auto_reload = true,
      lang = {
        javascript = { coverage_file = 'coverage/lcov.info' },
        typescript = { coverage_file = 'coverage/lcov.info' },
      },
    },
  },
}
