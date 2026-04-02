---@module 'lazy'
---@type LazySpec
return {
  'folke/which-key.nvim',
  opts = function(_, opts)
    opts.spec = opts.spec or {}
    local additions = {
      { '<leader>a', group = '+ai', mode = { 'n', 'x' } },
      { '<leader>c', group = '[C]ode', mode = { 'n', 'x' } },
      { '<leader>d', group = '[D]ocument' },
      { '<leader>r', group = '[R]ename' },
      { '<leader>w', group = '[W]orkspace' },
    }

    for _, mapping in ipairs(additions) do
      table.insert(opts.spec, mapping)
    end
  end,
}
