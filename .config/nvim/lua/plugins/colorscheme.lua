return {
    {
        'maxmx03/solarized.nvim',
        enabled = true,
        lazy = false,
        priority = 1000,
        config = function()
            require('solarized').setup({
                -- theme = 'neo',
                -- transparent = true,
            })
            -- vim.cmd.colorscheme 'solarized'
        end,
    },
    {
        "rose-pine/neovim",
        enabled = true,
        name = "rose-pine",
        config = function()
            require("rose-pine").setup({
                dark_variant = "main", -- main, moon, or dawn
                styles = {
                    bold = true,
                    italic = false,
                    -- transparency = true,
                },
            })

            -- vim.cmd("colorscheme rose-pine")
        end
    },
    {
        "ellisonleao/gruvbox.nvim",
        enabled = true,
        priority = 1000,
        config = function()
            require("gruvbox").setup({
                italic = {
                    strings = false,
                    emphasis = true,
                    comments = true,
                    operators = false,
                    folds = true,
                },
                contrast = "hard", -- can be "hard", "soft" or empty string
                -- transparent_mode = true,
            })

            vim.cmd("colorscheme gruvbox")
        end,
    },
}
