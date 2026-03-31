return {
    {
        "bluz71/vim-moonfly-colors",
        name = "moonfly",
        lazy = false,
        priority = 1000,
        init = function()
            vim.g.moonflyItalics = true
            vim.g.moonflyTerminalColors = true
        end,
    },
}
