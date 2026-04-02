---@module 'lazy'
---@type LazySpec
return {
  'stevearc/oil.nvim',
  cmd = 'Oil',
  dependencies = {
    { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
  },
  keys = {
    { '-', '<cmd>Oil --float<CR>', desc = 'Open Parent Directory in Oil' },
  },
  opts = {
    default_file_explorer = false,
  },
}
