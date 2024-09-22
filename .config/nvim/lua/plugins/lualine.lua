return {
    -- {
    --     "christopher-francisco/tmux-status.nvim",
    --     lazy = true,
    --     opts = {},
    -- },
    {
        'nvim-lualine/lualine.nvim',
        enabled = false,
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require('lualine').setup {
                options = {
                    icons_enabled = true,
                    theme = 'auto',
                    component_separators = { left = '', right = '' },
                    section_separators = { left = '', right = '' },
                },
                sections = {
                    lualine_a = { 'mode' },
                    lualine_b = { 'branch', 'diff', 'diagnostics' },
                    lualine_c = {
                        'filename',
                        -- {'filename', path = 1},
                        -- {
                        --     require('tmux-status').tmux_windows,
                        --     cond = require('tmux-status').show,
                        --     -- padding = { left = 3 },
                        -- },
                    },
                    lualine_x = { 'encoding', 'fileformat', 'filetype' },
                    lualine_z = {
                        'location',
                        -- {
                        --     require('tmux-status').tmux_session,
                        --     cond = require('tmux-status').show,
                        --     padding = { left = 3 },
                        -- },
                    }
                },
                inactive_sections = {
                    lualine_a = {},
                    lualine_b = {},
                    lualine_c = { 'filename' },
                    lualine_x = { 'location' },
                    lualine_y = {},
                    lualine_z = {}
                },
                tabline = {},
                winbar = {},
                inactive_winbar = {},
                extensions = {}
            }
        end
    }
}
