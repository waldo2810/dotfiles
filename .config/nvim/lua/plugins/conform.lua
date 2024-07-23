return { -- Autoformat
    'stevearc/conform.nvim',
    enabled = false,
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
                local disable_filetypes = { c = true, cpp = true }
                return {
                    timeout_ms = 500,
                    lsp_format = "fallback",
                    lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
                }
            end,
            formatters_by_ft = {
                lua = { 'stylua' },
                javascript = { { "biome", "prettierd", "prettier" } },
                typescript = { { "biome", "prettierd", "prettier" } },
            },
        })
        -- require('conform').formatters.eslint_d = {
        --     command = "eslint_d",
        --     prepend_args = function()
        --         return { "--rule", "'{'space-in-parens": ["error", "always"]}'" }
        --     end,
        -- }
    end
}
