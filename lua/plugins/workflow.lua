---@type LazySpec
return {
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        event = "User AstroFile",
        opts = {},
    },
    {
        "dmtrKovalenko/fff.nvim",
        build = function()
            require("fff.download").download_or_build_binary()
        end,
        opts = {
            frecency = { enabled = true },
            history = { enabled = true },
            git = { status_text_color = false },
            debug = { enabled = false },
        },
    },
}
