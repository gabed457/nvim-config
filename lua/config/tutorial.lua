-- Interactive Tutorial for Backend Developer Neovim Configuration
-- Optimized for Node.js/TypeScript Staff+ Engineers

local M = {}

M.sections = {
  {
    title = 'Welcome',
    content = [[
Backend Developer Neovim Configuration
Optimized for Node.js & TypeScript

This tutorial covers all the keybindings and features
designed for professional backend development.

Your Leader Key is: SPACE
Press <Space> and wait to see all available groups.

NAVIGATION:
  n / l / →     Next section
  p / h / ←     Previous section  
  q / Esc       Close tutorial
  1-9           Jump to section
  ?             Back to this page

Press 'n' to continue.
]],
  },
  {
    title = 'File Navigation',
    content = [[
FILE EXPLORER (Neo-tree)
<leader>e       Toggle file explorer
\               Reveal current file in tree

Inside Neo-tree:
  Enter         Open file/folder
  a             Create new file
  d             Delete file
  r             Rename file
  c             Copy file
  m             Move file
  y             Copy file path
  /             Filter files
  H             Toggle hidden files
  ?             Show Neo-tree help

Git status icons in tree:
  +  Added      x  Deleted
  ~  Modified   >  Renamed
]],
  },
  {
    title = 'Search & Find',
    content = [[
TELESCOPE FUZZY FINDING
<leader>sf      Find files
<leader>sg      Live grep (search contents)
<leader>sw      Search word under cursor
<leader>s.      Recent files
<leader>sb      Search buffers
<leader>sr      Resume last search
<leader>s/      Search in current buffer
<leader>sh      Search help
<leader>sk      Search keymaps
<leader>sn      Search Neovim config
<leader>st      Search TODO comments

Inside Telescope:
  Ctrl+j/k      Move up/down
  Ctrl+u/d      Scroll preview
  Enter         Open file
  Ctrl+x        Open horizontal split
  Ctrl+v        Open vertical split
  Esc           Close
]],
  },
  {
    title = 'AI Assistant',
    content = [[
THREE AI MODES

1. INLINE SUGGESTIONS (Copilot)
   Ctrl+l        Accept suggestion
   Ctrl+]        Next suggestion
   Ctrl+[        Previous suggestion
   Ctrl+e        Dismiss

2. CHAT MODE (CopilotChat)
   <leader>aa    Open AI Chat
   <leader>aq    Quick question
   <leader>ae    Explain code
   <leader>ar    Review code
   <leader>af    Fix code
   <leader>ao    Optimize code
   <leader>ad    Add documentation
   <leader>at    Generate tests

3. INLINE EDIT (Avante)
   <leader>ai    Inline edit
   <leader>aT    Toggle Avante panel

<leader>am      Switch AI models
]],
  },
  {
    title = 'Code Intelligence',
    content = [[
LSP NAVIGATION
gd              Go to definition
gr              Go to references
gI              Go to implementation
gy              Go to type definition
gD              Go to declaration
K               Hover documentation

CODE ACTIONS
<leader>ca      Code actions
<leader>cr      Rename symbol
<leader>ci      Auto import

DIAGNOSTICS
[d              Previous diagnostic
]d              Next diagnostic
<leader>cd      Show diagnostic details
Ctrl+k          Signature help (insert mode)

TypeScript extras:
  Inlay hints for parameters and types
  Auto template string conversion
  Auto-close JSX tags
]],
  },
  {
    title = 'Git Integration',
    content = [[
LAZYGIT
<leader>gg      Open LazyGit
<leader>gf      File history in LazyGit

DIFF VIEWS
<leader>gd      Toggle diff view
<leader>gD      View STAGED changes
<leader>gU      View UNSTAGED changes  
<leader>gC      Compare staged vs working
<leader>gh      File history
<leader>gH      Line history

GIT BLAME
<leader>gb      Toggle blame

CONFLICT RESOLUTION
<leader>gco     Choose ours
<leader>gct     Choose theirs
<leader>gcb     Choose both
<leader>gc0     Choose none
<leader>gcn     Next conflict
<leader>gcp     Previous conflict
<leader>gcl     List conflicts

HUNKS
<leader>hs      Stage hunk
<leader>hr      Reset hunk
<leader>hp      Preview hunk
]h / [h         Next/prev hunk
]],
  },
  {
    title = 'Testing & Debug',
    content = [[
TESTING (Neotest)
<leader>tt      Run nearest test
<leader>tf      Run file tests
<leader>ts      Toggle test summary
<leader>to      Show test output

DEBUGGING (VSCode-like DAP)
Start/Stop:
  F5            Start/Continue
  Shift+F5      Stop debugging
  Ctrl+Shift+F5 Restart
  <leader>dc    Start/Continue
  <leader>dq    Stop
  <leader>dr    Restart

Stepping:
  F9            Toggle breakpoint
  F10           Step over
  F11           Step into
  Shift+F11     Step out
  <leader>dC    Run to cursor
  <leader>dg    Go to line (skip)

Breakpoints (persistent - survives restarts):
  <leader>db    Toggle breakpoint
  <leader>dB    Conditional breakpoint
  <leader>dl    Log point
  <leader>dx    Clear all breakpoints
  <leader>d?    List breakpoints (Telescope)

Inspect Variables:
  K             Hover variable (when debugging)
  <leader>dh    Hover popup
  <leader>de    Eval expression (works in visual)
  <leader>ds    Float scopes
  <leader>df    Float stack frames
  <leader>dw    Float watches

UI & Navigation:
  <leader>du    Toggle debug UI
  <leader>dU    Reset debug UI
  <leader>dj    Down stack frame
  <leader>dk    Up stack frame
  <leader>dR    Toggle REPL

Telescope Pickers:
  <leader>dD    Debug configurations
  <leader>dv    Debug variables
  <leader>dF    Debug frames
]],
  },
  {
    title = 'Debug Configurations',
    content = [[
12 LAUNCH CONFIGURATIONS
Available when you press F5 or <leader>dc:

For TypeScript/Node.js:
  📄 Launch Current File
  🔷 Launch with ts-node
  ⚡ Launch with tsx (faster)
  📦 Launch npm script
  🪺 Debug NestJS

For Testing:
  🧪 Debug Jest Tests
  🧪 Debug Jest Current File
  🧪 Debug Vitest Tests

Attach to Running Process:
  🔗 Attach to Process (pick PID)
  🌐 Attach to Port 9229

For Full-Stack:
  🚀 Debug Server (dist/index.js)
  🌐 Debug in Chrome

INLINE VIRTUAL TEXT
When debugging, variable values appear
inline next to your code:
  const user = getUser()  // user = { name: "John" }
  const count = items.length  // count = 5

Changed variables are highlighted in yellow!
]],
  },
  {
    title = 'TODO Comments',
    content = [[
TODO COMMENT TRACKING
Automatically highlights these keywords:

  TODO    Something to do later
  FIXME   Broken code that needs fixing
  HACK    Workaround, needs refactoring
  WARN    Warning, potential issue
  PERF    Performance concern
  NOTE    Important information
  TEST    Test-related note

NAVIGATION
]t              Jump to next TODO
[t              Jump to previous TODO

SEARCH
<leader>st      Search all TODOs (Telescope)
<leader>tT      List TODOs (Trouble)

Example comments:
  // TODO: Implement error handling
  // FIXME: Race condition here
  // HACK: Temporary workaround
  // PERF: O(n²) - needs optimization
]],
  },
  {
    title = 'REST/Bruno API',
    content = [[
API TESTING
<leader>rr      Run request under cursor
<leader>rt      Toggle response view
<leader>rp      Previous request
<leader>rn      Next request
<leader>rc      Copy as cURL
<leader>ri      Inspect request

BRUNO COLLECTIONS
<leader>rb      Browse collections
<leader>rB      Create new request

SETUP:
Edit ~/.config/nvim/lua/config/bruno-config.lua
to add your collection paths:

  M.collections = {
    my_api = {
      path = '~/projects/api/bruno',
      default_env = 'development',
    },
  }

Supports .bru and .http files.
Responses auto-formatted as JSON/XML.
]],
  },
  {
    title = 'NPM & Package.json',
    content = [[
PACKAGE MANAGEMENT
When editing package.json:

<leader>ns      Show package versions
<leader>nc      Hide versions
<leader>nt      Toggle version display
<leader>nu      Update package
<leader>nd      Delete package
<leader>ni      Install new package
<leader>np      Change version

JSON SCHEMAS
Auto-completion and validation for:
  package.json
  tsconfig.json
  .eslintrc
  .prettierrc
  docker-compose.yml
  And many more...

TypeScript project features:
  - Full intellisense
  - Auto-imports
  - Path aliases support
  - Type checking
]],
  },
  {
    title = 'Database (DBUI)',
    content = [[
DATABASE CLIENT (vim-dadbod)
Connect to PostgreSQL, MySQL, SQLite, etc.

<leader>Dt      Toggle DB UI
<leader>Da      Add connection
<leader>Df      Find buffer
<leader>Dr      Rename buffer
<leader>Dq      Last query info

CONNECTION STRING EXAMPLES:
  postgres://user:pass@localhost/db
  mysql://user:pass@localhost/db
  sqlite:path/to/db.sqlite

IN DBUI:
  Enter         Execute query
  <leader>W     Save query
  R             Refresh

SQL COMPLETION:
Auto-complete for tables, columns
when editing .sql files.

Tip: Save frequently used queries
in the DBUI saved queries folder.
]],
  },
  {
    title = 'JSON & Search',
    content = [[
JSON EXPLORATION (jqx)
<leader>jq      List JSON keys
<leader>jQ      Query with jq

Navigate large JSON files easily.
Works with YAML too.

PROJECT SEARCH/REPLACE (Spectre)
<leader>Sr      Open Spectre
<leader>Sw      Search word under cursor
<leader>Sf      Search in current file
<leader>Sr      Search selection (visual)

IN SPECTRE:
  dd            Toggle item
  <leader>R     Replace all
  <leader>rc    Replace current
  <enter>       Go to file
  q             Close

Supports regex patterns.
Preview changes before applying.
]],
  },
  {
    title = 'Backend Extras',
    content = [[
YAML/DOCKER SUPPORT
Full LSP support for:
  - docker-compose.yml
  - Dockerfile
  - GitHub Actions (.yml)
  - Kubernetes manifests

ENVIRONMENT FILES
.env files auto-loaded
Syntax highlighting included

LOG FILES
Automatic syntax highlighting
for .log files with levels:
  ERROR   (red)
  WARN    (yellow)
  INFO    (blue)
  DEBUG   (gray)

QUICKFIX (bqf)
Enhanced quickfix window
with preview and filtering.
]],
  },
  {
    title = 'Buffers & Windows',
    content = [[
BUFFERS (tabs at top)
<Tab>           Next buffer
<S-Tab>         Previous buffer
<leader>bp      Pin buffer
<leader>bP      Delete non-pinned
<leader>bo      Close others
<leader>bl      Close to right
<leader>bh      Close to left
<leader>bd      Close buffer
<leader>bD      Force close

WINDOWS
Ctrl+w s        Split horizontal
Ctrl+w v        Split vertical
Ctrl+w q        Close window

NAVIGATE
Ctrl+h          Left window
Ctrl+j          Down window
Ctrl+k          Up window
Ctrl+l          Right window

RESIZE
Ctrl+Up/Down    Height
Ctrl+Left/Right Width
]],
  },
  {
    title = 'Diagnostics & Trouble',
    content = [[
QUICK NAVIGATION
[d              Previous diagnostic
]d              Next diagnostic
<leader>cd      Show diagnostic float

TROUBLE LIST
<leader>xx      Toggle Trouble
<leader>xw      Workspace diagnostics
<leader>xd      Document diagnostics
<leader>xq      Quickfix list
<leader>xl      Location list

Inside Trouble:
  Enter         Jump to location
  o             Open in split
  q             Close
  r             Refresh

DIAGNOSTIC SYMBOLS
  E  Error      Must fix
  W  Warning    Should fix
  I  Info       Good to know
  H  Hint       Suggestion
]],
  },
  {
    title = 'Terminal',
    content = [[
TOGGLETERM
<leader>tf      Floating terminal
<leader>th      Horizontal (bottom)
<leader>tv      Vertical (side)

QUICK TOGGLE
Ctrl+\          Toggle last terminal

IN TERMINAL
Ctrl+\          Exit to normal mode
Esc Esc         Exit (double tap)

MULTIPLE TERMINALS
1<Ctrl+\>       Toggle terminal 1
2<Ctrl+\>       Toggle terminal 2
(and so on...)

LazyGit opens in its own terminal.
Use floating for quick commands,
horizontal for watching output.
]],
  },
  {
    title = 'Quick Reference',
    content = [[
ESSENTIAL KEYBINDINGS

FILES & SEARCH
  <leader>e       File explorer
  <leader>sf      Find files
  <leader>sg      Search contents
  <leader>Sr      Search & Replace

CODE
  gd              Definition
  K               Hover docs
  <leader>ca      Code actions
  <leader>cr      Rename
  <leader>f       Format

GIT
  <leader>gg      LazyGit
  <leader>gd      Diff view
  <leader>gD      Staged diff
  <leader>gU      Unstaged diff

DATABASE
  <leader>Dt      Toggle DB UI
  <leader>Da      Add connection

JSON
  <leader>jq      Explore JSON

AI
  <leader>aa      AI Chat
  Ctrl+l          Accept Copilot

TEST/DEBUG
  <leader>tt      Run test
  <leader>dc      Debug start
  <leader>db      Breakpoint

TODO
  <leader>st      Search TODOs
  ]t / [t         Next/prev TODO

HELP
  <leader>?       This tutorial
]],
  },
}

