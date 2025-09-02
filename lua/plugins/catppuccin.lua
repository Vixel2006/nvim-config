return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
        require("catppuccin").setup({
            flavour = "mocha",
            integrations = {
                lualine = true,
                treesitter = true,
                telescope = true,
            },
        })
        vim.cmd.colorscheme("catppuccin-mocha")
    end,
}

