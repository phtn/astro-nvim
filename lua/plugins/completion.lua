---@type LazySpec
return {
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "saadparwaiz1/cmp_luasnip",
        },
        opts = function(_, opts)
            local cmp = require "cmp"
            local luasnip = require "luasnip"

            opts.sources = cmp.config.sources({
                { name = "nvim_lsp", priority = 1000 },
                { name = "llm",      priority = 800, max_item_count = 3 },
                { name = "luasnip",  priority = 750 },
                { name = "buffer",   priority = 500, max_item_count = 5 },
                { name = "path",     priority = 250 },
            })

            opts.completion = vim.tbl_deep_extend("force", opts.completion or {}, {
                completeopt = "menu,menuone,noinsert",
                keyword_length = 1,
            })

            opts.formatting = vim.tbl_deep_extend("force", opts.formatting or {}, {
                format = function(entry, vim_item)
                    local source_names = {
                        nvim_lsp = "[LSP]",
                        llm = "[AI]",
                        luasnip = "[Snip]",
                        buffer = "[Buf]",
                        path = "[Path]",
                    }
                    vim_item.menu = source_names[entry.source.name] or "[?]"

                    if string.len(vim_item.abbr) > 50 then
                        vim_item.abbr = string.sub(vim_item.abbr, 1, 47) .. "..."
                    end

                    return vim_item
                end,
            })

            opts.mapping = vim.tbl_deep_extend("force", opts.mapping or {}, {
                ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<C-e>"] = cmp.mapping.abort(),
                ["<CR>"] = cmp.mapping.confirm({ select = false }),
                ["<Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    elseif luasnip.expand_or_jumpable() then
                        luasnip.expand_or_jump()
                    else
                        fallback()
                    end
                end, { "i", "s" }),
                ["<S-Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    elseif luasnip.jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end, { "i", "s" }),
            })

            return opts
        end,
    },
}
