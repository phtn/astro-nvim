---@type LazySpec
return {
    {
        "rebelot/heirline.nvim",
        opts = function(_, opts)
            opts.statusline = false
            return opts
        end,
    },
    {
        "nvim-lualine/lualine.nvim",
        lazy = false,
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("lualine").setup(require "config.lualine")
        end,
    },
}
