-- User plugin: LaTeX editing support
---@module 'lazy'
---@type LazySpec
return {
  'lervag/vimtex',
  lazy = false,
  ft = { 'tex', 'latex' },
  init = function()
    vim.g.vimtex_view_method = 'skim'
    vim.g.vimtex_compiler_method = 'latexmk'
  end,
}
