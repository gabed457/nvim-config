# Backend Developer Neovim Configuration# Backend Developer Neovim Configuration# nvim-config



> **A batteries-included Neovim setup optimized for Node.js/TypeScript Staff+ Engineers**



Stop switching between VSCode and terminal. This config gives you everything you need for professional backend development in a single, fast, keyboard-driven environment.> **A batteries-included Neovim setup optimized for Node.js/TypeScript Staff+ Engineers**## Introduction



```

Press <Space>? after installation to open the interactive tutorial

```Stop switching between VSCode and terminal. This config gives you everything you need for professional backend development in a single, fast, keyboard-driven environment.A comprehensive Neovim configuration optimized for **Node.js/TypeScript development** with **enterprise-grade AI integration**. Built on kickstart.nvim with extensive enhancements.



---



## 🎯 Who Is This For?```### ✨ Key Features



- **Backend developers** working with Node.js, TypeScript, and REST APIsPress <Space>? after installation to open the interactive tutorial

- **Staff+ engineers** who want IDE features without IDE bloat

- **VSCode refugees** looking for AI coding assistance in Neovim```* **🤖 AI-Powered Development** - Three AI modes (Agent, Ask, Edit) similar to VSCode

- **Anyone** who values speed, keyboard-driven workflows, and customization

  - GitHub Copilot integration with inline suggestions

---

---  - CopilotChat for conversational AI assistance

## ✨ Feature Overview

  - Avante for inline code editing

### What's Included

## 🎯 Who Is This For?  - Model switching support

| Category | Features |

|----------|----------|* **⚡ TypeScript/JavaScript Excellence**

| **🤖 AI Coding** | GitHub Copilot inline suggestions, CopilotChat (Agent mode), Avante (inline edit), model switching |

| **📝 TypeScript/JS** | Full LSP, auto-imports, inlay hints, template string conversion, ESLint, Prettier |- **Backend developers** working with Node.js, TypeScript, and REST APIs  - Full LSP support with ts_ls, ESLint, and JSON schemas

| **🗄️ Database** | Connect to PostgreSQL, MySQL, SQLite with vim-dadbod UI, SQL autocompletion |

| **🌐 API Testing** | Bruno/HTTP client, environment management, cURL export |- **Staff+ engineers** who want IDE features without IDE bloat  - Auto-imports and intelligent completions

| **🧪 Testing** | Jest & Vitest integration, run tests from editor, debug tests with DAP |

| **🐛 Debugging** | VSCode-like debugger with 12 configurations, persistent breakpoints, inline variable display |- **VSCode refugees** looking for AI coding assistance in Neovim  - Package.json version management

| **🌿 Git** | LazyGit TUI, staged/unstaged diffs, blame, conflict resolution |

| **📋 TODO Tracking** | Highlight and search TODO/FIXME/HACK comments across project |- **Anyone** who values speed, keyboard-driven workflows, and customization  - Template string auto-conversion

| **🔍 Search** | Fuzzy find files, grep contents, project-wide search & replace (Spectre) |

| **📁 File Explorer** | Neo-tree with git status icons, file operations |* **🧪 Testing & Debugging**

| **🐳 Docker** | Dockerfile & docker-compose LSP support |

| **📄 YAML** | Full LSP for CI/CD, k8s manifests, GitHub Actions |---  - Neotest integration (Jest, Vitest)

| **🔐 Environment** | .env file support with auto-loading |

| **📊 JSON** | Schema validation, jq-powered exploration |  - Full DAP debugging for Node.js and Chrome

| **📜 Logs** | Syntax highlighting for .log files |
| **☸️ Kubernetes** | kubectl.nvim for pod management, yaml-companion for K8s schemas, Helm support |
| **🏗️ Terraform** | Full LSP, formatting, linting for infrastructure as code |
| **📍 Navigation** | Harpoon for quick file access, Aerial for code outline |
| **💾 Session** | Persistence.nvim for automatic session management |
| **📊 Coverage** | nvim-coverage for test coverage visualization |
| **📝 Markdown** | Live preview, table mode for TDDs/RFCs |

## ✨ Feature Overview  - Visual debugging with virtual text

### What's Intentionally Left Out

* **🎨 Modern UI**

We kept this config focused on **backend development**. Here's what we deliberately excluded:

### What's Included  - Lualine statusline

| Excluded | Reason |

|----------|--------|  - Bufferline for tabs

| **Frontend frameworks** (React/Vue/Svelte components) | Backend-focused; add if needed |

| **Prisma ORM** | We use TypeORM; add `prismals` if you use Prisma || Category | Features |  - Noice for better notifications

| **GraphQL** | Add `graphql-language-service` if you work with GraphQL |

| **Python/Go/Rust LSPs** | Node.js focused; add language servers as needed ||----------|----------|  - Neo-tree file explorer

| **Heavy themes/eye candy** | Performance over aesthetics |

| **Session management** | Kept simple; add if you need persistent sessions || **🤖 AI Coding** | GitHub Copilot inline suggestions, CopilotChat (Agent mode), Avante (inline edit), model switching |  - Integrated terminal (ToggleTerm)

| **Project management** | Use git worktrees or tmux instead |

| **Org-mode/Note-taking** | Use dedicated tools like Obsidian || **📝 TypeScript/JS** | Full LSP, auto-imports, inlay hints, template string conversion, ESLint, Prettier |* **🔧 Git Integration**

| **Copilot alternatives** (Codeium, Tabnine) | Copilot-only for consistency |

| **🗄️ Database** | Connect to PostgreSQL, MySQL, SQLite with vim-dadbod UI, SQL autocompletion |  - LazyGit TUI

---

| **🌐 API Testing** | Bruno/HTTP client, environment management, cURL export |  - Git blame, diff view, and conflict resolution

## 🚀 Quick Start

| **🧪 Testing** | Jest & Vitest integration, run tests from editor, debug tests with DAP |  - Gitsigns for inline git changes

### Prerequisites

| **🐛 Debugging** | Full Node.js debugger, breakpoints, step-through, variable inspection |* **📦 Production Ready**

```bash

