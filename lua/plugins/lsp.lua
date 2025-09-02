return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
    },
    config = function()
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "gopls",    -- Go
                "clangd",   -- C/C++
                "rust_analyzer", -- Rust
                "pyright",  -- Python
            },
        })

        local lspconfig = require("lspconfig")
        local servers = { "gopls", "clangd", "rust_analyzer", "pyright" }
        for _, lsp in ipairs(servers) do
            lspconfig[lsp].setup({})
        end
    end,
}

