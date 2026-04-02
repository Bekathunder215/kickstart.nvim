-- This file documents the custom plugin lane.
--
-- The plugin list is loaded via:
--   { import = 'custom.plugins' }
-- in init.lua. Each file in this directory should return a Lazy spec.

---@module 'lazy'
---@type LazySpec

-- To add new custom plugins:
-- 1. Create a new file in lua/custom/plugins/ (e.g., myplugin.lua)
-- 2. Return a plugin spec table from that file
-- 3. Restart Neovim or run :Lazy sync
--
-- Example plugin spec:
-- return {
--   'author/plugin-name',
--   config = function()
--     require('plugin-name').setup {}
--   end,
-- }

return {}
