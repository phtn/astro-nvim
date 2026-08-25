-- Customize Treesitter

---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    require("nvim-treesitter.parsers").get_parser_configs().beast = {
      install_info = {
        url = "https://github.com/phtn/beast-ext",
        revision = "1d204c7df940b60ba1964e894fadab35ee0a515f",
        files = { "src/parser.c", "src/scanner.c" },
      },
      filetype = "beast",
      maintainers = { "@phtn" },
    }

    opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed or {}, {
      "lua",
      "vim",
      "javascript",
      "typescript",
      "tsx",
      "css",
      "beast",
    })

    return opts
  end,
}
