return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("trouble").setup({})

    local map = vim.keymap.set
    map("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<CR>", { desc = "Diagnostics" })
    map("n", "<leader>xq", "<cmd>Trouble qflist toggle<CR>", { desc = "Quickfix list" })
    map("n", "<leader>xl", "<cmd>Trouble loclist toggle<CR>", { desc = "Loclist" })
    map("n", "<leader>xr", "<cmd>Trouble lsp_references toggle<CR>", { desc = "LSP References" })
  end,
}

