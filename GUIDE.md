# Neovim Configuration Guide

Complete reference for all keybindings, plugins, and workflows in your Neovim setup.

---

## 📑 Table of Contents

- [Leader Keys](#leader-keys)
- [General Navigation](#general-navigation)
- [File Navigation](#file-navigation)
- [LSP (Language Server)](#lsp-language-server)
- [Code Editing](#code-editing)
- [Git Operations](#git-operations)
- [Python Development](#python-development)
- [Markdown & Jupyter](#markdown--jupyter)
- [LaTeX](#latex)
- [Telescope (Fuzzy Finder)](#telescope-fuzzy-finder)
- [Debugging](#debugging)
- [Quickfix & Diagnostics](#quickfix--diagnostics)
- [Plugin Management](#plugin-management)

---

## Leader Keys

**Leader**: `<Space>`
**Local Leader**: `<Space>`

---

## 🧭 General Navigation

### Window Management

| Keybinding | Action               | Mode   |
| ---------- | -------------------- | ------ |
| `<C-h>`    | Move to left window  | Normal |
| `<C-l>`    | Move to right window | Normal |
| `<C-j>`    | Move to lower window | Normal |
| `<C-k>`    | Move to upper window | Normal |

### Terminal

| Keybinding   | Action             | Mode     |
| ------------ | ------------------ | -------- |
| `<Esc><Esc>` | Exit terminal mode | Terminal |

### Search

| Keybinding | Action                  | Mode   |
| ---------- | ----------------------- | ------ |
| `<Esc>`    | Clear search highlights | Normal |

---

## 📂 File Navigation

### Neo-tree (File Explorer)

| Keybinding        | Action          | Mode   |
| ----------------- | --------------- | ------ |
| `\`               | Toggle Neo-tree | Normal |
| `\` (in Neo-tree) | Close Neo-tree  | Normal |

**Neo-tree Commands**:

```vim
:Neotree          " Open file tree
:Neotree reveal   " Reveal current file in tree
:Neotree focus    " Focus on file tree
```

---

## 🔧 LSP (Language Server)

### Navigation

| Keybinding  | Action              | Description                          |
| ----------- | ------------------- | ------------------------------------ |
| `gd`        | Goto Definition     | Jump to where symbol is defined      |
| `gr`        | Goto References     | Show all references                  |
| `gI`        | Goto Implementation | Jump to implementation               |
| `gD`        | Goto Declaration    | Jump to declaration (e.g., C header) |
| `<leader>D` | Type Definition     | Show type definition                 |

### Symbols

| Keybinding   | Action            | Description                 |
| ------------ | ----------------- | --------------------------- |
| `<leader>ds` | Document Symbols  | List all symbols in file    |
| `<leader>ws` | Workspace Symbols | Search symbols in workspace |

### Code Actions

| Keybinding   | Action      | Description                 |
| ------------ | ----------- | --------------------------- |
| `<leader>rn` | Rename      | Rename symbol under cursor  |
| `<leader>ca` | Code Action | Show available code actions |

### Toggles

| Keybinding   | Action             | Description          |
| ------------ | ------------------ | -------------------- |
| `<leader>th` | Toggle Inlay Hints | Show/hide type hints |

### Diagnostics

| Keybinding   | Action             | Description          |
| ------------ | ------------------ | -------------------- |
| `<leader>qq` | Open Quickfix List | Show all diagnostics |

---

## ✏️ Code Editing

### Auto-completion (Insert Mode)

| Keybinding  | Action                   | Description                  |
| ----------- | ------------------------ | ---------------------------- |
| `<C-n>`     | Next completion          | Cycle to next item           |
| `<C-p>`     | Previous completion      | Cycle to previous item       |
| `<C-Space>` | Accept completion        | Confirm selection            |
| `<C-b>`     | Scroll docs up           | Scroll documentation         |
| `<C-f>`     | Scroll docs down         | Scroll documentation         |
| `<C-l>`     | Jump forward in snippet  | Move to next placeholder     |
| `<C-h>`     | Jump backward in snippet | Move to previous placeholder |

### Text Objects (Mini.ai)

| Keybinding | Action                 | Example                   |
| ---------- | ---------------------- | ------------------------- |
| `va)`      | Visual around parens   | Select including `()`     |
| `vi'`      | Visual inside quotes   | Select text in quotes     |
| `yinq`     | Yank inside next quote | Copy text in next `"..."` |
| `ci'`      | Change inside quotes   | Replace text in quotes    |

### Surroundings (Mini.surround)

| Keybinding | Action                  | Example              |
| ---------- | ----------------------- | -------------------- |
| `saiw)`    | Surround add inner word | Add `()` around word |
| `sd'`      | Surround delete         | Remove `'` quotes    |
| `sr)'`     | Surround replace        | Replace `)` with `'` |

### Formatting

**Automatic**: Format on save (enabled by none-ls)

**Manual**:

```vim
:lua vim.lsp.buf.format()
```

---

## 🔀 Git Operations

### Gitsigns (Built-in)

Git signs appear in the gutter (`+` for added, `~` for changed, `_` for deleted)

### LazyGit

| Keybinding   | Action       | Description          |
| ------------ | ------------ | -------------------- |
| `<leader>lg` | Open LazyGit | Full-featured git UI |

**LazyGit Features**:

- Stage/unstage files
- Commit changes
- View diffs
- Create branches
- Merge/rebase
- Push/pull

---

## 🐍 Python Development

### Running Python

| Keybinding  | Action          | Description                |
| ----------- | --------------- | -------------------------- |
| `<leader>p` | Run Python file | Execute with venv if found |

**Command**: `:RunPython`

### Virtual Environment

| Keybinding  | Action        | Description                   |
| ----------- | ------------- | ----------------------------- |
| `<leader>v` | Activate venv | Find/create `.venv` directory |

**Behavior**:

- Searches for `.venv` in current and parent directories
- Creates `.venv` if not found
- Automatically uses venv when running Python files

### REPL (iron.nvim)

| Keybinding    | Action         | Description                    |
| ------------- | -------------- | ------------------------------ |
| `<leader>mcr` | Start REPL     | Open Jupyter console           |
| `<leader>mcq` | Quit REPL      | Close REPL                     |
| `<leader>mcl` | Send line      | Execute current line           |
| `<leader>mcp` | Send paragraph | Execute paragraph              |
| `<leader>mcf` | Send file      | Execute entire file            |
| `<leader>mcx` | Clear REPL     | Clear REPL output              |
| `<leader>mcs` | Send selection | Execute selected code (Visual) |

**REPL Features**:

- Uses Jupyter console for rich output
- Opens in vertical split
- Interactive debugging
- Great for data science workflows

### Python LSP (Pyright)

- **Type checking**: Enabled (basic mode)
- **Auto imports**: Enabled
- **Virtual env detection**: Automatic

---

## 📝 Markdown & Jupyter

### Markdown Preview

| Keybinding   | Action           | Description        |
| ------------ | ---------------- | ------------------ |
| `<leader>mp` | Preview Markdown | Open in browser    |
| `<leader>mo` | Toggle Preview   | Open/close preview |

### Markdown Treesitter

| Keybinding   | Action            | Description                 |
| ------------ | ----------------- | --------------------------- |
| `<leader>mt` | Toggle Treesitter | Enable/disable highlighting |

### Jupytext Integration

| Keybinding   | Action            | Description                 |
| ------------ | ----------------- | --------------------------- |
| `<leader>mi` | Sync .ipynb ↔ .md | Synchronize notebook        |
| `<leader>me` | Execute notebook  | Run and convert to markdown |

**Manual Commands**:

```bash
# Sync notebook with markdown
jupytext --sync notebook.ipynb

# Convert notebook to Python
jupytext --to py notebook.ipynb

# Execute and convert to markdown
jupyter nbconvert --execute --to markdown notebook.ipynb
```

### Workflow: Editing Jupyter Notebooks

1. **Option A: Edit as Markdown**

   ```bash
   jupytext --to md notebook.ipynb
   nvim notebook.md
   # Press <leader>mi to sync back
   ```

2. **Option B: Edit as Python (percent format)**
   ```bash
   jupytext --to py:percent notebook.ipynb
   nvim notebook.py
   # Use REPL with <leader>mc* keybindings
   ```

---

## 📄 LaTeX

### VimTeX

**Automatic**: LaTeX support loaded for `.tex` files

**Commands**:

```vim
:VimtexCompile        " Compile document
:VimtexView           " View PDF (Skim)
:VimtexClean          " Clean aux files
:VimtexInfo           " Show status
```

**PDF Viewer**: Skim (configured for macOS)
**Compiler**: latexmk

---

## 🔍 Telescope (Fuzzy Finder)

### File Searching

| Keybinding   | Action        | Description              |
| ------------ | ------------- | ------------------------ |
| `<leader>sf` | Search Files  | Find files by name       |
| `<leader>sg` | Live Grep     | Search text in files     |
| `<leader>sw` | Search Word   | Search word under cursor |
| `<leader>s.` | Recent Files  | Recently opened files    |
| `<leader>sn` | Neovim Config | Search config files      |

### Help & Documentation

| Keybinding   | Action         | Description          |
| ------------ | -------------- | -------------------- |
| `<leader>sh` | Search Help    | Search help docs     |
| `<leader>sk` | Search Keymaps | List all keybindings |

### Buffers & UI

| Keybinding         | Action          | Description                  |
| ------------------ | --------------- | ---------------------------- |
| `<leader><leader>` | Find Buffers    | List open buffers            |
| `<leader>/`        | Search Buffer   | Fuzzy search in current file |
| `<leader>s/`       | Grep Open Files | Search in open files         |

### Advanced

| Keybinding   | Action             | Description              |
| ------------ | ------------------ | ------------------------ |
| `<leader>ss` | Select Telescope   | Browse Telescope pickers |
| `<leader>sd` | Search Diagnostics | Show all diagnostics     |
| `<leader>sr` | Resume Search      | Reopen last picker       |

**Telescope Controls** (Inside picker):

- `<C-n>` / `<C-p>`: Navigate results
- `<C-q>`: Send to quickfix list
- `<C-/>`: Show help (insert mode)
- `?`: Show help (normal mode)

---

## 🐛 Debugging

### DAP (Debug Adapter Protocol)

| Keybinding | Action            | Description                 |
| ---------- | ----------------- | --------------------------- |
| `<F5>`     | Continue/Start    | Start or continue debugging |
| `<F1>`     | Step Into         | Step into function          |
| `<F2>`     | Step Over         | Step over line              |
| `<F3>`     | Step Out          | Step out of function        |
| `<F7>`     | Toggle Breakpoint | Add/remove breakpoint       |

**Commands**:

```vim
:DapContinue         " Start debugging
:DapToggleBreakpoint " Toggle breakpoint
:DapTerminate        " Stop debugging
```

---

## 🔧 Quickfix & Diagnostics

### Quickfix List

| Keybinding   | Action   | Description               |
| ------------ | -------- | ------------------------- |
| `<leader>qo` | Open All | Open all quickfix entries |
| `[q`         | Previous | Previous quickfix item    |
| `]q`         | Next     | Next quickfix item        |

### Diagnostics Navigation

Use Telescope: `<leader>sd` to search diagnostics

---

## 📦 Plugin Management

### Lazy.nvim

**Commands**:

```vim
:Lazy               " Open Lazy UI
:Lazy sync          " Update all plugins
:Lazy update        " Update plugins (keep lockfile)
:Lazy clean         " Remove unused plugins
:Lazy check         " Check for updates
:Lazy profile       " Show startup profile
:Lazy restore       " Restore from lockfile
```

**Lazy UI Keybindings** (inside `:Lazy`):

- `?`: Show help
- `u`: Update plugin
- `U`: Update all
- `c`: Check for updates
- `C`: Clean unused plugins
- `x`: Clear finished tasks
- `l`: Show log

### Mason (LSP/Tool Installer)

**Commands**:

```vim
:Mason              " Open Mason UI
:MasonUpdate        " Update Mason registry
:MasonInstall <name> " Install tool
:MasonUninstall <name> " Uninstall tool
```

**Installed Tools**:

- **LSPs**: pyright, lua_ls, ts_ls
- **Formatters**: prettier, stylua, ruff, shfmt
- **Linters**: eslint_d, ruff

---

## 🔑 Keyboard Navigation Groups

### Leader Key Groups

| Prefix       | Category       | Description                   |
| ------------ | -------------- | ----------------------------- |
| `<leader>c`  | Code           | Code actions, refactoring     |
| `<leader>d`  | Document       | Document symbols, diagnostics |
| `<leader>r`  | Rename         | Symbol renaming               |
| `<leader>s`  | Search         | Telescope searching           |
| `<leader>w`  | Workspace      | Workspace operations          |
| `<leader>t`  | Toggle         | Toggle features               |
| `<leader>h`  | Git Hunk       | Git operations                |
| `<leader>m`  | Markdown/Media | Markdown & Jupyter            |
| `<leader>mc` | Code REPL      | REPL operations               |
| `<leader>p`  | Python         | Run Python                    |
| `<leader>v`  | Venv           | Virtual environment           |
| `<leader>q`  | Quickfix       | Quickfix list                 |
| `<leader>lg` | LazyGit        | Git UI                        |

---

## 🛠️ Common Workflows

### Python Data Science

1. **Start Project**:

   ```bash
   cd my-project
   python3 -m venv .venv
   nvim main.py
   ```

2. **Activate venv**: `<leader>v`

3. **Start REPL**: `<leader>mcr`

4. **Send code to REPL**:

   - Current line: `<leader>mcl`
   - Selection: `<leader>mcs` (visual mode)
   - Entire file: `<leader>mcf`

5. **Run script**: `<leader>p`

### Markdown Document

1. **Open markdown file**: `nvim document.md`

2. **Start preview**: `<leader>mp`

3. **Edit and save** (auto-formats with prettier)

4. **Toggle Treesitter** (if syntax highlighting issues): `<leader>mt`

### Git Workflow

1. **Make changes** to files

2. **Open LazyGit**: `<leader>lg`

3. **In LazyGit**:

   - `space`: Stage file
   - `c`: Commit
   - `P`: Push

4. **Exit**: `q`

### Finding Code

1. **Search files**: `<leader>sf`

2. **Search content**: `<leader>sg`

3. **Search word under cursor**: `<leader>sw`

4. **Browse recent files**: `<leader>s.`

5. **Search keybindings**: `<leader>sk`

---

## 🎨 Colorscheme

**Current**: Gruvbox (dark mode)

**Change colorscheme**:

```vim
:colorscheme tokyonight
:colorscheme catppuccin
```

---

## 🚀 Performance Tips

1. **Lazy Loading**: Most plugins load only when needed
2. **Startup Time**: Check with `:Lazy profile`
3. **LSP Performance**: Diagnostics only for open files
4. **Treesitter**: Incremental parsing enabled

---

## 📚 Learning Resources

### Built-in Help

```vim
:help                " General help
:Tutor               " Interactive tutorial
:help lua-guide      " Lua scripting guide
:help lsp            " LSP documentation
:help telescope      " Telescope help
```

### Quick Reference

- Press `<leader>sk` to search all keymaps
- Press `?` in Lazy.nvim or Mason to see commands
- Use `:checkhealth` to verify setup

---

## 🔧 Customization

### Adding Your Own Keybindings

Edit `init.lua` and add:

```lua
vim.keymap.set('n', '<leader>x', '<cmd>YourCommand<CR>', { desc = 'Your description' })
```

### Adding Plugins

1. Create file: `lua/kickstart/plugins/myplugin.lua`
2. Add plugin spec:
   ```lua
   return {
     'author/plugin-name',
     config = function()
       require('plugin-name').setup {}
     end,
   }
   ```
3. Add to `init.lua`: `require 'kickstart.plugins.myplugin',`

### Plugin Locations

- **Kickstart plugins**: `~/.config/nvim/lua/kickstart/plugins/`
- **Custom plugins**: `~/.config/nvim/lua/custom/plugins/`
- **Main config**: `~/.config/nvim/init.lua`

---

## 🆘 Troubleshooting

### Common Issues

**LSP not working**:

```vim
:LspInfo            " Check LSP status
:Mason              " Install missing LSP
```

**Formatting not working**:

```vim
:lua vim.lsp.buf.format()  " Manual format
:NullLsInfo                 " Check null-ls status
```

**Python venv not detected**:

```vim
:lua print(vim.env.VIRTUAL_ENV)  " Check venv
<leader>v                         " Manually activate
```

**Slow startup**:

```vim
:Lazy profile       " Check plugin load times
```

---

## 📋 Quick Reference Card

### Most Used Keybindings

```
FILES:              SEARCH:            CODE:
\       NeoTree     <leader>sf Files   gd      Goto Def
<leader>sf Files    <leader>sg Grep    gr      References
<leader><leader>Buf <leader>sh Help    <leader>rn Rename
                                        <leader>ca Action

GIT:                PYTHON:            MISC:
<leader>lg LazyGit  <leader>p  Run     <Esc>   Clear hl
                    <leader>v  Venv    <C-h/j/k/l> Nav
                    <leader>mcr REPL   <leader>qq  Qfix
```

---

**Last Updated**: January 10, 2026
**Neovim Version**: 0.10+
**Configuration**: Kickstart.nvim based
