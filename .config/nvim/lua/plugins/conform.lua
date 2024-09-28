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
                local ignore_filetypes = { "c", "cpp", "java" }
                if vim.tbl_contains(ignore_filetypes, vim.bo[bufnr].filetype) then
                    return
                end
                -- Disable autoformat for files in a certain path
                local bufname = vim.api.nvim_buf_get_name(bufnr)
                if bufname:match("/subrik/dashviewer/") then
                    vim.cmd.doautocmd("User FormatDashviewer")
                    return
                end
                -- ...additional logic...
                return { timeout_ms = 500, lsp_format = "fallback" }
            end,
            formatters_by_ft = {
                lua = { 'stylua' },
                java = { "google-java-format" },
                javascript = { { "prettierd", "prettier" } },
                typescript = { { "prettierd", "prettier" } },
            },
        })
    end
}
