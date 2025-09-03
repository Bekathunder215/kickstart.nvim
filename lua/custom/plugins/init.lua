-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
  "Vigemus/iron.nvim",
  config = function()
local iron = require("iron.core")

iron.setup {
  config = {
    scratch_repl = true,
    repl_definition = {
      python = {
        command = { "jupyter", "console", "--simple-prompt" },
      },
    },
    repl_open_cmd = "vsplit",
  },
  keymaps = {}, -- disable default keymaps
  highlight = { italic = true },
  ignore_blank_lines = true,
}

-- Custom keymaps under <leader>mc
local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<leader>mcr", "<cmd>IronRepl<cr>", { desc = "[C]ode: Start REPL" })
vim.keymap.set("n", "<leader>mcq", "<cmd>IronExit<cr>", { desc = "[C]ode: Quit REPL" })
vim.keymap.set("n", "<leader>mcl", "<cmd>IronSendLine<cr>", { desc = "[C]ode: Send Line" })
vim.keymap.set("n", "<leader>mcp", "<cmd>IronSendParagraph<cr>", { desc = "[C]ode: Send Paragraph" })
vim.keymap.set("n", "<leader>mcf", "<cmd>IronSendFile<cr>", { desc = "[C]ode: Send File" })
vim.keymap.set("n", "<leader>mcx", "<cmd>IronClear<cr>", { desc = "[C]ode: Clear REPL" })

-- Visual mode mapping for sending selection
vim.keymap.set("v", "<leader>mcs", "<cmd>IronVisualSend<cr>", { desc = "[C]ode: Send Selection" })
  end,
},
  {'ekickx/clipboard-image.nvim'},
  { 'iamcco/markdown-preview.nvim', build = 'cd app && npm install' },
  {
    'kdheepak/lazygit.nvim',
    lazy = true,

    cmd = {
      'LazyGit',
      'LazyGitConfig',
      'LazyGitCurrentFile',
      'LazyGitFilter',
      'LazyGitFilterCurrentFile',
    },
    -- optional for floating window border decoration
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
      { '<leader>lg', '<cmd>LazyGit<cr>', desc = 'LazyGit' },
    },
  },
  {
    'lervag/vimtex',
    lazy = false, -- we don't want to lazy load VimTeX
    -- tag = "v2.15", -- uncomment to pin to a specific release
    init = function()
      -- VimTeX configuration goes here, e.g.
      vim.g.vimtex_view_method = 'skim'
      vim.g.vimtex_compiler_method = 'latexmk'
    end,
  },
 -- {
 --   'github/copilot.vim',
 --   config = function() end,
 -- },
  {
    'stevearc/dressing.nvim',
    event = 'VeryLazy',
  },
  {
    'nvimtools/none-ls.nvim',
    dependencies = {
      'nvimtools/none-ls-extras.nvim',
      'jayp0521/mason-null-ls.nvim', -- ensure dependencies are installed
    },
    config = function()
      local null_ls = require 'null-ls'
      local formatting = null_ls.builtins.formatting -- to setup formatters
      local diagnostics = null_ls.builtins.diagnostics -- to setup linters

      -- list of formatters & linters for mason to install
      require('mason-null-ls').setup {
        ensure_installed = {
          'checkmake',
          'prettier', -- ts/js formatter
          'stylua', -- lua formatter
          'eslint_d', -- ts/js linter
          'shfmt',
          'ruff',
          'latexindent',
          'ltex-plus',
        },
        -- auto-install configured formatters & linters (with null-ls)
        automatic_installation = true,
      }

      local sources = {
        diagnostics.checkmake,
        --formatting.eslint_d.with {
        --diagnostics.chktex,

        -- linter
        --formatting.latexindent.with {
        --  filetypes = { 'tex', 'latex' },
        --  extra_args = { '-m' }, -- optional: preserve indentation, tweak as needed
        --},

        formatting.prettier.with {

          filetypes = { 'html', 'json', 'yaml', 'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'vue', 'css' },
          extra_args = {
            '--tab-width',
            '4',
            '--use-tabs',
            'false',
            '--single-quote',
            'true',
            '--trailing-comma',
            'all',
            '--bracket-spacing',
            'true',
            '--print-width',
            '160',
            '--arrow-parens',
            'always',
          },
        },

        --formatting.stylua,
        --formatting.stylua.with { extra_args = { '--indent-type', 'Spaces', '--indent-width', '2' } },
        formatting.shfmt.with { args = { '-i', '4', '-ci', '-bn', '-sr' } },
        formatting.terraform_fmt,
        require('none-ls.formatting.ruff').with { extra_args = { '--extend-select', 'I' } },
        require 'none-ls.formatting.ruff_format',
      }

      local augroup = vim.api.nvim_create_augroup('LspFormatting', {})
      null_ls.setup {
        -- debug = true, -- Enable debug mode. Inspect logs with :NullLsLog.
        sources = sources,
        -- you can reuse a shared lspconfig on_attach callback here
        on_attach = function(client, bufnr)
          -- Ensure proper positionEncoding is set
          client.offset_encoding = 'utf-16'
          if client.supports_method 'textDocument/formatting' then
            vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
            vim.api.nvim_create_autocmd('BufWritePre', {
              group = augroup,
              buffer = bufnr,
              callback = function()
                vim.lsp.buf.format {
                  async = false,
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
  },
}
