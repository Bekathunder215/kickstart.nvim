-- vimtex - LaTeX support for Vim/Neovim
-- https://github.com/lervag/vimtex

return {
  'lervag/vimtex',
  lazy = false, -- Load immediately for LaTeX files
  ft = { 'tex', 'latex' },
  init = function()
    -- VimTeX configuration
    vim.g.vimtex_view_method = 'skim' -- macOS PDF viewer
    vim.g.vimtex_compiler_method = 'latexmk'
    -- Optional: Enable folding
    -- vim.g.vimtex_fold_enabled = 1
  end,
}
