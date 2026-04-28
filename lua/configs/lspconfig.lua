require("nvchad.configs.lspconfig").defaults()

local map = vim.keymap.set
local mason_bin = vim.fn.stdpath "data" .. "/mason/bin/"

local servers = {
  "html",
  "cssls",
  "clangd",
  "pyright",
  "rust_analyzer",
}

vim.lsp.config("clangd", {
  cmd = {
    "clangd",
    "--background-index",
    "--clang-tidy",
    "--completion-style=detailed",
    "--header-insertion=iwyu",
  },
})

vim.lsp.config("pyright", {
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        diagnosticMode = "workspace",
        useLibraryCodeForTypes = true,
      },
    },
  },
})

vim.lsp.config("rust_analyzer", {
  cmd = { mason_bin .. "rust-analyzer" },
  settings = {
    ["rust-analyzer"] = {
      cargo = { allFeatures = true },
      check = { command = "clippy" },
    },
  },
})

vim.lsp.enable(servers)

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local function opts(desc)
      return { buffer = args.buf, desc = "LSP " .. desc }
    end

    map("n", "gd", vim.lsp.buf.definition, opts "go to definition")
    map("n", "gD", vim.lsp.buf.declaration, opts "go to declaration")
    map("n", "gr", vim.lsp.buf.references, opts "find references")
    map("n", "gi", vim.lsp.buf.implementation, opts "go to implementation")
    map("n", "K", vim.lsp.buf.hover, opts "hover documentation")
    map("n", "<leader>rn", vim.lsp.buf.rename, opts "rename symbol")
    map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts "code action")
    map("n", "[d", vim.diagnostic.goto_prev, opts "previous diagnostic")
    map("n", "]d", vim.diagnostic.goto_next, opts "next diagnostic")
    map("n", "<leader>dl", vim.diagnostic.setloclist, opts "diagnostic loclist")
  end,
})

-- read :h vim.lsp.config for changing options of lsp servers 
