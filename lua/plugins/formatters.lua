return {
    {
        "stevearc/conform.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local conform = require("conform")

            conform.setup({
                formatters_by_ft = {
                    go = { "gofmt" },
                    rust = { "rustfmt" },
                    c = { "clang-format" },
                    cpp = { "clang-format" },
                    -- python intentionally left out
                },
            })

            -- auto-format on save for supported languages
            vim.api.nvim_create_autocmd("BufWritePre", {
                callback = function()
                    local ft = vim.bo.filetype
                    if ft ~= "python" then
                        conform.format({ async = false })
                    end
                end,
            })
        end,
    },
}
