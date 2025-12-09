# Backend Developer Neovim Configuration# nvim-config



> **A batteries-included Neovim setup optimized for Node.js/TypeScript Staff+ Engineers**## Introduction



Stop switching between VSCode and terminal. This config gives you everything you need for professional backend development in a single, fast, keyboard-driven environment.A comprehensive Neovim configuration optimized for **Node.js/TypeScript development** with **enterprise-grade AI integration**. Built on kickstart.nvim with extensive enhancements.



```### ✨ Key Features

Press <Space>? after installation to open the interactive tutorial

```* **🤖 AI-Powered Development** - Three AI modes (Agent, Ask, Edit) similar to VSCode

  - GitHub Copilot integration with inline suggestions

---  - CopilotChat for conversational AI assistance

  - Avante for inline code editing

## 🎯 Who Is This For?  - Model switching support

* **⚡ TypeScript/JavaScript Excellence**

- **Backend developers** working with Node.js, TypeScript, and REST APIs  - Full LSP support with ts_ls, ESLint, and JSON schemas

- **Staff+ engineers** who want IDE features without IDE bloat  - Auto-imports and intelligent completions

- **VSCode refugees** looking for AI coding assistance in Neovim  - Package.json version management

- **Anyone** who values speed, keyboard-driven workflows, and customization  - Template string auto-conversion

* **🧪 Testing & Debugging**

---  - Neotest integration (Jest, Vitest)

  - Full DAP debugging for Node.js and Chrome

## ✨ Feature Overview  - Visual debugging with virtual text

* **🎨 Modern UI**

### What's Included  - Lualine statusline

  - Bufferline for tabs

| Category | Features |  - Noice for better notifications

|----------|----------|  - Neo-tree file explorer

| **🤖 AI Coding** | GitHub Copilot inline suggestions, CopilotChat (Agent mode), Avante (inline edit), model switching |  - Integrated terminal (ToggleTerm)

| **📝 TypeScript/JS** | Full LSP, auto-imports, inlay hints, template string conversion, ESLint, Prettier |* **🔧 Git Integration**

| **🗄️ Database** | Connect to PostgreSQL, MySQL, SQLite with vim-dadbod UI, SQL autocompletion |  - LazyGit TUI

| **🌐 API Testing** | Bruno/HTTP client, environment management, cURL export |  - Git blame, diff view, and conflict resolution

| **🧪 Testing** | Jest & Vitest integration, run tests from editor, debug tests with DAP |  - Gitsigns for inline git changes

| **🐛 Debugging** | Full Node.js debugger, breakpoints, step-through, variable inspection |* **📦 Production Ready**

| **🌿 Git** | LazyGit TUI, staged/unstaged diffs, blame, conflict resolution |  - Bruno API client integration with multi-collection support

| **📋 TODO Tracking** | Highlight and search TODO/FIXME/HACK comments across project |  - REST client for .http and .bru files

| **🔍 Search** | Fuzzy find files, grep contents, project-wide search & replace (Spectre) |  - Extensive keybindings

| **📁 File Explorer** | Neo-tree with git status icons, file operations |  - Comprehensive documentation

| **🐳 Docker** | Dockerfile & docker-compose LSP support |

| **📄 YAML** | Full LSP for CI/CD, k8s manifests, GitHub Actions |### 🚀 Quick Start

| **🔐 Environment** | .env file support with auto-loading |

| **📊 JSON** | Schema validation, jq-powered exploration |See [AI_GUIDE.md](./AI_GUIDE.md) for AI features, [KEYBINDINGS.md](./KEYBINDINGS.md) for all keybindings, and [BRUNO_GUIDE.md](./BRUNO_GUIDE.md) for API testing.

| **📜 Logs** | Syntax highlighting for .log files |

This configuration is:

### What's Intentionally Left Out

* **Optimized** - Specifically tuned for TypeScript/Node.js development

We kept this config focused on **backend development**. Here's what we deliberately excluded:* **Well-documented** - Complete guides for AI and keybindings

