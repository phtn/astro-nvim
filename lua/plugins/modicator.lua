---@type LazySpec
return {
    "mawkler/modicator.nvim",
    lazy = false,
    priority = 900,
    init = function()
        vim.o.cursorline = false
        vim.o.number = true
        vim.o.termguicolors = true
    end,
    opts = {},
}
