---@type AstroCoreOpts
return {
    features = {
        large_buf = { size = 1024 * 256, lines = 10000 },
        autopairs = true,
        cmp = true,
        diagnostics_mode = 3,
        highlighturl = true,
        notifications = false,
    },
    diagnostics = {
        virtual_text = true,
        underline = true,
    },
    options = {
        opt = {
            relativenumber = true,
            number = true,
            spell = false,
            signcolumn = "yes",
            wrap = false,
        },
        g = {
            -- NOTE: `mapleader` and `maplocalleader` must be set before `lazy.setup`.
            -- The canonical setup entrypoint is `lua/config/setup.lua`.
        },
    },
    mappings = {
        n = {
            ["L"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
            ["H"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },
            ["<Leader>bd"] = {
                function()
                    require("astroui.status.heirline").buffer_picker(
                        function(bufnr) require("astrocore.buffer").close(bufnr) end
                    )
                end,
                desc = "Close buffer from tabline",
            },
            ["<Leader>T"] = { "<cmd>Telescope<cr>", desc = "Telescope" },
            ["<Leader>ls"] = { "<cmd>LLMSuggestion<cr>", desc = "Trigger LLM suggestion" },
            ["<Leader>lt"] = { "<cmd>LLMToggleAutoSuggest<cr>", desc = "Toggle LLM autosuggest" },
        },
    },
}