# Required| **🌿 Git** | LazyGit TUI, staged/unstaged diffs, blame, conflict resolution |  - Bruno API client integration with multi-collection support

brew install neovim node git ripgrep

| **📋 TODO Tracking** | Highlight and search TODO/FIXME/HACK comments across project |  - REST client for .http and .bru files

# Recommended

brew install lazygit jq fd| **🔍 Search** | Fuzzy find files, grep contents, project-wide search & replace (Spectre) |  - Extensive keybindings

```

| **📁 File Explorer** | Neo-tree with git status icons, file operations |  - Comprehensive documentation

### Installation

| **🐳 Docker** | Dockerfile & docker-compose LSP support |

```bash

# Backup existing config (if any)| **📄 YAML** | Full LSP for CI/CD, k8s manifests, GitHub Actions |### 🚀 Quick Start

mv ~/.config/nvim ~/.config/nvim.backup

| **🔐 Environment** | .env file support with auto-loading |

# Clone this config

git clone https://github.com/gabed457/nvim-config.git ~/.config/nvim| **📊 JSON** | Schema validation, jq-powered exploration |See [AI_GUIDE.md](./AI_GUIDE.md) for AI features, [KEYBINDINGS.md](./KEYBINDINGS.md) for all keybindings, and [BRUNO_GUIDE.md](./BRUNO_GUIDE.md) for API testing.



# Start Neovim (plugins install automatically)| **📜 Logs** | Syntax highlighting for .log files |

nvim

```This configuration is:



### First Steps After Installation### What's Intentionally Left Out



1. **Wait** for plugins to install (you'll see progress in the UI)* **Optimized** - Specifically tuned for TypeScript/Node.js development

2. **Authenticate Copilot**: Run `:Copilot auth`

3. **Check health**: Run `:checkhealth`We kept this config focused on **backend development**. Here's what we deliberately excluded:* **Well-documented** - Complete guides for AI and keybindings

4. **Open tutorial**: Press `<Space>?`

* **Customizable** - Modular plugin structure

---

| Excluded | Reason |* **Ready to use** - No additional setup needed after installation

## ⌨️ Essential Keybindings

|----------|--------|

> Leader key is `<Space>`. Press it and wait to see all options.

| **Frontend frameworks** (React/Vue/Svelte components) | Backend-focused; add if needed |## Installation

### Daily Workflow

| **Prisma ORM** | We use TypeORM; add `prismals` if you use Prisma |

| Keys | Action |

|------|--------|| **GraphQL** | Add `graphql-language-service` if you work with GraphQL |### Install Neovim

| `<Space>e` | Toggle file explorer |

| `<Space>sf` | Find files || **Python/Go/Rust LSPs** | Node.js focused; add language servers as needed |

| `<Space>sg` | Search in files (grep) |

| `<Space>sr` | Resume last search || **Heavy themes/eye candy** | Performance over aesthetics |This configuration targets *only* the latest

| `<Space>?` | Open interactive tutorial |

| **Session management** | Kept simple; add if you need persistent sessions |['stable'](https://github.com/neovim/neovim/releases/tag/stable) and latest

### Code Navigation

| **Project management** | Use git worktrees or tmux instead |['nightly'](https://github.com/neovim/neovim/releases/tag/nightly) of Neovim.

| Keys | Action |

|------|--------|| **Org-mode/Note-taking** | Use dedicated tools like Obsidian |If you are experiencing issues, please make sure you have the latest versions.

| `gd` | Go to definition |

| `gr` | Go to references || **Copilot alternatives** (Codeium, Tabnine) | Copilot-only for consistency |

| `K` | Hover documentation |

| `<Space>ca` | Code actions |### Install External Dependencies

| `<Space>cr` | Rename symbol |

| `<Space>f` | Format file |---



### AI CodingExternal Requirements:



| Keys | Action |## 🚀 Quick Start- Basic utils: `git`, `make`, `unzip`, C Compiler (`gcc`)

|------|--------|

| `Ctrl+l` | Accept Copilot suggestion |- [ripgrep](https://github.com/BurntSushi/ripgrep#installation)

| `<Space>aa` | Open AI Chat |

| `<Space>aq` | Quick AI question |### Prerequisites- Clipboard tool (xclip/xsel/win32yank or other depending on platform)

| `<Space>ae` | Explain selected code |

| `<Space>af` | Fix code |- A [Nerd Font](https://www.nerdfonts.com/): optional, provides various icons

| `<Space>ai` | Inline AI edit (Avante) |

```bash  - if you have it set `vim.g.have_nerd_font` in `init.lua` to true

