-- Kubernetes Development (PRIORITY - You check pods constantly!)
return {
  -- kubectl.nvim - Full Kubernetes management inside Neovim
  {
    'ramilito/kubectl.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
      { '<leader>K', '', desc = '+Kubernetes' },
      { '<leader>Kk', '<cmd>lua require("kubectl").open()<cr>', desc = 'Open kubectl' },
      { '<leader>Kp', '<cmd>lua require("kubectl").open("pods")<cr>', desc = 'Pods' },
      { '<leader>Kd', '<cmd>lua require("kubectl").open("deployments")<cr>', desc = 'Deployments' },
      { '<leader>Ks', '<cmd>lua require("kubectl").open("services")<cr>', desc = 'Services' },
      { '<leader>Kn', '<cmd>lua require("kubectl").open("nodes")<cr>', desc = 'Nodes' },
      { '<leader>Kc', '<cmd>lua require("kubectl").open("configmaps")<cr>', desc = 'ConfigMaps' },
      { '<leader>Ki', '<cmd>lua require("kubectl").open("ingresses")<cr>', desc = 'Ingresses' },
      { '<leader>Kl', '<cmd>lua require("kubectl").open("logs")<cr>', desc = 'Logs' },
      { '<leader>Ke', '<cmd>lua require("kubectl").open("events")<cr>', desc = 'Events' },
      { '<leader>KS', '<cmd>lua require("kubectl").open("secrets")<cr>', desc = 'Secrets' },
      { '<leader>Kj', '<cmd>lua require("kubectl").open("jobs")<cr>', desc = 'Jobs' },
      { '<leader>KC', '<cmd>lua require("kubectl").open("cronjobs")<cr>', desc = 'CronJobs' },
    },
    config = function()
      require('kubectl').setup {
        auto_refresh = {
          enabled = true,
          interval = 5000, -- 5 seconds for pod status updates
        },
        diff = {
          bin = 'delta', -- Use delta for better diffs if installed
        },
        kubectl_cmd = { cmd = 'kubectl', env = {} },
        namespace = 'All',
        notifications = {
          enabled = true,
          verbose = false,
        },
        hints = true,
        context = true,
        float_size = {
          width = 0.9,
          height = 0.8,
          col = 0.5,
          row = 0.5,
        },
        obj_fresh = 5, -- Highlight objects newer than 5 seconds
      }
    end,
  },

  -- Helm chart support
  {
    'towolf/vim-helm',
    ft = { 'helm', 'yaml' },
  },

  -- YAML schema support with Kubernetes awareness
  {
    'someone-stole-my-name/yaml-companion.nvim',
    dependencies = {
      'neovim/nvim-lspconfig',
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
    },
    ft = { 'yaml' },
    keys = {
      { '<leader>Ky', '<cmd>Telescope yaml_schema<cr>', desc = 'YAML Schema' },
    },
    config = function()
      require('telescope').load_extension 'yaml_schema'
      local cfg = require('yaml-companion').setup {
        builtin_matchers = {
          kubernetes = { enabled = true },
          cloud_init = { enabled = true },
        },
        schemas = {
          {
            name = 'Kubernetes',
            uri = 'https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.28.0-standalone-strict/all.json',
          },
        },
        lspconfig = {
          settings = {
            yaml = {
              validate = true,
              schemaStore = {
                enable = false,
                url = '',
              },
              schemas = require('schemastore').yaml.schemas(),
            },
          },
        },
      }
      require('lspconfig')['yamlls'].setup(cfg)
    end,
  },
}
