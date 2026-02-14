vim.lsp.enable("gopls")

vim.lsp.config("gopls", {
    cmd = { "gopls" },
    filetypes = { "go" },
    root_markers = { ".git", 'go.mod' },
    capabilities = require("cmp_nvim_lsp").default_capabilities()
})
