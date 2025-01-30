return {
    'echasnovski/mini.files',
    enabled = false,
    version = false,
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
    config = function()
        vim.keymap.set("n", "<leader>pv", ":lua MiniFiles.open()")
        require('mini.files').setup()
    end
}
