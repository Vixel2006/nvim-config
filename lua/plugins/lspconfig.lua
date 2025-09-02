return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",          -- installer for LSP servers, linters, formatters
    "williamboman/mason-lspconfig.nvim" -- bridge between mason + lspconfig
  },
  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = { "pyright", "clangd", "lua_ls" } -- whatever langs you use
    })

    local lspconfig = require("lspconfig")
    lspconfig.pyright.setup({})
    lspconfig.clangd.setup({})
    lspconfig.lua_ls.setup({})
  end
}

