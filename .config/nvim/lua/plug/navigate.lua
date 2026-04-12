require("oil").setup({
    keymaps = {
        ["g?"] = "actions.show_help",
        ["<CR>"] = "actions.select",
        ["<C-s>"] = { "actions.select", opts = { vertical = true }, desc = "Open the entry in a vertical split" },
        ["<C-h>"] = { "actions.select", opts = { horizontal = true }, desc = "Open the entry in a horizontal split" },
        ["<C-t>"] = { "actions.select", opts = { tab = true }, desc = "Open the entry in new tab" },
        --["<C-p>"] = "actions.preview",
        ["<C-c>"] = "actions.close",
        ["<C-l>"] = "actions.refresh",
        ["-"] = "actions.parent",
        ["_"] = "actions.open_cwd",
        ["`"] = "actions.cd",
        ["~"] = { "actions.cd", opts = { scope = "tab" }, desc = ":tcd to the current oil directory" },
        ["gs"] = "actions.change_sort",
        ["gx"] = "actions.open_external",
        ["g."] = "actions.toggle_hidden",
        ["g\\"] = "actions.toggle_trash",
    },
    lsp_file_methods = {
        enabled = false,
    },
    use_default_keymaps = false,
    view_options = {
        show_hidden = true,
    }
})

-- vim.g.fzf_layout = { down = '40%' }
--
-- vim.keymap.set("n", "<C-p>", ":GFiles<CR>")
-- vim.keymap.set("n", "<leader>fg", ":Rg<CR>")
vim.keymap.set("n", "<leader>pv", ":Oil<CR>")

-- telescope

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<C-p>", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>df", builtin.lsp_document_symbols) -- moved to telescope
vim.keymap.set("n", "gd", builtin.lsp_definitions)
vim.keymap.set("n", "gi", builtin.lsp_implementations)          -- moved to telescope
vim.keymap.set("n", "gr", builtin.lsp_references)               -- moved to telescope

-- TREE

---@type nvim_tree.config
local config = {
    update_focused_file = {
        enable = true,
        update_root = false
    },
    -- sort = {
    --     sorter = "case_sensitive",
    -- },
    -- view = {
    --     width = 30,
    -- },
    renderer = {
        icons = {
            glyphs = {
                default = "",
                -- symlink = "",
                folder = {
                    default = "",
                    open = "",
                    empty = "",
                    empty_open = "",
                    -- symlink = "",
                    -- symlink_open = "",
                },
                git = {
                    unstaged = "u",
                    staged = "s",
                    unmerged = "!",
                    renamed = "r",
                    untracked = "?",
                    deleted = "d",
                    ignored = "i",
                },
            },
        },
    }
    -- filters = {
    --     dotfiles = true,
    -- },
}
require("nvim-tree").setup(config)

vim.keymap.set("n", "<C-f>", ":NvimTreeToggle<CR>")
