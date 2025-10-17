return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },

  config = function()
    ---------------------------------------------------------------------
    -- Mason setup (manages binaries)
    ---------------------------------------------------------------------
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    mason.setup()
    mason_lspconfig.setup({
      ensure_installed = { "clangd", "pyright", "gopls", "rust_analyzer" },
      automatic_installation = true,
    })

    ---------------------------------------------------------------------
    -- Diagnostics UI
    ---------------------------------------------------------------------
    local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    vim.diagnostic.config({
      virtual_text = { prefix = "●", spacing = 2 },
      float = { border = "rounded", source = "always" },
      update_in_insert = false,
      severity_sort = true,
    })

    ---------------------------------------------------------------------
    -- LSP keymaps and shared settings
    ---------------------------------------------------------------------
    local on_attach = function(_, bufnr)
      local opts = { buffer = bufnr, noremap = true, silent = true }
      local map = vim.keymap.set
      map("n", "K", vim.lsp.buf.hover, opts)
      map("n", "gd", vim.lsp.buf.definition, opts)
      map("n", "gr", vim.lsp.buf.references, opts)
      map("n", "gi", vim.lsp.buf.implementation, opts)
      map("n", "<leader>rn", vim.lsp.buf.rename, opts)
      map("n", "<leader>ca", vim.lsp.buf.code_action, opts)
      map("n", "[d", vim.diagnostic.goto_prev, opts)
      map("n", "]d", vim.diagnostic.goto_next, opts)
      map("n", "<leader>f", function() vim.lsp.buf.format({ async = true }) end, opts)
    end

    ---------------------------------------------------------------------
    -- Capabilities (autocompletion support if nvim-cmp exists)
    ---------------------------------------------------------------------
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    local ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
    if ok then
      capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
    end

    ---------------------------------------------------------------------
    -- Servers configuration
    ---------------------------------------------------------------------
    
    vim.env.PATH = vim.fn.stdpath("data") .. "/mason/bin:" .. vim.env.PATH
    local servers = {
      pyright = {},
      gopls = {},
      rust_analyzer = {
        settings = {
          ["rust-analyzer"] = {
            cargo = { allFeatures = true },
            checkOnSave = { command = "clippy" },
          },
        },
      },
      clangd = {
        cmd = { "clangd", "--background-index", "--clang-tidy", "--header-insertion=never" },
        filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
      },
    }



    ---------------------------------------------------------------------
    -- New Neovim 0.11+ API: vim.lsp.config
    ---------------------------------------------------------------------
    local mason_bin = vim.fn.stdpath("data") .. "/mason/bin/"
    vim.lsp.config = vim.lsp.config or {}

    for name, config in pairs(servers) do
      local bin = vim.fn.exepath(name)
      if bin == "" then
        bin = mason_bin .. name
      end

      if vim.fn.filereadable(bin) == 0 then
        vim.notify("[LSP] Skipping " .. name .. " (binary not found)", vim.log.levels.WARN)
      else
        vim.lsp.config[name] = vim.tbl_extend("force", config, {
          cmd = { bin },
          capabilities = capabilities,
          on_attach = on_attach,
        })
        vim.lsp.start({
          name = name,
          cmd = { bin },
          root_dir = vim.fn.getcwd(),
          capabilities = capabilities,
          on_attach = on_attach,
        })
      end
    end
  end,
}

