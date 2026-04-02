-- User Python helpers and commands.

local M = {}

local function activate_venv_or_create()
  local venv_dir = vim.fn.finddir('.venv', '.;')

  if venv_dir ~= '' then
    local venv_path = vim.fn.fnamemodify(venv_dir, ':p')
    vim.env.VIRTUAL_ENV = venv_path
    vim.notify('Virtual environment activated: ' .. venv_path, vim.log.levels.INFO)
    return true
  end

  vim.notify('No virtual environment found. Creating one in the current directory...', vim.log.levels.WARN)
  vim.fn.system 'python3 -m venv .venv'

  if vim.v.shell_error == 0 then
    local new_venv_path = vim.fn.getcwd() .. '/.venv'
    vim.env.VIRTUAL_ENV = new_venv_path
    vim.notify('Virtual environment created and activated: ' .. new_venv_path, vim.log.levels.INFO)
    return true
  end

  vim.notify('Failed to create virtual environment', vim.log.levels.ERROR)
  return false
end

local function run_python()
  local file = vim.fn.expand '%:p'
  local venv = vim.fn.finddir('.venv', '.;')

  vim.cmd 'w'

  if venv ~= '' then
    local python = vim.fn.fnamemodify(venv, ':p') .. 'bin/python'
    vim.cmd('!' .. python .. ' ' .. vim.fn.shellescape(file))
  else
    vim.cmd('!python3 ' .. vim.fn.shellescape(file))
  end
end

function M.setup()
  local venv_python = vim.fn.getcwd() .. '/.venv/bin/python'
  if vim.fn.executable(venv_python) == 1 then
    vim.g.python3_host_prog = venv_python
  end

  vim.api.nvim_create_user_command('RunPython', function()
    run_python()
  end, {})

  vim.keymap.set('n', '<leader>p', ':RunPython<CR>', { desc = '[P]ython: Run file with venv' })
  vim.keymap.set('n', '<leader>v', function()
    activate_venv_or_create()
  end, { desc = '[V]irtual environment: Activate or create' })
end

return M
