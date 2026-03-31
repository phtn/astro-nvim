-- AstroCommunity: import any community modules here.
-- This file is imported from `lua/config/setup.lua` before the `plugins/` folder.

---@type LazySpec
return {
    "AstroNvim/astrocommunity",
    { import = "astrocommunity.colorscheme.rose-pine" },
    { import = "astrocommunity.colorscheme.mini-base16" },
    -- import/override with your plugins folder
}
