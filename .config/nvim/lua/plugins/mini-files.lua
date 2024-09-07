return {
    'echasnovski/mini.files',
    enabled = false,
    version = '*',
    opts = {},
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
    config = function()
        vim.keymap.set("n", "<leader>pv", ":lua MiniFiles.open()")
    end
}
