return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local harpoon = require("harpoon")
    harpoon:setup()

    local keymap = vim.keymap.set

    -- Add + menu
    keymap("n", "<leader>b", function() harpoon:list():add() end, { desc = "Harpoon add file" })
    keymap("n", "<leader>h", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Harpoon menu" })

    -- Jump
    keymap("n", "<leader>1", function() harpoon:list():select(1) end, { desc = "Harpoon to file 1" })
    keymap("n", "<leader>2", function() harpoon:list():select(2) end, { desc = "Harpoon to file 2" })
    keymap("n", "<leader>3", function() harpoon:list():select(3) end, { desc = "Harpoon to file 3" })
    keymap("n", "<leader>4", function() harpoon:list():select(4) end, { desc = "Harpoon to file 4" })
    keymap("n", "<leader>5", function() harpoon:list():select(5) end, { desc = "Harpoon to file 5" })
    
    -- Cycle
    keymap("n", "<C-n>", function() harpoon:list():next() end, { desc = "Harpoon next file" })
    keymap("n", "<C-p>", function() harpoon:list():prev() end, { desc = "Harpoon prev file" })

    -- Remove current buffer’s mark
    keymap("n", "<leader>dr", function() harpoon:list():remove() end, { desc = "Harpoon remove current file" })

    -- Remove by slot
    keymap("n", "<leader>d1", function() harpoon:list():remove_at(1) end, { desc = "Remove Harpoon file 1" })
    keymap("n", "<leader>d2", function() harpoon:list():remove_at(2) end, { desc = "Remove Harpoon file 2" })
    keymap("n", "<leader>d3", function() harpoon:list():remove_at(3) end, { desc = "Remove Harpoon file 3" })
    keymap("n", "<leader>d4", function() harpoon:list():remove_at(4) end, { desc = "Remove Harpoon file 4" })
    keymap("n", "<leader>d5", function() harpoon:list():remove_at(5) end, { desc = "Remove Harpoon file 5" })
  end,
}

