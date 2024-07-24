vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
    desc = 'Format on save - TYPESCRIPT ONLY',
    pattern = { "*.ts", "*.tsx" },
    callback = function(args)
        vim.lsp.buf.format({
            bufnr = args.buf,
            formatting_options = {
                insertFinalNewline = true,
                trimTrailingWhitespace = true,

                insertSpaceAfterOpeningAndBeforeClosingJsxExpressionBraces = true,
                insertSpaceAfterOpeningAndBeforeClosingNonemptyBrackets = true,
                insertSpaceAfterOpeningAndBeforeClosingNonemptyParenthesis = true,
                insertSpaceAfterOpeningAndBeforeClosingTemplateStringBraces = true,
                insertSpaceAfterOpeningAndBeforeClosingEmptyBraces = false
            }
        })
    end,
})
