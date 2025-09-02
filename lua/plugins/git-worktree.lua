return {
  "ThePrimeagen/git-worktree.nvim",
  dependencies = { "nvim-telescope/telescope.nvim" },
  config = function()
    require("git-worktree").setup()
    require("telescope").load_extension("git_worktree")

    -- Example keymaps
    local map = vim.keymap.set
    map("n", "<leader>gw", "<cmd>Telescope git_worktree git_worktrees<CR>", { desc = "List Git worktrees" })
    map("n", "<leader>gW", "<cmd>Telescope git_worktree create_git_worktree<CR>", { desc = "Create Git worktree" })
  end,
}