### Git

# Required- Language Setup:

| Keys | Action |

|------|--------|brew install neovim node git ripgrep  - If you want to write Typescript, you need `npm`

| `<Space>gg` | Open LazyGit |

| `<Space>gd` | Toggle diff view |  - If you want to write Golang, you will need `go`

| `<Space>gD` | View staged changes |

| `<Space>gU` | View unstaged changes |# Recommended  - etc.

| `<Space>gb` | Toggle git blame |

brew install lazygit jq fd

### Testing

```> **NOTE**

| Keys | Action |

|------|--------|> See [Install Recipes](#Install-Recipes) for additional Windows and Linux specific notes

| `<Space>tt` | Run nearest test |

| `<Space>tf` | Run file tests |### Installation> and quick install snippets

| `<Space>ts` | Toggle test summary |

| `<Space>td` | Debug test |



### Debugging (VSCode-like)```bash### Install nvim-config



| Keys | Action |# Backup existing config (if any)

|------|--------|

| `F5` | Start/Continue |mv ~/.config/nvim ~/.config/nvim.backup> **NOTE**

| `Shift+F5` | Stop |

| `Ctrl+Shift+F5` | Restart |> [Backup](#FAQ) your previous configuration (if any exists)

| `F9` | Toggle breakpoint |

| `F10` | Step over |# Clone this config

| `F11` | Step into |

| `Shift+F11` | Step out |git clone https://github.com/gabed457/nvim-config.git ~/.config/nvimNeovim's configurations are located under the following paths, depending on your OS:

| `<Space>db` | Toggle breakpoint |

| `<Space>dB` | Conditional breakpoint |

| `<Space>dc` | Start/Continue |

| `<Space>du` | Toggle debug UI |# Start Neovim (plugins install automatically)| OS | PATH |

| `<Space>dh` | Hover variable |

| `<Space>de` | Eval expression |nvim| :- | :--- |

| `K` | Hover variable (while debugging) |

```| Linux, MacOS | `$XDG_CONFIG_HOME/nvim`, `~/.config/nvim` |

### Database

| Windows (cmd)| `%localappdata%\nvim\` |

| Keys | Action |

|------|--------|### First Steps After Installation| Windows (powershell)| `$env:LOCALAPPDATA\nvim\` |

| `<Space>Dt` | Toggle database UI |

| `<Space>Da` | Add database connection |

### Kubernetes (New!)

| Keys | Action |
|------|--------|
| `<Space>Kk` | Open kubectl UI |
| `<Space>Kp` | View Pods |
| `<Space>Kd` | View Deployments |
| `<Space>Ks` | View Services |
| `<Space>Kl` | View Logs |
| `<Space>Ke` | View Events |
| `<Space>Ky` | Select YAML Schema |

### Navigation (New!)

| Keys | Action |
|------|--------|
| `<Space>ha` | Add file to Harpoon |
| `<Space>hh` | Open Harpoon menu |
| `<Space>1-5` | Jump to Harpoon file |
| `<Space>co` | Code outline (Aerial) |
| `<Space>uu` | Undo tree |

### Session (New!)

| Keys | Action |
|------|--------|
| `<Space>qs` | Restore session |
| `<Space>ql` | Restore last session |
| `<Space>qd` | Don't save session |

### Coverage (New!)

| Keys | Action |
|------|--------|
| `<Space>tC` | Toggle coverage |
| `<Space>tc` | Coverage summary |
| `<Space>tL` | Load coverage |

### Markdown (New!)

| Keys | Action |
|------|--------|
| `<Space>mp` | Markdown preview |
| `<Space>mt` | Table mode |

### TODO Comments1. **Wait** for plugins to install (you'll see progress in the UI)#### Recommended Step



| Keys | Action |2. **Authenticate Copilot**: Run `:Copilot auth`

|------|--------|

| `]t` | Next TODO |3. **Check health**: Run `:checkhealth`[Fork](https://docs.github.com/en/get-started/quickstart/fork-a-repo) this repo

| `[t` | Previous TODO |

| `<Space>st` | Search all TODOs |4. **Open tutorial**: Press `<Space>?`so that you have your own copy that you can modify, then install by cloning the



### Search & Replacefork to your machine using one of the commands below, depending on your OS.



| Keys | Action |---

|------|--------|

| `<Space>Sr` | Open Spectre (search/replace) |> **NOTE**

| `<Space>Sw` | Search word under cursor |

## ⌨️ Essential Keybindings> Your fork's url will be something like this:

### REST/Bruno API

> `https://github.com/<your_github_username>/nvim-config.git`

| Keys | Action |

|------|--------|> Leader key is `<Space>`. Press it and wait to see all options.

| `<Space>rr` | Run HTTP request |

| `<Space>rt` | Toggle response view |You likely want to remove `lazy-lock.json` from your fork's `.gitignore` file

| `<Space>rc` | Copy as cURL |

### Daily Workflowtoo - it's ignored in this repo to make maintenance easier, but it's

---

[recommended to track it in version control](https://lazy.folke.io/usage/lockfile).

## 🐛 Debugging (VSCode-Like Experience)

| Keys | Action |

This configuration includes a **world-class TypeScript debugger** that matches VSCode's experience.

|------|--------|#### Clone nvim-config

### 12 Launch Configurations

| `<Space>e` | Toggle file explorer |> **NOTE**

When you press `F5` or `<Space>dc`, you can choose from:

| `<Space>sf` | Find files |> If following the recommended step above (i.e., forking the repo), replace

| Configuration | Use Case |

|---------------|----------|| `<Space>sg` | Search in files (grep) |> `gabed457` with `<your_github_username>` in the commands below

| 📄 Launch Current File | Debug any JS/TS file directly |

| 🔷 Launch with ts-node | TypeScript without compilation || `<Space>sr` | Resume last search |

| ⚡ Launch with tsx | Fast ts-node alternative |

| 📦 Launch npm script | Debug any npm script (dev, start, etc.) || `<Space>?` | Open interactive tutorial |<details><summary> Linux and Mac </summary>

| 🔗 Attach to Process | Attach to running Node.js process |

| 🌐 Attach to Port 9229 | For `nodemon --inspect` |

| 🧪 Debug Jest Tests | Run all Jest tests with debugger |

| 🧪 Debug Jest Current File | Debug tests in current file |### Code Navigation```sh

| 🧪 Debug Vitest Tests | Vitest support |

| 🪺 Debug NestJS | NestJS `start:debug` script |git clone https://github.com/gabed457/nvim-config.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim

| 🚀 Debug Server | Express/Fastify `dist/index.js` |

| 🌐 Debug in Chrome | Frontend debugging || Keys | Action |```



### Features That Match VSCode|------|--------|



| Feature | Description || `gd` | Go to definition |</details>

|---------|-------------|

| **Persistent Breakpoints** | Breakpoints survive Neovim restarts || `gr` | Go to references |

| **Inline Virtual Text** | Variable values shown inline: `const x = 5  // x = 5` |

| **Changed Variable Highlighting** | Modified variables highlighted in yellow || `K` | Hover documentation |<details><summary> Windows </summary>

| **Hover to Inspect** | Press `K` while debugging to see variable value |

| **Telescope Integration** | `<Space>dD` for configuration picker || `<Space>ca` | Code actions |

| **Nerd Font Icons** | Beautiful breakpoint and control icons |

| `<Space>cr` | Rename symbol |If you're using `cmd.exe`:

### Debugging Workflow

| `<Space>f` | Format file |

```

1. Open your TypeScript file```

2. <Space>db  →  Set breakpoint (red dot appears)

3. <Space>dc  →  Select configuration and start### AI Codinggit clone https://github.com/gabed457/nvim-config.git "%localappdata%\nvim"

4. F10        →  Step over

5. F11        →  Step into```

6. K          →  Hover any variable to inspect

7. <Space>du  →  Toggle debug UI panels| Keys | Action |

8. Shift+F5   →  Stop debugging

```|------|--------|If you're using `powershell.exe`



### Debug UI Layout| `Ctrl+l` | Accept Copilot suggestion |



```| `<Space>aa` | Open AI Chat |```

┌─────────────────────┬──────────────────────────────────────────┐

│  Variables (35%)    │                                          │| `<Space>aq` | Quick AI question |git clone https://github.com/gabed457/nvim-config.git "${env:LOCALAPPDATA}\nvim"

│   user = {...}      │        Your Code                         │

│   count = 5         │   with inline variable values            │| `<Space>ae` | Explain selected code |```

├─────────────────────┤        x = 42  y = "hello"               │

│  Watch (20%)       │                                          │| `<Space>af` | Fix code |

│   expression1       │                                          │

├─────────────────────┤                                          │| `<Space>ai` | Inline AI edit (Avante) |</details>

│  Call Stack (25%)  │                                          │

│   → main.ts:45      │                                          │

├─────────────────────┤                                          │

│  Breakpoints (20%) │                                          │### Git### Post Installation

│   ● main.ts:45      │                                          │

└─────────────────────┴──────────────────────────────────────────┘

│  Debug Console (60%)                │  REPL (40%)              │

│  > Server started on port 3000      │  > user.name             │| Keys | Action |Start Neovim

│  > Request received: GET /api       │  "John"                  │

└─────────────────────────────────────┴──────────────────────────┘|------|--------|

```

| `<Space>gg` | Open LazyGit |```sh

---

| `<Space>gd` | Toggle diff view |nvim

## 🧪 Testing Workflow

| `<Space>gD` | View staged changes |```

```

1. Open a test file (*.test.ts, *.spec.ts)| `<Space>gU` | View unstaged changes |

2. <Space>tt  →  Run test under cursor

3. <Space>ts  →  Toggle test summary panel| `<Space>gb` | Toggle git blame |That's it! Lazy will install all the plugins you have. Use `:Lazy` to view

4. <Space>td  →  Debug test with breakpoints

```current plugin status. Hit `q` to close the window.



Test adapters included:### Testing & Debug

- **Jest** - Full integration

- **Vitest** - Native support**Important First Steps:**



---| Keys | Action |



## 🗄️ Database Setup|------|--------|1. **Authenticate GitHub Copilot**: Run `:Copilot auth` and follow the prompts



Connect to any database supported by vim-dadbod:| `<Space>tt` | Run nearest test |2. **Install Node.js**: Required for TypeScript LSP and formatters



```| `<Space>tf` | Run file tests |3. **Check Health**: Run `:checkhealth` to verify all dependencies

<Space>Da  →  Enter connection string

```| `<Space>td` | Debug test |4. **Review Keybindings**: See [KEYBINDINGS.md](./KEYBINDINGS.md)



**Connection string examples:**| `<Space>db` | Toggle breakpoint |5. **Learn AI Features**: Read [AI_GUIDE.md](./AI_GUIDE.md)



```| `<Space>dc` | Start/continue debug |

postgresql://user:pass@localhost:5432/mydb

mysql://user:pass@localhost:3306/mydb| `F5` | Continue |### 📚 Documentation

sqlite:./dev.db

```| `F10` | Step over |



The database UI shows:This configuration includes comprehensive documentation:

- All tables and schemas

- Saved queries### Database

- Query results with formatting

- **[AI_GUIDE.md](./AI_GUIDE.md)** - Complete guide to AI features (Agent, Ask, Edit modes)

---

| Keys | Action |- **[KEYBINDINGS.md](./KEYBINDINGS.md)** - All keybindings organized by category

## 🌐 API Testing (Bruno/HTTP)

|------|--------|- **init.lua** - Main configuration with inline comments

Create `.http` or `.bru` files:

| `<Space>Dt` | Toggle database UI |

```http

### Get Users| `<Space>Da` | Add database connection |### 🎯 Quick Reference

GET http://localhost:3000/api/users

Authorization: Bearer {{token}}



### Create User### TODO Comments**Essential Keybindings:**

POST http://localhost:3000/api/users

Content-Type: application/json- `<Space>` - Leader key (wait for which-key popup)



{| Keys | Action |- `<Space>aa` - AI Agent Chat (conversational AI)

  "name": "John",

  "email": "john@example.com"|------|--------|- `<Space>aq` - Quick AI question

}

```| `]t` | Next TODO |- `<Space>ai` - Inline AI edit



Then:| `[t` | Previous TODO |- `<Space>e` - File explorer

- `<Space>rr` - Run request under cursor

- `<Space>rt` - Toggle between body/headers view| `<Space>st` | Search all TODOs |- `<Space>sf` - Find files

- `<Space>rc` - Copy as cURL command

- `<Space>sg` - Search in files

Configure environments in `lua/config/bruno-config.lua`.

### Search & Replace- `<Space>gg` - LazyGit

---

- `<C-\>` - Toggle terminal

## 📁 Project Structure

| Keys | Action |

```

~/.config/nvim/|------|--------|### 🔧 Node.js/TypeScript Features

├── init.lua                 # Main config (LSP, keybindings, core plugins)

├── lua/| `<Space>Sr` | Open Spectre (search/replace) |

│   ├── config/

│   │   ├── bruno-config.lua # API collection settings| `<Space>Sw` | Search word under cursor |**LSP Servers Included:**

│   │   └── tutorial.lua     # Interactive tutorial

│   └── plugins/- `ts_ls` - TypeScript/JavaScript language server

│       ├── backend.lua      # Database, Spectre, logs, dotenv

│       ├── coverage.lua     # Test coverage visualization (NEW)

│       ├── debug.lua        # VSCode-like debugger (DAP)### REST/Bruno API- `eslint` - ESLint integration

│       ├── git.lua          # Git integration

│       ├── kubernetes.lua   # kubectl.nvim, Helm, YAML schemas (NEW)

│       ├── markdown.lua     # Markdown preview, table mode (NEW)

│       ├── navigation.lua   # Harpoon, Aerial, marks, undotree (NEW)

│       ├── session.lua      # Persistence.nvim session management (NEW)

│       ├── terraform.lua    # Terraform/HCL support (NEW)

│       ├── testing.lua      # Neotest (Jest, Vitest)- `jsonls` - JSON with schema validation

│       ├── typescript.lua   # TS tools, TODO comments

│       ├── ui.lua           # Statusline, bufferline, notifications| Keys | Action |- `html`, `cssls` - Web development

│       └── ...

└── lazy-lock.json           # Plugin versions (committed)|------|--------|- `tailwindcss` - Tailwind CSS IntelliSense

```

| `<Space>rr` | Run HTTP request |- `emmet_ls` - Emmet abbreviations

---

| `<Space>rt` | Toggle response view |

## 🔧 Customization

| `<Space>rc` | Copy as cURL |**Tools Installed:**

### Adding a Plugin

- Prettier/Prettierd for formatting

Create a file in `lua/plugins/` that returns a table:

---- ESLint_d for fast linting

```lua

-- lua/plugins/my-plugin.lua- JS Debug Adapter for debugging

return {

  {## 🗄️ Database Setup- Package version management

    'author/plugin-name',

    config = function()- Auto-import support

      require('plugin-name').setup({})

    end,Connect to any database supported by vim-dadbod:

  },

}**Testing:**

```

```- Jest integration

### Adding an LSP Server

<Space>Da  →  Enter connection string- Vitest support

In `init.lua`, find the `servers` table and add:

```- Debug tests with DAP

```lua

local servers = {

  -- ... existing servers ...

  **Connection string examples:**### Getting Started

  -- Add your server

  graphql = {},  -- or with options: { settings = { ... } }

}

``````[The Only Video You Need to Get Started with Neovim](https://youtu.be/m8C0Cq9Uv9o)



Then run `:Mason` to install it.postgresql://user:pass@localhost:5432/mydb



### Changing Keybindingsmysql://user:pass@localhost:3306/mydb**Additional Resources:**



Search for `vim.keymap.set` in `init.lua` or plugin files. Example:sqlite:./dev.db- Press `<Space>` and wait to see all available commands (which-key)



```lua```- Use `:Telescope keymaps` to search keybindings

vim.keymap.set('n', '<leader>xx', '<cmd>SomeCommand<cr>', { desc = 'Description' })

```- Check `:help` for Neovim documentation



---The database UI shows:- Read inline comments in `init.lua`



## 📋 LSP Servers Included- All tables and schemas



| Server | Purpose |- Saved queries### FAQ

|--------|---------|

| `ts_ls` | TypeScript/JavaScript |- Query results with formatting

| `eslint` | Linting |

| `jsonls` | JSON with schema validation |* What should I do if I already have a pre-existing neovim configuration?

| `yamlls` | YAML (CI/CD, k8s, docker-compose) |

| `dockerls` | Dockerfile |---  * You should back it up and then delete all associated files.

| `docker_compose_language_service` | docker-compose.yml |

| `html` | HTML |  * This includes your existing init.lua and the neovim files in `~/.local`

| `cssls` | CSS/SCSS/Less |

| `tailwindcss` | Tailwind CSS |## 🧪 Testing Workflow    which can be deleted with `rm -rf ~/.local/share/nvim/`

| `emmet_ls` | Emmet abbreviations |

| `lua_ls` | Lua (for Neovim config) |* Can I keep my existing configuration in parallel to this config?



---```  * Yes! You can use [NVIM_APPNAME](https://neovim.io/doc/user/starting.html#%24NVIM_APPNAME)`=nvim-NAME`



## 🛠️ Troubleshooting1. Open a test file (*.test.ts, *.spec.ts)    to maintain multiple configurations. For example, you can install this



### Copilot not working?2. <Space>tt  →  Run test under cursor    configuration in `~/.config/nvim-gabed` and create an alias:

```vim

:Copilot auth3. <Space>ts  →  Toggle test summary panel    ```

:Copilot status

```4. <Space>td  →  Debug test with breakpoints    alias nvim-gabed='NVIM_APPNAME="nvim-gabed" nvim'



### LSP not starting?```    ```

```vim

:LspInfo    When you run Neovim using `nvim-gabed` alias it will use the alternative

:Mason  " Check if servers are installed

```Test adapters included:    config directory and the matching local directory



### Debugger not starting?- **Jest** - `npm test`    `~/.local/share/nvim-gabed`. You can apply this approach to any Neovim

```vim

:Mason  " Ensure js-debug-adapter is installed- **Vitest** - Native support    distribution that you would like to try out.

:lua require('dap').continue()  " Start debug manually

```* How do I switch between AI models?



### Plugin errors?---  * Press `<Space>am` in normal mode to see available models

```vim

:Lazy sync  * All AI features use GitHub Copilot by default

:Lazy clean

```## 🐛 Debugging Workflow  * You need an active Copilot subscription



### Check everything* Where can I add my own plugins?

```vim

:checkhealth```  * Add them to `lua/custom/plugins/` directory

```

1. Open your TypeScript/JavaScript file  * Each file should return a table of plugin specs

---

2. <Space>db  →  Set breakpoint on current line  * They will be automatically loaded

## 📚 Learning Resources

3. <Space>dc  →  Start debugging* What if I want to "uninstall" this configuration:

1. **Built-in Tutorial**: Press `<Space>?` after opening Neovim

2. **Which-key**: Press `<Space>` and wait to see all options4. F10        →  Step over  * See [lazy.nvim uninstall](https://github.com/folke/lazy.nvim#-uninstalling) information

3. **Search keymaps**: `<Space>sk` to fuzzy find any keybinding

4. **Neovim help**: `:help <topic>`5. F11        →  Step into* Why is the main `init.lua` a single file? Wouldn't it make sense to split it into multiple files?



---6. F5         →  Continue  * This configuration is based on kickstart.nvim, which serves as a teaching tool and reference



## 🤝 Contributing```    configuration. The main purpose is to provide a readable foundation that someone can easily



1. Fork this repo    understand and modify. As you progress in learning Neovim and Lua, you might consider splitting 

2. Create a feature branch

3. Make your changesThe debug UI shows:    `init.lua` into smaller parts. A fork of kickstart that does this while maintaining the 

4. Submit a PR

- Variables and their values    same functionality is available here:

Please keep the backend-focused philosophy in mind.

- Call stack    * [kickstart-modular.nvim](https://github.com/dam9000/kickstart-modular.nvim)

---

- Breakpoints list  * This configuration includes additional plugins in `lua/custom/plugins/` for better organization.

## 📄 License

- REPL for evaluating expressions

MIT - Use it, modify it, share it.

### Install Recipes

---

---

<p align="center">

  <strong>Happy coding! 🚀</strong><br>Below you can find OS specific install instructions for Neovim and dependencies.

  <em>Press <code>&lt;Space&gt;?</code> to start the tutorial</em>

</p>## 🌐 API Testing (Bruno/HTTP)


After installing all the dependencies continue with the [Install nvim-config](#Install-nvim-config) step.

Create `.http` or `.bru` files:

#### Windows Installation

```http

### Get Users<details><summary>Windows with Microsoft C++ Build Tools and CMake</summary>

GET http://localhost:3000/api/usersInstallation may require installing build tools and updating the run command for `telescope-fzf-native`

Authorization: Bearer {{token}}

See `telescope-fzf-native` documentation for [more details](https://github.com/nvim-telescope/telescope-fzf-native.nvim#installation)

### Create User

POST http://localhost:3000/api/usersThis requires:

Content-Type: application/json

- Install CMake and the Microsoft C++ Build Tools on Windows

{

  "name": "John",```lua

  "email": "john@example.com"{'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }

}```

```</details>

<details><summary>Windows with gcc/make using chocolatey</summary>

Then:Alternatively, one can install gcc and make which don't require changing the config,

- `<Space>rr` - Run request under cursorthe easiest way is to use choco:

- `<Space>rt` - Toggle between body/headers view

- `<Space>rc` - Copy as cURL command1. install [chocolatey](https://chocolatey.org/install)

either follow the instructions on the page or use winget,

Configure environments in `lua/config/bruno-config.lua`.run in cmd as **admin**:

```

---winget install --accept-source-agreements chocolatey.chocolatey

```

## 📁 Project Structure

2. install all requirements using choco, exit previous cmd and

```open a new one so that choco path is set, and run in cmd as **admin**:

~/.config/nvim/```

├── init.lua                 # Main config (LSP, keybindings, core plugins)choco install -y neovim git ripgrep wget fd unzip gzip mingw make

├── lua/```

│   ├── config/</details>

│   │   ├── bruno-config.lua # API collection settings<details><summary>WSL (Windows Subsystem for Linux)</summary>

│   │   └── tutorial.lua     # Interactive tutorial

│   └── plugins/```

│       ├── backend.lua      # Database, Spectre, logs, dotenvwsl --install

│       ├── git.lua          # Git integrationwsl

│       ├── typescript.lua   # TS tools, TODO comments, testingsudo add-apt-repository ppa:neovim-ppa/unstable -y

│       ├── ui.lua           # Statusline, bufferline, notificationssudo apt update

│       └── ...sudo apt install make gcc ripgrep unzip git xclip neovim

└── lazy-lock.json           # Plugin versions (committed)```

```</details>



---#### Linux Install

<details><summary>Ubuntu Install Steps</summary>

## 🔧 Customization

```

### Adding a Pluginsudo add-apt-repository ppa:neovim-ppa/unstable -y

sudo apt update

Create a file in `lua/plugins/` that returns a table:sudo apt install make gcc ripgrep unzip git xclip neovim

```

```lua</details>

-- lua/plugins/my-plugin.lua<details><summary>Debian Install Steps</summary>

return {

  {```

    'author/plugin-name',sudo apt update

    config = function()sudo apt install make gcc ripgrep unzip git xclip curl

      require('plugin-name').setup({})

    end,# Now we install nvim

  },curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz

}sudo rm -rf /opt/nvim-linux64

```sudo mkdir -p /opt/nvim-linux64

sudo chmod a+rX /opt/nvim-linux64

### Adding an LSP Serversudo tar -C /opt -xzf nvim-linux64.tar.gz



In `init.lua`, find the `servers` table and add:# make it available in /usr/local/bin, distro installs to /usr/bin

sudo ln -sf /opt/nvim-linux64/bin/nvim /usr/local/bin/

```lua```

local servers = {</details>

  -- ... existing servers ...<details><summary>Fedora Install Steps</summary>

  

  -- Add your server```

  graphql = {},  -- or with options: { settings = { ... } }sudo dnf install -y gcc make git ripgrep fd-find unzip neovim

}```

```</details>



Then run `:Mason` to install it.<details><summary>Arch Install Steps</summary>



### Changing Keybindings```

sudo pacman -S --noconfirm --needed gcc make git ripgrep fd unzip neovim

Search for `vim.keymap.set` in `init.lua` or plugin files. Example:```

</details>

```lua

vim.keymap.set('n', '<leader>xx', '<cmd>SomeCommand<cr>', { desc = 'Description' })
```

---

## 📋 LSP Servers Included

| Server | Purpose |
|--------|---------|
| `ts_ls` | TypeScript/JavaScript |
| `eslint` | Linting |
| `jsonls` | JSON with schema validation |
| `yamlls` | YAML (CI/CD, k8s, docker-compose) |
| `dockerls` | Dockerfile |
| `docker_compose_language_service` | docker-compose.yml |
| `html` | HTML |
| `cssls` | CSS/SCSS/Less |
| `tailwindcss` | Tailwind CSS |
| `emmet_ls` | Emmet abbreviations |
| `lua_ls` | Lua (for Neovim config) |

---

## 🛠️ Troubleshooting

### Copilot not working?
```vim
:Copilot auth
:Copilot status
```

### LSP not starting?
```vim
:LspInfo
:Mason  " Check if servers are installed
```

### Plugin errors?
```vim
:Lazy sync
:Lazy clean
```

### Check everything
```vim
:checkhealth
```

---

## 📚 Learning Resources

1. **Built-in Tutorial**: Press `<Space>?` after opening Neovim
2. **Which-key**: Press `<Space>` and wait to see all options
3. **Search keymaps**: `<Space>sk` to fuzzy find any keybinding
4. **Neovim help**: `:help <topic>`

---

## 🤝 Contributing

1. Fork this repo
2. Create a feature branch
3. Make your changes
4. Submit a PR

Please keep the backend-focused philosophy in mind.

---

## 📄 License

MIT - Use it, modify it, share it.

---

<p align="center">
  <strong>Happy coding! 🚀</strong><br>
  <em>Press <code>&lt;Space&gt;?</code> to start the tutorial</em>
</p>
