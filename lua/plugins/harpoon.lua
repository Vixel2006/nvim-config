return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local harpoon = require("harpoon")

    -- REQUIRED: initialize Harpoon
    harpoon:setup()

    -- Keymaps
    local keymap = vim.keymap.set
    keymap("n", "<leader>b", function() harpoon:list():add() end, { desc = "Harpoon add file" })
    keymap("n", "<leader>h", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Harpoon menu" })

    -- Quick jump between marked files
    keymap("n", "<leader>1", function() harpoon:list():select(1) end, { desc = "Harpoon to file 1" })
    keymap("n", "<leader>2", function() harpoon:list():select(2) end, { desc = "Harpoon to file 2" })
    keymap("n", "<leader>3", function() harpoon:list():select(3) end, { desc = "Harpoon to file 3" })
    keymap("n", "<leader>4", function() harpoon:list():select(4) end, { desc = "Harpoon to file 4" })

    -- Navigate Harpoon list
    keymap("n", "<C-n>", function() harpoon:list():next() end, { desc = "Harpoon next file" })
    keymap("n", "<C-p>", function() harpoon:list():prev() end, { desc = "Harpoon prev file" })
  end,
}

