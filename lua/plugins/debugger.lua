return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio",
    "jay-babu/mason-nvim-dap.nvim",
    "theHamsta/nvim-dap-virtual-text",
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")

    require("mason-nvim-dap").setup({
      ensure_installed = { "codelldb", "debugpy", "delve" }, -- Rust/C++/Python/Go
      automatic_installation = true,
    })

    -- dap-ui setup
    dapui.setup()

    -- Auto open/close UI
    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated["dapui_config"] = function()
      dapui.close()
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
      dapui.close()
    end

    -- CodeLLDB adapter
    local mason_path = vim.fn.stdpath("data") .. "/mason"
    local codelldb_path = mason_path .. "/packages/codelldb/extension/adapter/codelldb"

    dap.adapters.codelldb = {
      type = "server",
      port = "${port}",
      executable = {
        command = codelldb_path,
        args = { "--port", "${port}" },
      },
    }

    -- Configurations
    dap.configurations.cpp = {
      {
        name = "Launch file",
        type = "codelldb",
        request = "launch",
        program = function()
          return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
        args = {},
      },
    }

    dap.configurations.c = dap.configurations.cpp
    dap.configurations.rust = dap.configurations.cpp

    -- Go (dlv)
    dap.adapters.delve = {
      type = "server",
      port = "${port}",
      executable = {
        command = mason_path .. "/bin/dlv",
        args = { "dap", "-l", "127.0.0.1:${port}" },
      },
    }
    dap.configurations.go = {
      {
        type = "delve",
        name = "Debug",
        request = "launch",
        program = "${file}",
      },
    }

    -- Python (debugpy)
    dap.adapters.python = {
      type = "executable",
      command = mason_path .. "/bin/python",
      args = { "-m", "debugpy.adapter" },
    }
    dap.configurations.python = {
      {
        type = "python",
        request = "launch",
        name = "Launch file",
        program = "${file}",
        console = "integratedTerminal",
      },
    }
  end,
}

