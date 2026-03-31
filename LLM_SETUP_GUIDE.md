# AI Completion Setup Guide

## Default Setup
This configuration currently uses two separate AI paths:

- `Codeium/Windsurf` for inline ghost-text suggestions.
- `llm.nvim` for manual or autosuggest-backed LLM completions when you configure a backend.

The popup completion menu is still owned by `nvim-cmp`, so `Tab` remains available for cmp and snippet navigation.

## Codeium Setup
1. Open Neovim.
2. Run `:Codeium Auth`.
3. Restart Neovim after authentication.

### Insert Mode Keymaps
- `Ctrl-g`: accept the current Codeium suggestion
- `Ctrl-]`: clear the current suggestion
- `Ctrl-;`: next suggestion
- `Ctrl-,`: previous suggestion
- `Ctrl-\`: manually trigger a suggestion

## Optional llm.nvim Setup
If you want model-backed LLM suggestions in addition to Codeium:

1. Configure your provider environment variables.
2. Start with a Hugging Face token by setting `LLM_NVIM_HF_API_TOKEN`.
3. Open Neovim and use the mappings below.

### Normal Mode Keymaps
- `<Leader>ls`: request a manual LLM suggestion
- `<Leader>lt`: toggle LLM autosuggest

## Relevant Files
- `lua/plugins/llm.lua`: AI provider plugins and provider-specific keymaps
- `lua/plugins/completion.lua`: `nvim-cmp` source ordering and popup completion behavior
- `lua/config/astrocore.lua`: normal-mode mappings for LLM commands
- `lua/plugins/editing.lua`: snippet and autopair behavior that shares insert-mode space with completion
