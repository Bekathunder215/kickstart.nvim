-- Colorscheme manager with persistence and quick switching.

local M = {}

M.themes = {
  'tokyonight',
  'catppuccin',
  'gruvbox',
  'rose-pine',
  'kanagawa',
  'nightfox',
  'duskfox',
  'nordfox',
  'terafox',
  'onedark',
  'everforest',
}

local state_file = vim.fn.stdpath 'state' .. '/last_colorscheme.txt'

local function write_theme(name)
  vim.fn.mkdir(vim.fn.stdpath 'state', 'p')
  vim.fn.writefile({ name }, state_file)
end

local function read_theme()
  if vim.fn.filereadable(state_file) ~= 1 then
    return nil
  end

  local lines = vim.fn.readfile(state_file)
  if #lines == 0 or lines[1] == '' then
    return nil
  end

  return lines[1]
end

local function index_of(theme)
  for i, name in ipairs(M.themes) do
    if name == theme then
      return i
    end
  end
  return nil
end

function M.apply(theme, persist)
  local ok, err = pcall(vim.cmd.colorscheme, theme)
  if not ok then
    vim.notify('Failed to load colorscheme: ' .. theme .. '\n' .. tostring(err), vim.log.levels.WARN)
    return false
  end

  if persist then
    write_theme(theme)
  end

  vim.notify('Colorscheme: ' .. theme, vim.log.levels.INFO)
  return true
end

function M.next_theme()
  local current = vim.g.colors_name or 'gruvbox'
  local idx = index_of(current) or 0
  local next_idx = idx + 1
  if next_idx > #M.themes then
    next_idx = 1
  end
  M.apply(M.themes[next_idx], true)
end

function M.prev_theme()
  local current = vim.g.colors_name or 'gruvbox'
  local idx = index_of(current) or 1
  local prev_idx = idx - 1
  if prev_idx < 1 then
    prev_idx = #M.themes
  end
  M.apply(M.themes[prev_idx], true)
end

function M.pick_theme()
  local ok_builtin, builtin = pcall(require, 'telescope.builtin')
  if ok_builtin then
    local actions = require 'telescope.actions'
    local action_state = require 'telescope.actions.state'

    builtin.colorscheme {
      prompt_title = 'Choose colorscheme',
      enable_preview = true,
      attach_mappings = function(prompt_bufnr)
        actions.select_default:replace(function()
          local selection = action_state.get_selected_entry()
          actions.close(prompt_bufnr)

          local chosen = nil
          if selection then
            chosen = selection.value or selection[1]
          end

          if chosen and chosen ~= '' then
            M.apply(chosen, true)
          end
        end)
        return true
      end,
    }
    return
  end

  vim.ui.select(M.themes, { prompt = 'Choose colorscheme:' }, function(choice)
    if choice then
      M.apply(choice, true)
    end
  end)
end

function M.setup()
  vim.api.nvim_create_user_command('Theme', function(opts)
    if opts.args == '' then
      M.pick_theme()
      return
    end
    M.apply(opts.args, true)
  end, {
    nargs = '?',
    complete = function()
      return M.themes
    end,
    desc = 'Set colorscheme',
  })

  vim.api.nvim_create_user_command('ThemeNext', function()
    M.next_theme()
  end, { desc = 'Switch to next colorscheme' })

  vim.api.nvim_create_user_command('ThemePrev', function()
    M.prev_theme()
  end, { desc = 'Switch to previous colorscheme' })

  vim.api.nvim_create_user_command('ThemePick', function()
    M.pick_theme()
  end, { desc = 'Pick colorscheme from list' })

  local saved = read_theme() or 'gruvbox'
  M.apply(saved, false)
end

return M
