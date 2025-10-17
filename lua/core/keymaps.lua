local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Normal stuff
map("n", "<leader>e", ":Ex<CR>")
map("n", "<leader>w", ":w<CR>")
map("n", "<leader>q", ":q<CR>")

-- Exit insert mode by typing jj
map("i", "jj", "<Esc>", { noremap = true, silent = true })

-- Telescope (fuzzy finder)
map("n", "<leader><leader>", ":Telescope find_files<CR>", opts)
map("n", "<leader>ft", ":TodoTelescope<CR>", opts)
map("n", "<leader>fg", ":Telescope live_grep<CR>", opts)
map("n", "<leader>fb", ":Telescope buffers<CR>", opts)
map("n", "<leader>fh", ":Telescope help_tags<CR>", opts)

-- Tree
map("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- LSP
map("n", "gd", vim.lsp.buf.definition, opts)
map("n", "gr", vim.lsp.buf.references, opts)
map("n", "gi", vim.lsp.buf.implementation, opts)
map("n", "K",  vim.lsp.buf.hover, opts)
map("n", "<leader>rn", vim.lsp.buf.rename, opts)
map("n", "<leader>ca", vim.lsp.buf.code_action, opts)
map("n", "[d", vim.diagnostic.goto_prev, opts)
map("n", "]d", vim.diagnostic.goto_next, opts)
map("n", "<leader>dl", "<cmd>Telescope diagnostics<CR>", opts)

-- Debugger

-- Breakpoints
vim.keymap.set("n", "<leader>dt", function() require("dap").toggle_breakpoint() end, { desc = "Breakpoint" })

-- Control flow
vim.keymap.set("n", "<leader>db", function() require("dap").toggle_breakpoint() end, { desc = "Toggle Breakpoint" })
vim.keymap.set("n", "<leader>dB", function() require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: ")) end, { desc = "Conditional Breakpoint" })
vim.keymap.set("n", "<leader>dc", function() require("dap").continue() end, { desc = "Continue" })
vim.keymap.set("n", "<leader>dr", function() require("dap").restart() end, { desc = "Restart Debug Session" })
vim.keymap.set("n", "<leader>do", function() require("dap").step_over() end, { desc = "Step Over" })
vim.keymap.set("n", "<leader>di", function() require("dap").step_into() end, { desc = "Step Into" })
vim.keymap.set("n", "<leader>du", function() require("dap").step_out() end, { desc = "Step Out" })
vim.keymap.set("n", "<leader>dx", function() require("dap").terminate() end, { desc = "Terminate Debugging" })
vim.keymap.set("n", "<leader>dl", function() require("dap").list_breakpoints() end, { desc = "List Breakpoints" })


-- UI
vim.keymap.set("n", "<leader>dut", function() require("dapui").toggle() end, { desc = "Toggle DAP UI" })
vim.keymap.set("n", "<leader>dus", function() require("dapui").float_element("scopes") end, { desc = "Show Scopes Floating" })
vim.keymap.set("n", "<leader>duc", function() require("dapui").float_element("console") end, { desc = "Show Console Floating" })
vim.keymap.set("n", "<leader>dur", function() require("dapui").float_element("repl") end, { desc = "Show REPL Floating" })

