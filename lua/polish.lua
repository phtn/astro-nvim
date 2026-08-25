-- Runs after plugin setup for tweaks that do not belong in a dedicated module.
-- Keep this file minimal; prefer `lua/config/` or `lua/plugins/` when possible.

vim.filetype.add {
  extension = {
    btsx = "beast",
  },
}

return {}
