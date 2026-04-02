-- Markdown and Jupyter tools
-- markdown-preview.nvim: Preview markdown files in browser
-- clipboard-image.nvim: Paste images into markdown

return {
  {
    'iamcco/markdown-preview.nvim',
    build = 'cd app && npm install',
    ft = 'markdown',
    keys = {
      { '<leader>mp', '<cmd>MarkdownPreview<CR>', desc = '[M]arkdown: [P]review in browser', ft = 'markdown' },
      { '<leader>mo', '<cmd>MarkdownPreviewToggle<CR>', desc = '[M]arkdown: [O]pen/Close preview toggle', ft = 'markdown' },
    },
  },
  {
    'ekickx/clipboard-image.nvim',
    lazy = true,
    ft = 'markdown',
  },
}