* **Customizable** - Modular plugin structure

| Excluded | Reason |* **Ready to use** - No additional setup needed after installation

|----------|--------|

| **Frontend frameworks** (React/Vue/Svelte components) | Backend-focused; add if needed |## Installation

| **Prisma ORM** | We use TypeORM; add `prismals` if you use Prisma |

| **GraphQL** | Add `graphql-language-service` if you work with GraphQL |### Install Neovim

| **Python/Go/Rust LSPs** | Node.js focused; add language servers as needed |

| **Heavy themes/eye candy** | Performance over aesthetics |This configuration targets *only* the latest

| **Session management** | Kept simple; add if you need persistent sessions |['stable'](https://github.com/neovim/neovim/releases/tag/stable) and latest

| **Project management** | Use git worktrees or tmux instead |['nightly'](https://github.com/neovim/neovim/releases/tag/nightly) of Neovim.

| **Org-mode/Note-taking** | Use dedicated tools like Obsidian |If you are experiencing issues, please make sure you have the latest versions.

| **Copilot alternatives** (Codeium, Tabnine) | Copilot-only for consistency |

### Install External Dependencies

---

External Requirements:

## 🚀 Quick Start- Basic utils: `git`, `make`, `unzip`, C Compiler (`gcc`)

- [ripgrep](https://github.com/BurntSushi/ripgrep#installation)

### Prerequisites- Clipboard tool (xclip/xsel/win32yank or other depending on platform)

- A [Nerd Font](https://www.nerdfonts.com/): optional, provides various icons

```bash  - if you have it set `vim.g.have_nerd_font` in `init.lua` to true

# Required- Language Setup:

brew install neovim node git ripgrep  - If you want to write Typescript, you need `npm`

  - If you want to write Golang, you will need `go`

# Recommended  - etc.

brew install lazygit jq fd

```> **NOTE**

> See [Install Recipes](#Install-Recipes) for additional Windows and Linux specific notes

### Installation> and quick install snippets



```bash### Install nvim-config

# Backup existing config (if any)

mv ~/.config/nvim ~/.config/nvim.backup> **NOTE**

> [Backup](#FAQ) your previous configuration (if any exists)

# Clone this config

git clone https://github.com/gabed457/nvim-config.git ~/.config/nvimNeovim's configurations are located under the following paths, depending on your OS:



# Start Neovim (plugins install automatically)| OS | PATH |

nvim| :- | :--- |

```| Linux, MacOS | `$XDG_CONFIG_HOME/nvim`, `~/.config/nvim` |

| Windows (cmd)| `%localappdata%\nvim\` |

### First Steps After Installation| Windows (powershell)| `$env:LOCALAPPDATA\nvim\` |



1. **Wait** for plugins to install (you'll see progress in the UI)#### Recommended Step

2. **Authenticate Copilot**: Run `:Copilot auth`

3. **Check health**: Run `:checkhealth`[Fork](https://docs.github.com/en/get-started/quickstart/fork-a-repo) this repo

4. **Open tutorial**: Press `<Space>?`so that you have your own copy that you can modify, then install by cloning the

fork to your machine using one of the commands below, depending on your OS.

---

> **NOTE**

## ⌨️ Essential Keybindings> Your fork's url will be something like this:

> `https://github.com/<your_github_username>/nvim-config.git`

> Leader key is `<Space>`. Press it and wait to see all options.

You likely want to remove `lazy-lock.json` from your fork's `.gitignore` file

### Daily Workflowtoo - it's ignored in this repo to make maintenance easier, but it's

[recommended to track it in version control](https://lazy.folke.io/usage/lockfile).

| Keys | Action |

|------|--------|#### Clone nvim-config

| `<Space>e` | Toggle file explorer |> **NOTE**

| `<Space>sf` | Find files |> If following the recommended step above (i.e., forking the repo), replace

| `<Space>sg` | Search in files (grep) |> `gabed457` with `<your_github_username>` in the commands below

| `<Space>sr` | Resume last search |

| `<Space>?` | Open interactive tutorial |<details><summary> Linux and Mac </summary>



### Code Navigation```sh

git clone https://github.com/gabed457/nvim-config.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim

| Keys | Action |```

|------|--------|

| `gd` | Go to definition |</details>

| `gr` | Go to references |

| `K` | Hover documentation |<details><summary> Windows </summary>

| `<Space>ca` | Code actions |

| `<Space>cr` | Rename symbol |If you're using `cmd.exe`:

| `<Space>f` | Format file |

```

### AI Codinggit clone https://github.com/gabed457/nvim-config.git "%localappdata%\nvim"

```

| Keys | Action |

|------|--------|If you're using `powershell.exe`

| `Ctrl+l` | Accept Copilot suggestion |

| `<Space>aa` | Open AI Chat |```

| `<Space>aq` | Quick AI question |git clone https://github.com/gabed457/nvim-config.git "${env:LOCALAPPDATA}\nvim"

| `<Space>ae` | Explain selected code |```

| `<Space>af` | Fix code |

| `<Space>ai` | Inline AI edit (Avante) |</details>



### Git### Post Installation



| Keys | Action |Start Neovim

|------|--------|

| `<Space>gg` | Open LazyGit |```sh

| `<Space>gd` | Toggle diff view |nvim

| `<Space>gD` | View staged changes |```

| `<Space>gU` | View unstaged changes |

| `<Space>gb` | Toggle git blame |That's it! Lazy will install all the plugins you have. Use `:Lazy` to view

current plugin status. Hit `q` to close the window.

### Testing & Debug

**Important First Steps:**

| Keys | Action |

|------|--------|1. **Authenticate GitHub Copilot**: Run `:Copilot auth` and follow the prompts

| `<Space>tt` | Run nearest test |2. **Install Node.js**: Required for TypeScript LSP and formatters

| `<Space>tf` | Run file tests |3. **Check Health**: Run `:checkhealth` to verify all dependencies

| `<Space>td` | Debug test |4. **Review Keybindings**: See [KEYBINDINGS.md](./KEYBINDINGS.md)

| `<Space>db` | Toggle breakpoint |5. **Learn AI Features**: Read [AI_GUIDE.md](./AI_GUIDE.md)

| `<Space>dc` | Start/continue debug |

| `F5` | Continue |### 📚 Documentation

| `F10` | Step over |

This configuration includes comprehensive documentation:

### Database

- **[AI_GUIDE.md](./AI_GUIDE.md)** - Complete guide to AI features (Agent, Ask, Edit modes)

| Keys | Action |- **[KEYBINDINGS.md](./KEYBINDINGS.md)** - All keybindings organized by category

|------|--------|- **init.lua** - Main configuration with inline comments

| `<Space>Dt` | Toggle database UI |

| `<Space>Da` | Add database connection |### 🎯 Quick Reference



### TODO Comments**Essential Keybindings:**

- `<Space>` - Leader key (wait for which-key popup)

| Keys | Action |- `<Space>aa` - AI Agent Chat (conversational AI)

|------|--------|- `<Space>aq` - Quick AI question

| `]t` | Next TODO |- `<Space>ai` - Inline AI edit

| `[t` | Previous TODO |- `<Space>e` - File explorer

| `<Space>st` | Search all TODOs |- `<Space>sf` - Find files

- `<Space>sg` - Search in files

### Search & Replace- `<Space>gg` - LazyGit

- `<C-\>` - Toggle terminal

| Keys | Action |

|------|--------|### 🔧 Node.js/TypeScript Features

| `<Space>Sr` | Open Spectre (search/replace) |

| `<Space>Sw` | Search word under cursor |**LSP Servers Included:**

- `ts_ls` - TypeScript/JavaScript language server

### REST/Bruno API- `eslint` - ESLint integration

- `jsonls` - JSON with schema validation

| Keys | Action |- `html`, `cssls` - Web development

|------|--------|- `tailwindcss` - Tailwind CSS IntelliSense

| `<Space>rr` | Run HTTP request |- `emmet_ls` - Emmet abbreviations

| `<Space>rt` | Toggle response view |

| `<Space>rc` | Copy as cURL |**Tools Installed:**

- Prettier/Prettierd for formatting

---- ESLint_d for fast linting

- JS Debug Adapter for debugging

## 🗄️ Database Setup- Package version management

- Auto-import support

Connect to any database supported by vim-dadbod:

**Testing:**

```- Jest integration

<Space>Da  →  Enter connection string- Vitest support

```- Debug tests with DAP



**Connection string examples:**### Getting Started



```[The Only Video You Need to Get Started with Neovim](https://youtu.be/m8C0Cq9Uv9o)

postgresql://user:pass@localhost:5432/mydb

mysql://user:pass@localhost:3306/mydb**Additional Resources:**

sqlite:./dev.db- Press `<Space>` and wait to see all available commands (which-key)

```- Use `:Telescope keymaps` to search keybindings

- Check `:help` for Neovim documentation

The database UI shows:- Read inline comments in `init.lua`

- All tables and schemas

- Saved queries### FAQ

- Query results with formatting

* What should I do if I already have a pre-existing neovim configuration?

---  * You should back it up and then delete all associated files.

  * This includes your existing init.lua and the neovim files in `~/.local`

## 🧪 Testing Workflow    which can be deleted with `rm -rf ~/.local/share/nvim/`

* Can I keep my existing configuration in parallel to this config?

```  * Yes! You can use [NVIM_APPNAME](https://neovim.io/doc/user/starting.html#%24NVIM_APPNAME)`=nvim-NAME`

1. Open a test file (*.test.ts, *.spec.ts)    to maintain multiple configurations. For example, you can install this

2. <Space>tt  →  Run test under cursor    configuration in `~/.config/nvim-gabed` and create an alias:

3. <Space>ts  →  Toggle test summary panel    ```

4. <Space>td  →  Debug test with breakpoints    alias nvim-gabed='NVIM_APPNAME="nvim-gabed" nvim'

```    ```

    When you run Neovim using `nvim-gabed` alias it will use the alternative

Test adapters included:    config directory and the matching local directory

- **Jest** - `npm test`    `~/.local/share/nvim-gabed`. You can apply this approach to any Neovim

- **Vitest** - Native support    distribution that you would like to try out.

* How do I switch between AI models?

---  * Press `<Space>am` in normal mode to see available models

  * All AI features use GitHub Copilot by default

## 🐛 Debugging Workflow  * You need an active Copilot subscription

* Where can I add my own plugins?

```  * Add them to `lua/custom/plugins/` directory

1. Open your TypeScript/JavaScript file  * Each file should return a table of plugin specs

2. <Space>db  →  Set breakpoint on current line  * They will be automatically loaded

3. <Space>dc  →  Start debugging* What if I want to "uninstall" this configuration:

4. F10        →  Step over  * See [lazy.nvim uninstall](https://github.com/folke/lazy.nvim#-uninstalling) information

5. F11        →  Step into* Why is the main `init.lua` a single file? Wouldn't it make sense to split it into multiple files?

6. F5         →  Continue  * This configuration is based on kickstart.nvim, which serves as a teaching tool and reference

```    configuration. The main purpose is to provide a readable foundation that someone can easily

    understand and modify. As you progress in learning Neovim and Lua, you might consider splitting 

The debug UI shows:    `init.lua` into smaller parts. A fork of kickstart that does this while maintaining the 

- Variables and their values    same functionality is available here:

- Call stack    * [kickstart-modular.nvim](https://github.com/dam9000/kickstart-modular.nvim)

- Breakpoints list  * This configuration includes additional plugins in `lua/custom/plugins/` for better organization.

- REPL for evaluating expressions

### Install Recipes

---

Below you can find OS specific install instructions for Neovim and dependencies.

## 🌐 API Testing (Bruno/HTTP)

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
