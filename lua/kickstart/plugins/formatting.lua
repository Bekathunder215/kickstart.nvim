-- none-ls.nvim (null-ls) - Code formatting and diagnostics
-- https://github.com/nvimtools/none-ls.nvim

return {
  'nvimtools/none-ls.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = {
    'nvimtools/none-ls-extras.nvim',
    'jayp0521/mason-null-ls.nvim',
  },
  config = function()
    local null_ls = require 'null-ls'
    local formatting = null_ls.builtins.formatting
    local diagnostics = null_ls.builtins.diagnostics

    require('mason-null-ls').setup {
      ensure_installed = {
        'prettier',
        'stylua',
        'eslint_d',
        'shfmt',
        'ruff',
      },
      automatic_installation = true,
    }

    local sources = {
      diagnostics.checkmake,
      formatting.prettier.with {
        filetypes = { 'html', 'json', 'yaml', 'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'vue', 'css', 'markdown' },
        extra_args = { '--prose-wrap', 'always', '--print-width', '100' },
      },
      formatting.stylua.with {
        extra_args = { '--indent-type', 'Spaces', '--indent-width', '2' },
      },
      formatting.shfmt.with {
        args = { '-i', '2', '-ci', '-bn' },
      },
      require('none-ls.formatting.ruff').with {
        extra_args = { '--select', 'I,E,W,F' },
      },
      require 'none-ls.formatting.ruff_format',
    }

    local augroup = vim.api.nvim_create_augroup('LspFormatting', {})
    null_ls.setup {
      sources = sources,
      on_attach = function(client, bufnr)
        if client.supports_method 'textDocument/formatting' then
          vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
          vim.api.nvim_create_autocmd('BufWritePre', {
            group = augroup,
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format {
                async = false,
                timeout_ms = 10000,
                filter = function(c)
                  return c.name == 'null-ls'
                end,
              }
            end,
          })
        end
      end,
    }
  end,
}
