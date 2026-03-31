---@type LazySpec
return {
    { "max397574/better-escape.nvim", enabled = false },
    { "yanganto/move.vim",            branch = "sui-move" },
    {
        "L3MON4D3/LuaSnip",
        config = function(plugin, opts)
            require("astronvim.plugins.configs.luasnip")(plugin, opts)
            require("luasnip").filetype_extend("javascript", { "javascriptreact" })
        end,
    },
    {
        "windwp/nvim-autopairs",
        config = function(plugin, opts)
            require("astronvim.plugins.configs.nvim-autopairs")(plugin, opts)

            local cond = require "nvim-autopairs.conds"
            local npairs = require "nvim-autopairs"
            local Rule = require "nvim-autopairs.rule"

            npairs.add_rules(
                {
                    Rule("$", "$", { "tex", "latex" })
                        :with_pair(cond.not_after_regex "%%")
                        :with_pair(cond.not_before_regex("xxx", 3))
                        :with_move(cond.none())
                        :with_del(cond.not_after_regex "xx")
                        :with_cr(cond.none()),
                },
                Rule("a", "a", "-vim")
            )
        end,
    },
}
