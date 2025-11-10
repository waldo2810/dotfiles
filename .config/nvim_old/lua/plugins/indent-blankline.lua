return {
    "lukas-reineke/indent-blankline.nvim",
    enabled = false,
    main = "ibl",
    config = function()
        local highlight = {
            "MyIndentHighlight"
        }

        local hooks = require "ibl.hooks"
        hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
            vim.api.nvim_set_hl(0, "MyIndentHighlight", { fg = "#404040" })
        end)

        require("ibl").setup({
            indent = {
                char = "",
                tab_char = "",
                -- char = "│",
                -- tab_char = "│",
                highlight = highlight
            },
            scope = { show_start = false, show_end = false },
            exclude = {
                filetypes = {
                    "help",
                    "alpha",
                    "dashboard",
                    "neo-tree",
                    "Trouble",
                    "trouble",
                    "lazy",
                    "mason",
                    "notify",
                    "toggleterm",
                    "lazyterm",
                },
            },
        })
    end
}
