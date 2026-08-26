local cmp = require("cmp")
local trouble = require("trouble")

require("nvim-treesitter").setup({})

vim.api.nvim_create_autocmd("FileType", {
    callback = function()
        local ok, parser = pcall(vim.treesitter.get_parser, 0)
        if ok and parser then
            vim.treesitter.start()
        end
    end,
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

trouble.setup({})

require("render-markdown").setup({
    sign = { enabled = false },
    heading = { icons = {} },
    code = { style = "normal" },
})

vim.g.undotree_SetFocusWhenToggle = 1

vim.keymap.set("n", "<leader>u", ":UndotreeToggle<CR>")
vim.keymap.set("n", "<leader>tt", "<cmd>Trouble diagnostics toggle<cr>")