-- State
M.current_section = 1
M.buf = nil
M.win = nil

function M.create_window()
  local width = math.floor(vim.o.columns * 0.6)
  local height = math.floor(vim.o.lines * 0.75)
  local row = math.floor((vim.o.lines - height) / 2)
  local col = math.floor((vim.o.columns - width) / 2)

  M.buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_option(M.buf, 'bufhidden', 'wipe')
  vim.api.nvim_buf_set_option(M.buf, 'filetype', 'tutorial')

  M.win = vim.api.nvim_open_win(M.buf, true, {
    relative = 'editor',
    width = width,
    height = height,
    row = row,
    col = col,
    style = 'minimal',
    border = 'rounded',
    title = ' Tutorial ',
    title_pos = 'center',
  })

  vim.api.nvim_win_set_option(M.win, 'wrap', true)
  vim.api.nvim_win_set_option(M.win, 'linebreak', true)
  vim.api.nvim_win_set_option(M.win, 'cursorline', false)

  local opts = { buffer = M.buf, nowait = true, silent = true }
  
  vim.keymap.set('n', 'n', function() M.next_section() end, opts)
  vim.keymap.set('n', '<Right>', function() M.next_section() end, opts)
  vim.keymap.set('n', 'l', function() M.next_section() end, opts)
  vim.keymap.set('n', 'p', function() M.prev_section() end, opts)
  vim.keymap.set('n', '<Left>', function() M.prev_section() end, opts)
  vim.keymap.set('n', 'h', function() M.prev_section() end, opts)
  vim.keymap.set('n', 'q', function() M.close() end, opts)
  vim.keymap.set('n', '<Esc>', function() M.close() end, opts)
  vim.keymap.set('n', '?', function()
    M.current_section = 1
    M.render()
  end, opts)

  for i = 1, 9 do
    vim.keymap.set('n', tostring(i), function()
      if i <= #M.sections then
        M.current_section = i
        M.render()
      end
    end, opts)
  end

  vim.keymap.set('n', '0', function()
    M.current_section = 10
    M.render()
  end, opts)
