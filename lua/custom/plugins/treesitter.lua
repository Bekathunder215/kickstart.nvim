---@module 'lazy'
---@type LazySpec
return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = ':TSUpdate',
  branch = 'main',
  config = function()
    local ts_runtime = vim.fn.stdpath 'data' .. '/lazy/nvim-treesitter/runtime'
    if vim.uv.fs_stat(ts_runtime) and not vim.tbl_contains(vim.opt.rtp:get(), ts_runtime) then
      vim.opt.rtp:append(ts_runtime)
    end

    local parsers = {
      'bash',
      'c',
      'diff',
      'html',
      'lua',
      'luadoc',
      'markdown',
      'markdown_inline',
      'python',
      'javascript',
      'typescript',
      'query',
      'vim',
      'vimdoc',
    }
    require('nvim-treesitter').install(parsers)

    ---@param buf integer
    ---@param language string
    local function treesitter_try_attach(buf, language)
      local ok_add = pcall(vim.treesitter.language.add, language)
      if not ok_add then
        return
      end
      local ok_start = pcall(vim.treesitter.start, buf, language)
      if not ok_start then
        return
      end
      vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      return true
    end

    local available_parsers = require('nvim-treesitter').get_available()
    local available_map = {}
    for _, lang in ipairs(available_parsers) do
      available_map[lang] = true
    end

    local function maybe_attach(args)
      local buf, filetype = args.buf, args.match
      if not vim.api.nvim_buf_is_valid(buf) then
        return
      end
      if vim.b[buf].custom_ts_attached then
        return
      end

      local language = vim.treesitter.language.get_lang(filetype)
      if not language then
        return
      end

      if treesitter_try_attach(buf, language) then
        vim.b[buf].custom_ts_attached = true
        return
      end

      if available_map[language] then
        require('nvim-treesitter').install(language):await(function()
          if vim.api.nvim_buf_is_valid(buf) and treesitter_try_attach(buf, language) then
            vim.b[buf].custom_ts_attached = true
          end
        end)
      end
    end

    vim.api.nvim_create_autocmd({ 'FileType', 'BufEnter' }, {
      callback = maybe_attach,
    })

    local current_buf = vim.api.nvim_get_current_buf()
    local current_ft = vim.bo[current_buf].filetype
    if current_ft ~= '' then
      maybe_attach { buf = current_buf, match = current_ft }
    end
  end,
}
