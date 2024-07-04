return {
    {
        'maxmx03/solarized.nvim',
        lazy = false,
        priority = 1000,
        config = function()
            require('solarized').setup({
                theme = 'neo',
                transparent = true,
            })
            vim.o.background = 'dark' -- or 'light'
            -- vim.o.background = 'light' -- or 'light'
            vim.cmd.colorscheme 'solarized'
        end,
    },
    -- {
    --     "rose-pine/neovim",
    --     name = "rose-pine",
    --     config = function ()
    --         require("rose-pine").setup({
    --             dark_variant = "main", -- main, moon, or dawn
    --             styles = {
    --                 bold = true,
    --                 italic = false,
    --                 transparency = true,
    --             },
    --             highlight_groups = {
    --                 -- Comment = { fg = "foam" },
    --                 -- VertSplit = { fg = "muted", bg = "muted" },
    --             },
    --         })
    --
    --         vim.cmd("colorscheme rose-pine")
    --         -- vim.cmd("colorscheme rose-pine-main")
    --         -- vim.cmd("colorscheme rose-pine-moon")
    --         -- vim.cmd("colorscheme rose-pine-dawn")
    --     end
    -- },
    -- {
    --     "rebelot/kanagawa.nvim",
    --     priority = 1000,
    --     config = function ()
    --         require("kanagawa").setup({
    --             commentStyle = { italic = true },
    --             keywordStyle = { italic = false},
    --             statementStyle = { bold = true },
    --             transparent = true,         -- do not set background color
    --             terminalColors = true,       -- define vim.g.terminal_color_{0,17}
    --             theme = "wave",              -- Load "wave" theme when 'background' option is not set
    --             background = {               -- map the value of 'background' option to a theme
    --                 dark = "wave",           -- try "dragon" !
    --                 light = "lotus"
    --             },
    --             colors = { theme = { all = { ui = { bg_gutter = "none" } } } }
    --         })
    --         vim.cmd("colorscheme kanagawa")
    --     end
    -- },
    -- {
    --     "ellisonleao/gruvbox.nvim",
    --     priority = 1000,
    --     config = function ()
    --         require("gruvbox").setup({
    --             italic = {
    --                 strings = false,
    --                 emphasis = true,
    --                 comments = true,
    --                 operators = false,
    --                 folds = true,
    --             },
    --             contrast = "", -- can be "hard", "soft" or empty string
    --             transparent_mode = true,
    --         })
    --         vim.cmd("colorscheme gruvbox")
    --     end,
    -- }
    -- {
    --     'jesseleite/nvim-noirbuddy',
    --     dependencies = {
    --         { 'tjdevries/colorbuddy.nvim' }
    --     },
    --     lazy = false,
    --     priority = 1000,
    --     opts = {
    --         colors = {
    --             background = '#000000'
    --         }
    --     },
    -- },
    -- {
    --     'kdheepak/monochrome.nvim',
    --     config = function()
    --         vim.cmd 'colorscheme monochrome'
    --     end
    -- }
}
