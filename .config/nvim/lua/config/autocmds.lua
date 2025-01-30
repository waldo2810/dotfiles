vim.api.nvim_create_autocmd('BufEnter', {
  desc = 'Set conceallevel',
  pattern = { "*.md" },
  group = vim.api.nvim_create_augroup('set-conceallevel', { clear = true }),
  callback = function()
    vim.opt_local.conceallevel = 2
  end
})

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- vim.api.nvim_create_autocmd('User', {
--   group = vim.api.nvim_create_augroup('WasabiGroup', { clear = true }),
--   pattern = 'FormatDashviewer',
--   callback = function(args)
--     vim.opt.shiftwidth = 4
--     vim.opt.tabstop = 4
--     vim.opt.softtabstop = 4
--     vim.lsp.buf.format({
--       bufnr = args.buf,
--       formatting_options = {
--         insertFinalNewline = true,
--         trimTrailingWhitespace = true,
--
--         insertSpaceAfterOpeningAndBeforeClosingJsxExpressionBraces = true,
--         insertSpaceAfterOpeningAndBeforeClosingNonemptyBrackets = true,
--         insertSpaceAfterOpeningAndBeforeClosingNonemptyParenthesis = true,
--         insertSpaceAfterOpeningAndBeforeClosingTemplateStringBraces = true,
--         insertSpaceAfterOpeningAndBeforeClosingEmptyBraces = false
--       }
--     })
--   end,
-- })

-- vim.api.nvim_create_autocmd("BufWritePre", {
--   pattern = "*",
--   callback = function(args)
--     require("conform").format({ bufnr = args.buf })
--   end,
-- })
