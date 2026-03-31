---@type LazySpec
return {
    {
        "huggingface/llm.nvim",
        cmd = { "LLMSuggestion", "LLMToggleAutoSuggest" },
        event = "InsertEnter",
    },
    {
        "Exafunction/codeium.vim",
        event = "InsertEnter",
        init = function()
            local arch_map = {
                aarch64 = "arm64",
                arm64 = "arm64",
                x64 = "x64",
                x86_64 = "x64",
            }
            local os_map = {
                Linux = "Linux",
                OSX = "Darwin",
                Windows = "Windows",
            }

            if jit ~= nil then
                if jit.os ~= nil then vim.g.codeium_os = os_map[jit.os] or jit.os end
                if jit.arch ~= nil then vim.g.codeium_arch = arch_map[jit.arch] or jit.arch end
            end

            vim.g.codeium_disable_bindings = 1
        end,
        config = function()
            vim.keymap.set("i", "<C-g>", function()
                return vim.fn["codeium#Accept"]()
            end, { expr = true, silent = true, desc = "Accept Codeium suggestion" })
            vim.keymap.set("i", "<C-]>", function()
                return vim.fn["codeium#Clear"]()
            end, { expr = true, silent = true, desc = "Clear Codeium suggestion" })
            vim.keymap.set("i", "<C-;>", function()
                return vim.fn["codeium#CycleCompletions"](1)
            end, { expr = true, silent = true, desc = "Next Codeium suggestion" })
            vim.keymap.set("i", "<C-,>", function()
                return vim.fn["codeium#CycleCompletions"](-1)
            end, { expr = true, silent = true, desc = "Previous Codeium suggestion" })
            vim.keymap.set("i", "<C-\\>", function()
                return vim.fn["codeium#Complete"]()
            end, { expr = true, silent = true, desc = "Trigger Codeium" })
        end,
    },
}
