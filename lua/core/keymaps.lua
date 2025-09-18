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
vim.keymap.set("n", "<leader>mb", function() require("dap").toggle_breakpoint() end, { desc = "Breakpoint" })

-- Control flow
vim.keymap.set("n", "<leader>mc", function() require("dap").continue() end, { desc = "Continue" })
vim.keymap.set("n", "<leader>mo", function() require("dap").step_over() end, { desc = "Step Over" })
vim.keymap.set("n", "<leader>mi", function() require("dap").step_into() end, { desc = "Step Into" })
vim.keymap.set("n", "<leader>mu", function() require("dap").step_out() end, { desc = "Step Out" })

-- UI
vim.keymap.set("n", "<leader>muo", function() require("dapui").open() end, { desc = "Open DAP UI" })
vim.keymap.set("n", "<leader>mux", function() require("dapui").close() end, { desc = "Close DAP UI" })
vim.keymap.set("n", "<leader>mut", function() require("dapui").toggle() end, { desc = "Toggle DAP UI" })


