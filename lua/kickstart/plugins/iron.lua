-- iron.nvim - Interactive REPL over Neovim
-- https://github.com/Vigemus/iron.nvim

return {
  'Vigemus/iron.nvim',
  keys = {
    { '<leader>mcr', '<cmd>IronRepl<cr>', desc = '[M]arkdown/[C]ode: Start REPL (Jupyter)' },
    { '<leader>mcq', '<cmd>IronExit<cr>', desc = '[M]arkdown/[C]ode: Quit REPL' },
    { '<leader>mcl', '<cmd>IronSendLine<cr>', desc = '[M]arkdown/[C]ode: Send current line to REPL' },
    { '<leader>mcp', '<cmd>IronSendParagraph<cr>', desc = '[M]arkdown/[C]ode: Send paragraph to REPL' },
    { '<leader>mcf', '<cmd>IronSendFile<cr>', desc = '[M]arkdown/[C]ode: Send entire file to REPL' },
    { '<leader>mcx', '<cmd>IronClear<cr>', desc = '[M]arkdown/[C]ode: Clear REPL output' },
    { '<leader>mcs', '<cmd>IronVisualSend<cr>', desc = '[M]arkdown/[C]ode: Send selection to REPL', mode = 'v' },
  },
  config = function()
    require('iron.core').setup {
      config = {
        scratch_repl = true,
        repl_definition = {
          python = { command = { 'jupyter', 'console', '--simple-prompt' } },
        },
        repl_open_cmd = 'vsplit',
      },
      keymaps = {},
      highlight = { italic = true },
      ignore_blank_lines = true,
    }
  end,
}
