-- User keymaps outside plugin specs.

local M = {}

function M.setup()
  -- Quickfix navigation
  vim.keymap.set('n', '<leader>qo', '<cmd>cfdo edit<CR>', { desc = '[Q]uickfix: [O]pen all entries in tabs' })
  vim.keymap.set('n', '[q', '<cmd>cprev<CR>', { desc = '[Q]uickfix: [P]revious item' })
  vim.keymap.set('n', ']q', '<cmd>cnext<CR>', { desc = '[Q]uickfix: [N]ext item' })
  vim.keymap.set('n', '<leader>qq', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

  -- Keep hjkl muscle memory in focus.
  vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
  vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
  vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
  vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

  -- Markdown and notebook helpers
  vim.keymap.set('n', '<leader>mt', function()
    local buf_ft = vim.bo.filetype
    if buf_ft ~= 'markdown' then
      vim.notify('Not a markdown file', vim.log.levels.WARN)
      return
    end
    vim.cmd 'TSBufToggle highlight'
    vim.notify('Toggled Treesitter highlighting', vim.log.levels.INFO)
  end, { desc = '[M]arkdown: [T]oggle Treesitter highlighting' })

  vim.keymap.set('n', '<leader>mi', ':!jupytext --sync %<CR>', { desc = '[M]arkdown: Sync .ipynb ↔ .md' })
  vim.keymap.set('n', '<leader>me', ':!jupyter nbconvert --execute --to markdown %:r.ipynb<CR>', { desc = '[M]arkdown: [E]xecute notebook → .md' })

  -- Theme switching
  vim.keymap.set('n', '<leader>tn', function()
    require('custom.colorscheme').next_theme()
  end, { desc = '[T]heme: [N]ext' })
  vim.keymap.set('n', '<leader>tp', function()
    require('custom.colorscheme').prev_theme()
  end, { desc = '[T]heme: [P]revious' })
  vim.keymap.set('n', '<leader>tc', function()
    require('custom.colorscheme').pick_theme()
  end, { desc = '[T]heme: [C]hoose' })
end

return M
