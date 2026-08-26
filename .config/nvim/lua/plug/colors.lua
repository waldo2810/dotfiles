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

require("catppuccin").setup({
    flavour = "mocha", -- latte, frappe, macchiato, mocha
    transparent_background = true,
    float = {
        transparent = true,
    },
    term_colors = true, -- sets terminal colors (e.g. `g:terminal_color_0`)
    no_italic = false,
    no_bold = false,
    no_underline = false,
})

require("rose-pine").setup({
    styles = {
        bold = true,
        italic = false,
        transparency = false,
    },
})

vim.cmd("colorscheme rose-pine")
vim.opt.bg="dark"

vim.cmd("hi statusline guibg=NONE")
vim.cmd("hi NormalFloat guibg=NONE")
vim.cmd("hi FloatBorder guibg=NONE ")
