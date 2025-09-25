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
                "gopls",         -- Go
                "clangd",        -- C/C++
                "rust_analyzer", -- Rust
                "pyright",       -- Python
                "ts_ls",         -- js,ts,jsx,tsx
            },
        })

        local servers = { "gopls", "clangd", "rust_analyzer", "pyright", "ts_ls", }
        for _, server in ipairs(servers) do
            vim.lsp.config[server] = {
                cmd = { vim.fn.exepath(server) }, -- fallback to Mason’s bin
                capabilities = vim.lsp.protocol.make_client_capabilities(),
                settings = {}, -- you can add custom settings here
            }
            vim.lsp.start({
                name = server,
                cmd = vim.lsp.config[server].cmd,
                root_dir = vim.fn.getcwd(),
            })
        end
    end,
}

