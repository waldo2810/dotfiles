vim.lsp.enable("rust-analyzer")

vim.lsp.config("rust-analyzer", {
    cmd = { "rust-analyzer" },
    filetypes = { "rust" },
    root_markers = { ".git", 'Cargo.lock' },
    capabilities = require("cmp_nvim_lsp").default_capabilities()
})
