-- Plugins initialization
-- All plugins are loaded from this directory
return {
  -- Import all plugin modules
  { import = 'plugins.autopairs' },
  { import = 'plugins.debug' },
  { import = 'plugins.git' },
  { import = 'plugins.gitsigns' },
  { import = 'plugins.lint' },
  { import = 'plugins.neo-tree' },
  { import = 'plugins.testing' },
  { import = 'plugins.typescript' },
  { import = 'plugins.ui' },
  -- { import = 'plugins.indent_line' }, -- Uncomment to enable indent guides
}
