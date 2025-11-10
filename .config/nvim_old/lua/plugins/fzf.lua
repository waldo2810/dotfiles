return {
    'junegunn/fzf.vim',
    enabled = false,
    dependencies = {
        'junegunn/fzf', -- make sure fzf binary is installed
    },
    config = function()
        vim.env.FZF_DEFAULT_COMMAND = 'rg --files --hidden --glob "!.git/*"'
        vim.g.rg_command = 'rg --vimgrep --smart-case'
        -- vim.g.fzf_layout = { down = '50%' }
        -- vim.g.fzf_preview_window = ''
    end
}
