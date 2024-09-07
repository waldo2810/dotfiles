return {
    {
        'maxmx03/solarized.nvim',
        enabled = false,
        lazy = false,
        priority = 1000,
        config = function()
            require('solarized').setup({
                theme = 'neo',
                -- transparent = true,
            })
            -- vim.cmd.colorscheme 'solarized'
        end,
    },
    {
        "rose-pine/neovim",
        enabled = false,
        name = "rose-pine",
        config = function()
            require("rose-pine").setup({
                dark_variant = "moon", -- main, moon, or dawn
                styles = {
                    bold = true,
                    -- italic = false,
                    -- transparency = true,
                },
            })

            -- vim.cmd("colorscheme rose-pine")
            -- vim.cmd("colorscheme rose-pine-main")
            -- vim.cmd("colorscheme rose-pine-moon")
            -- vim.cmd("colorscheme rose-pine-dawn")
        end
    },
    {
        "rebelot/kanagawa.nvim",
        enabled = false,
        priority = 1000,
        config = function()
            require("kanagawa").setup({
                commentStyle = { italic = true },
                keywordStyle = { italic = true },
                statementStyle = { bold = true },
                -- transparent = true,    -- do not set background color
                terminalColors = true, -- define vim.g.terminal_color_{0,17}
                theme = "wave",        -- Load "wave" theme when 'background' option is not set
                background = {         -- map the value of 'background' option to a theme
                    dark = "wave",     -- try "dragon" !
                    light = "lotus"
                },
                colors = { theme = { all = { ui = { bg_gutter = "none" } } } }
            })

            -- vim.cmd("colorscheme kanagawa")
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
                contrast = "soft", -- can be "hard", "soft" or empty string
                transparent_mode = false,
            })

            -- vim.cmd("colorscheme gruvbox")
        end,
    },
    {
        'jesseleite/nvim-noirbuddy',
        enabled = false,
        dependencies = {
            { 'tjdevries/colorbuddy.nvim' }
        },
        lazy = false,
        priority = 1000,
        opts = {
            colors = {
                background = '#000000'
            }
        },
    },
    {
        'kdheepak/monochrome.nvim',
        enabled = false,
        config = function()
            vim.cmd 'colorscheme monochrome'
        end
    },
    {
        'cranberry-clockworks/coal.nvim',
        enabled = false,
        config = function()
            require('coal').setup({
                colors = {
                    smoky_black = '#000000'
                }
            })
        end
    },
    {
        "Mofiqul/adwaita.nvim",
        enabled = true,
        lazy = false,
        priority = 1000,
        config = function()
            -- vim.g.adwaita_darker = true -- for darker version
            -- vim.g.adwaita_disable_cursorline = true -- to disable cursorline
            -- vim.g.adwaita_transparent = true    -- makes the background transparent
            -- vim.cmd('colorscheme adwaita')
        end
    },
    {
        "blazkowolf/gruber-darker.nvim",
        enabled = false,
        config = function()
            require("gruber-darker").setup({
                bold = true,
                italic = {
                    strings = false,
                },
            })
            vim.cmd.colorscheme("gruber-darker")
        end
    },
    {
        'paulo-granthon/hyper.nvim',
        enabled = false,
        config = function()
            require('hyper').load()
        end
    },
    {
        "aliqyan-21/darkvoid.nvim",
        enabled = false,
        config = function()
            require('darkvoid').setup({
                transparent = false
            })
        end
    },
    {
        'projekt0n/github-nvim-theme',
        enabled = false,
        lazy = false,    -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
            require('github-theme').setup({
                options = {
                    styles = {
                        keywords = 'italic',
                        functions = 'bold,italic',
                        types = 'bold',
                    }
                }
            })

            -- vim.cmd('colorscheme github_dark_default')
        end,
    },

    -- Auto darkmode
    {
        "f-person/auto-dark-mode.nvim",
        enabled = true,
        opts = {
            update_interval = 2000,
            set_dark_mode = function()
                vim.api.nvim_set_option_value("background", "dark", {})
                -- vim.cmd('colorscheme adwaita')
                vim.cmd("colorscheme gruvbox")
            end,
            set_light_mode = function()
                vim.api.nvim_set_option_value("background", "light", {})
                vim.cmd("colorscheme gruvbox")
            end,
        },
    }
}
