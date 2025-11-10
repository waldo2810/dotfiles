vim.lsp.enable("ts_ls")

vim.lsp.config("ts_ls", {
    cmd = { "typescript-language-server", "--stdio" },
    filetypes = { "typescript", "javascript", "typescriptreact", "javascriptreact" },
    root_markers = { '.git', 'tsconfig.json', 'package.json' },
    capabilities = require("cmp_nvim_lsp").default_capabilities()
})
