local function setup_mini()
    -- Clone 'mini.nvim' manually in a way that it gets managed by 'mini.deps'
    local path_package = vim.fn.stdpath('data') .. '/site/'
    local mini_path = path_package .. 'pack/deps/start/mini.nvim'
    print(mini_path)
    if not vim.loop.fs_stat(mini_path) then
        vim.cmd('echo "Installing `mini.nvim`" | redraw')
        local clone_cmd = {
            'git', 'clone', '--filter=blob:none',
            'https://github.com/nvim-mini/mini.nvim', mini_path
        }
        vim.fn.system(clone_cmd)
        vim.cmd('packadd mini.nvim | helptags ALL')
        vim.cmd('echo "Installed `mini.nvim`" | redraw')
    end

    require('mini.deps').setup({ path = { package = path_package } })
end

setup_mini()

local add = MiniDeps.add

add({ source = "ellisonleao/gruvbox.nvim" })
add({ source = "theprimeagen/harpoon", checkout = "harpoon2", depends = { "nvim-lua/plenary.nvim" } })
add({ source = "junegunn/fzf" })
add({ source = "junegunn/fzf.vim" })
add({ source = "stevearc/oil.nvim" })
add({ source = "hrsh7th/nvim-cmp" })
add({ source = "hrsh7th/cmp-nvim-lsp" })
add({ source = "tpope/vim-fugitive" })
add({ source = "tpope/vim-sleuth" })
add({ source = "mbbill/undotree" })
add({ source = "mfussenegger/nvim-jdtls" })
add({ source = "mfussenegger/nvim-dap", depends = { "rcarriga/nvim-dap-ui", "nvim-neotest/nvim-nio" } })
add({ source = "mfussenegger/nvim-dap", depends = { "rcarriga/nvim-dap-ui", "nvim-neotest/nvim-nio" } })
add({ source = "nvim-treesitter/nvim-treesitter", hooks = { post_checkout = function() vim.cmd('TSUpdate') end } })
add({ source = "maxmx03/solarized.nvim" })

require("plug.colors")
require("plug.harpoon")
require("plug.navigate")
require("plug.edit")
require("plug.debug")