end

function M.render()
  if not M.buf or not vim.api.nvim_buf_is_valid(M.buf) then
    return
  end

  local section = M.sections[M.current_section]
  local lines = {}

  table.insert(lines, '')
  table.insert(lines, '  ' .. section.title)
  table.insert(lines, '  ' .. string.rep('─', 40))
  table.insert(lines, '')

  for line in section.content:gmatch '[^\n]*' do
    table.insert(lines, '  ' .. line)
  end

  table.insert(lines, '')
  table.insert(lines, string.rep('─', 50))
  local nav = string.format('  %d/%d  │  n: Next  p: Prev  q: Close', M.current_section, #M.sections)
  table.insert(lines, nav)

  vim.api.nvim_buf_set_option(M.buf, 'modifiable', true)
  vim.api.nvim_buf_set_lines(M.buf, 0, -1, false, lines)
  vim.api.nvim_buf_set_option(M.buf, 'modifiable', false)

  vim.api.nvim_win_set_cursor(M.win, { 1, 0 })
end

function M.next_section()
  if M.current_section < #M.sections then
    M.current_section = M.current_section + 1
    M.render()
  end
end

function M.prev_section()
  if M.current_section > 1 then
    M.current_section = M.current_section - 1
    M.render()
  end
end

function M.close()
  if M.win and vim.api.nvim_win_is_valid(M.win) then
    vim.api.nvim_win_close(M.win, true)
  end
  M.win = nil
  M.buf = nil
  M.current_section = 1
end

function M.open()
  if M.win and vim.api.nvim_win_is_valid(M.win) then
    M.close()
    return
  end

  M.current_section = 1
  M.create_window()
  M.render()
end

function M.setup()
  vim.keymap.set('n', '<leader>?', function()
    require('config.tutorial').open()
  end, { desc = 'Tutorial' })
end

return M
