return { -- Autoformat
    'stevearc/conform.nvim',
    enabled = true,
    lazy = false,
    keys = {
        {
            '<leader>f',
            function()
                require('conform').format { async = true, lsp_fallback = true }
            end,
            mode = '',
            desc = '[F]ormat buffer',
        },
    },
    config = function()
        require('conform').setup({
            notify_on_error = true,
            format_on_save = function(bufnr)
                -- Disable "format_on_save lsp_fallback" for languages that don't
                -- have a well standardized coding style. You can add additional
                -- languages here or re-enable it for the disabled ones.
                -- or just languages you hate (TYPESCRIPT).

                local disable_filetypes = { c = true, cpp = true, tsx = true, java = true }
                return {
                    timeout_ms = 500,
                    lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
                    lsp_format = "fallback",
                }
            end,
            formatters_by_ft = {
                lua = { 'stylua' },
                java = { "google-java-format" },
                javascript = { { "prettierd", "prettier" } },
                -- typescript = { { "biome", "prettierd", "prettier" } },
            },
        })
    end
}
