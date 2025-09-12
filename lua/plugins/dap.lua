return {
  {
    "mfussenegger/nvim-dap",
    config = function()
      local dap = require("dap")

      -- Adapter for gdb
      dap.adapters.gdb = {
        type = "executable",
        command = "gdb",
        args = { "-i", "dap" },
      }

      -- Config for C
      dap.configurations.c = {
        {
          name = "Launch C program",
          type = "gdb",
          request = "launch",
          program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
          end,
          cwd = "${workspaceFolder}",
          stopAtEntry = false,
        },
      }

      -- Keymaps
      vim.keymap.set("n", "<F5>", function() dap.continue() end, { desc = "DAP Continue" })
      vim.keymap.set("n", "<F10>", function() dap.step_over() end, { desc = "DAP Step Over" })
      vim.keymap.set("n", "<F11>", function() dap.step_into() end, { desc = "DAP Step Into" })
      vim.keymap.set("n", "<F12>", function() dap.step_out() end, { desc = "DAP Step Out" })
      vim.keymap.set("n", "<Leader>w", function() dap.toggle_breakpoint() end, { desc = "DAP Toggle Breakpoint" })
    end,
  },
}

