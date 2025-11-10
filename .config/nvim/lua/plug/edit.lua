local treesitter = require("nvim-treesitter.configs")
local cmp = require("cmp")

treesitter.setup({
    highlight = { enable = true }
})

cmp.setup({
    sources = {
        { name = 'nvim_lsp' },
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-e>'] = cmp.mapping.abort(),
    }),
    window = {
        completion = {
            border = 'rounded',
            winhighlight = 'Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None',
        },
        documentation = {
            border = 'rounded',
            winhighlight = 'Normal:NormalFloat,FloatBorder:FloatBorder',
        },
    },
})

vim.g.undotree_SetFocusWhenToggle = 1

vim.keymap.set("n", "<leader>u", ":UndotreeToggle<CR>")
