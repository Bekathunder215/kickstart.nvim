-- User plugins: Markdown preview and image pasting
---@module 'lazy'
---@type LazySpec
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
