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

require('github-theme').setup({
    options = {
        transparent = true,
        styles = {       -- Style to be applied to different syntax groups
            comments = 'italic', -- Value is any valid attr-list value `:help attr-list`
            -- functions = 'NONE',
            keywords = 'italic',
            -- variables = 'NONE',
            -- conditionals = 'NONE',
            -- constants = 'NONE',
            -- numbers = 'NONE',
            -- operators = 'NONE',
            -- strings = 'NONE',
            -- types = 'NONE',
        },
    }
})


local function set_background_from_macos()
    local handle = io.popen("defaults read -g AppleInterfaceStyle 2>/dev/null")
    if not handle then return end
    local result = handle:read("*a")
    handle:close()

    if result:match("Dark") then
        vim.o.background = "dark"
        vim.cmd("colorscheme github_dark")
    else
        vim.o.background = "light"
        vim.cmd("colorscheme github_light")
    end
end

if vim.fn.has('macunix') then
    set_background_from_macos()
end

-- vim.opt.bg = "dark"

vim.cmd("hi statusline guibg=NONE")
vim.cmd("hi NormalFloat guibg=NONE")
vim.cmd("hi FloatBorder guibg=NONE ")
