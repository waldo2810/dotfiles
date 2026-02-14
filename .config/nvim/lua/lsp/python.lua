vim.lsp.enable("python")

vim.lsp.config("python", {
    cmd = { "ty", "server" },
    filetypes = { "python" },
    root_markers = {
        'pyproject.toml',
        '.git',
    },
    settings = {
        ty = {
            configuration = {
                rules = {
                    ["unresolved-reference"] = "warn"
                }
            }
        },
    },
    capabilities = require('cmp_nvim_lsp').default_capabilities()
})
