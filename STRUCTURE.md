# Configuration Structure

This document explains the new organization of your Neovim configuration.

## 📁 Directory Structure

```
~/.config/nvim/
├── init.lua                    # Main configuration entry point
├── GUIDE.md                    # Complete keybindings & usage guide
├── OPTIMIZATIONS.md            # Performance optimizations applied
├── lazy-lock.json              # Plugin version lockfile
├── lua/
│   ├── kickstart/
│   │   ├── health.lua          # Health check functions
│   │   └── plugins/            # Plugin configurations
│   │       ├── autopairs.lua   # Auto-closing brackets
│   │       ├── debug.lua       # DAP debugging
│   │       ├── formatting.lua  # none-ls formatters & linters
│   │       ├── gitsigns.lua    # Git signs in gutter
│   │       ├── indent_line.lua # Indent guides
│   │       ├── iron.lua        # Python REPL
│   │       ├── lazygit.lua     # Git UI
│   │       ├── lint.lua        # Additional linters
│   │       ├── markdown.lua    # Markdown preview & Jupyter
│   │       ├── neo-tree.lua    # File explorer
│   │       ├── ui.lua          # UI enhancements (dressing.nvim)
│   │       └── vimtex.lua      # LaTeX support
│   └── custom/
│       └── plugins/
│           └── init.lua        # Empty (for your future plugins)
```

## 🔧 What Changed

### Before Reorganization

All custom plugins were in `lua/custom/plugins/init.lua` (200+ lines)

### After Reorganization

Each plugin has its own file in `lua/kickstart/plugins/`:

- **iron.lua** - Python REPL functionality
- **markdown.lua** - Markdown preview & clipboard-image
- **lazygit.lua** - Git UI integration
- **vimtex.lua** - LaTeX editing
- **formatting.lua** - All formatters and linters
- **ui.lua** - UI enhancement plugins

## 📝 Files Created

### Plugin Files

1. `lua/kickstart/plugins/iron.lua` - REPL configuration
2. `lua/kickstart/plugins/markdown.lua` - Markdown tools
3. `lua/kickstart/plugins/lazygit.lua` - Git UI
4. `lua/kickstart/plugins/vimtex.lua` - LaTeX support
5. `lua/kickstart/plugins/formatting.lua` - Formatters/linters
6. `lua/kickstart/plugins/ui.lua` - UI enhancements

### Documentation

7. `GUIDE.md` - Complete keybindings and usage guide

## 🎯 Benefits

### Better Organization

- Each plugin has its own file
- Easy to find and modify configurations
- Clear separation of concerns

### Easier Maintenance

- Update one plugin without touching others
- Comment out a single `require` to disable a plugin
- Add new plugins by creating new files

### Better Performance

- Each plugin properly lazy-loaded
- Dependencies clearly defined
- Load times optimized

## 🚀 How to Use

### Enabling/Disabling Plugins

Edit `init.lua` and comment out the plugin you don't want:

```lua
require 'kickstart.plugins.iron',      -- Keep this
-- require 'kickstart.plugins.vimtex',  -- Disable LaTeX
```

### Adding New Plugins

1. Create a new file: `lua/kickstart/plugins/myplugin.lua`
2. Add your plugin spec:
   ```lua
   return {
     'author/plugin-name',
     config = function()
       require('plugin-name').setup {}
     end,
   }
   ```
3. Add to init.lua: `require 'kickstart.plugins.myplugin',`
4. Restart Neovim or `:Lazy sync`

### Modifying Plugin Settings

1. Find the plugin file (e.g., `lua/kickstart/plugins/iron.lua`)
2. Edit the configuration
3. Reload: `:source %` or restart Neovim

## 📚 Documentation

- **GUIDE.md** - Complete keybindings reference
- **OPTIMIZATIONS.md** - Performance improvements applied
- **init.lua** - Main config with inline comments

## 🔍 Quick Reference

### Find Plugin Config

```bash
# Plugin location
ls ~/.config/nvim/lua/kickstart/plugins/

# View specific plugin
nvim ~/.config/nvim/lua/kickstart/plugins/iron.lua
```

### Check Plugin Status

```vim
:Lazy               " See all plugins
:Mason              " See LSP servers & tools
:checkhealth        " Verify setup
```

### Search Keybindings

Press `<leader>sk` in Neovim to search all keybindings!

## 🆘 Troubleshooting

**Plugin not loading?**

1. Check if it's required in `init.lua`
2. Run `:Lazy sync` to update plugins
3. Check `:Lazy` UI for errors

**Configuration not applying?**

1. Save the file
2. Run `:source %` or restart Neovim
3. Check for Lua syntax errors with `:messages`

**Want to add custom plugins?**
Use `lua/custom/plugins/init.lua` - it's reserved for your personal plugins and won't conflict with updates.

---

**Configuration Structure**: Modular
**Plugin Manager**: lazy.nvim
**Total Plugins**: 25+
**Organization**: By functionality
