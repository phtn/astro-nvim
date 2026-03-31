---@type AstroLSPOpts
return {
    features = {
        codelens = true,
        inlay_hints = true,
        semantic_tokens = true,
    },
    formatting = {
        format_on_save = {
            enabled = true,
            allow_filetypes = {
                "go",
                "typescript",
                "javascript",
                "typescriptreact",
                "javascriptreact",
            },
            ignore_filetypes = {},
        },
        disabled = {},
        timeout_ms = 1000,
    },
    servers = {
        vtsls = {
            settings = {
                typescript = {
                    inlayHints = {
                        enumMemberValues = { enabled = false },
                    },
                },
            },
        },
    },
    ---@diagnostic disable: missing-fields
    config = {
        clangd = {
            capabilities = {
                offsetEncoding = "utf-8",
                position_encoding = "utf-8",
            },
        },
    },
    handlers = {},
    autocmds = {
        lsp_codelens_refresh = {
            cond = "textDocument/codeLens",
            {
                event = { "InsertLeave", "BufEnter" },
                desc = "Refresh codelens (buffer)",
                callback = function(args)
                    if require("astrolsp").config.features.codelens then vim.lsp.codelens.refresh { bufnr = args.buf } end
                end,
            },
        },
    },
    mappings = {
        n = {
            gD = {
                function() vim.lsp.buf.declaration() end,
                desc = "Declaration of current symbol",
                cond = "textDocument/declaration",
            },
            ["<Leader>uY"] = {
                function() require("astrolsp.toggles").buffer_semantic_tokens() end,
                desc = "Toggle LSP semantic highlight (buffer)",
                cond = function(client)
                    return client.supports_method "textDocument/semanticTokens/full" and vim.lsp.semantic_tokens ~= nil
                end,
            },
        },
    },
}
