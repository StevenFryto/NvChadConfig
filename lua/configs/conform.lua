local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    c = { "clang-format" },
    cpp = { "clang-format" },
    h = { "clang-format" },
    hpp = { "clang-format" },
    python = { "isort", "black" },
    rust = { "rustfmt" },
    -- css = { "prettier" },
    -- html = { "prettier" },
  },

  format_on_save = {
    timeout_ms = 1000,
    lsp_format = "fallback",
  },
}

return options
