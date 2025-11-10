vim.keymap.set("n", "<Esc>", ":noh<CR>")
vim.keymap.set("n", "<leader>pv", ":Ex<CR>")
vim.keymap.set("n", "<leader>s", ":so<CR>")
vim.keymap.set("n", "<leader>e", ":e!<CR>")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

local function copy_rel_path()
    vim.fn.setreg("+", vim.fn.expand("%:."))
    vim.notify("Copied relative path: " .. vim.fn.expand("%:."))
end
vim.keymap.set("n", "<leader>yp", copy_rel_path, { desc = "Copy relative path" })

-- vim.keymap.set("n", "n", "nzzzv")
-- vim.keymap.set("n", "N", "Nzzzv")
