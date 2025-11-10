require("gruvbox").setup({
    contrast = "hard",
    transparent_mode = true,
    italic = {
        strings = false,
        emphasis = true,
        comments = false,
        operators = false,
        folds = true,
    }
})

vim.cmd("colorscheme gruvbox")

vim.cmd("hi statusline guibg=NONE")
vim.cmd("hi NormalFloat guibg=NONE")
vim.cmd("hi FloatBorder guibg=NONE ")
