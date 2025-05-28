vim.keymap.set("n", "<leader>pv", ":Oil<Return>", { silent = true })
-- vim.keymap.set("n", "<leader>pv", ":Ex", { silent = true })
vim.keymap.set("n", "<C-A>", "gg<S-v>G")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("x", "<leader>p", [["_dP]])

-- LSP Keymaps
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "[R]e[n]ame" })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "[C]ode [A]ction" })

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

-- Open LazyGit
vim.keymap.set("n", "<leader>lg", ":LazyGit<Return>", { desc = "Open diagnostics list" })

-- Resize window
vim.keymap.set('n', '<C-left>', '<C-w><')
vim.keymap.set('n', '<C-right>', '<C-w>>')
vim.keymap.set('n', '<C-up>', '<C-w>+')
vim.keymap.set('n', '<C-down>', '<C-w>-')


-- nvim-jdtls
local opts = { noremap = true, silent = true }

-- Organize imports
vim.keymap.set('n', '<A-o>', function() require('jdtls').organize_imports() end, opts)

-- Extract variable
vim.keymap.set('n', 'crv', function() require('jdtls').extract_variable() end, opts)
vim.keymap.set('v', 'crv', function() require('jdtls').extract_variable(true) end, opts)

-- Extract constant
vim.keymap.set('n', 'crc', function() require('jdtls').extract_constant() end, opts)
vim.keymap.set('v', 'crc', function() require('jdtls').extract_constant(true) end, opts)

-- Extract method
vim.keymap.set('v', 'crm', function() require('jdtls').extract_method(true) end, opts)
