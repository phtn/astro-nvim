# Lua File Reference

## Scope Definitions
- `Bootstrap`: starts Neovim's plugin system and defines the canonical load path.
- `AstroNvim Core`: owns AstroNvim-native options for mappings, UI, and LSP behavior.
- `Plugin Specs`: registers third-party plugins and keeps each file responsible for one concern area.
- `Escape Hatch`: last-run local tweaks that do not fit a clearer plugin or core module.

## File Map
| File | Scope | Responsibility |
| --- | --- | --- |
| `init.lua` | Bootstrap | Enters the config through `require("config.lazy")`. |
| `lua/config/lazy.lua` | Bootstrap | Bootstraps `lazy.nvim`, validates it, then loads setup and polish. |
| `lua/config/setup.lua` | Bootstrap | Defines the canonical `lazy.setup(...)` spec import order. |
| `lua/community.lua` | Plugin Specs | Holds AstroCommunity imports only. |
| `lua/config/astrocore.lua` | AstroNvim Core | Owns editor options and global non-plugin-specific mappings. |
| `lua/config/astrolsp.lua` | AstroNvim Core | Owns AstroLSP features, format-on-save, server tuning, and LSP mappings. |
| `lua/config/astroui.lua` | AstroNvim Core | Owns the selected colorscheme and AstroUI icon/highlight settings. |
| `lua/config/lualine.lua` | Plugin Specs | Owns the custom Evil Lualine statusline layout and Moonfly-tuned palette. |
| `lua/plugins/astrocore.lua` | AstroNvim Core | Thin wrapper that connects AstroCore to `lua/config/astrocore.lua`. |
| `lua/plugins/astrolsp.lua` | AstroNvim Core | Thin wrapper that connects AstroLSP to `lua/config/astrolsp.lua`. |
| `lua/plugins/astroui.lua` | AstroNvim Core | Thin wrapper that connects AstroUI to `lua/config/astroui.lua`. |
| `lua/plugins/colorscheme.lua` | Plugin Specs | Owns the active Moonfly colorscheme plugin only. |
| `lua/plugins/modicator.lua` | Plugin Specs | Owns mode-based line number coloring and required UI options. |
| `lua/plugins/completion.lua` | Plugin Specs | Owns `nvim-cmp` sources, formatting, and completion keymaps. |
| `lua/plugins/llm.lua` | Plugin Specs | Owns AI providers and provider-specific insert-mode bindings. |
| `lua/plugins/mason.lua` | Plugin Specs | Owns tool installation for LSP, null-ls, and DAP. |
| `lua/plugins/none-ls.lua` | Plugin Specs | Owns formatter and linter source registration. |
| `lua/plugins/treesitter.lua` | Plugin Specs | Owns Treesitter parser selection. |
| `lua/plugins/ui.lua` | Plugin Specs | Owns dashboard, bufferline, and Neo-tree UI customizations. |
| `lua/plugins/editing.lua` | Plugin Specs | Owns editing behavior plugins such as autopairs, snippets, and move.vim. |
| `lua/plugins/workflow.lua` | Plugin Specs | Owns workflow helpers such as todo comments and `fff.nvim`. |
| `lua/plugins/lsp_tools.lua` | Plugin Specs | Owns LSP-adjacent helper plugins such as `nvim-lspimport`. |
| `lua/plugins/lualine.lua` | Plugin Specs | Hands bottom statusline rendering to lualine while leaving Heirline tabline/winbar intact. |
| `lua/polish.lua` | Escape Hatch | Reserved for final-stage tweaks that do not belong in a scoped module. |

## Organization Rules
- Keep one owner file per plugin to avoid hidden lazy-spec merges.
- Put AstroNvim option tables in `lua/config/` and keep `lua/plugins/astro*.lua` as wrappers.
- Put plugin-local keymaps beside the plugin that requires them.
- Use `lua/polish.lua` only when a customization does not fit a more specific scope.
