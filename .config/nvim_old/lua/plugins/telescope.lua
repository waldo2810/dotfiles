return {
  'nvim-telescope/telescope.nvim',
  enabled = true,
  event = 'VimEnter',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
    { 'nvim-telescope/telescope-ui-select.nvim' },
    { 'nvim-tree/nvim-web-devicons',            enabled = vim.g.have_nerd_font },
  },
  config = function()
    require('telescope').setup {
      -- defaults = {
      --   layout_strategy = 'current_buffer' -- flex, horizontal, cursor, center, vertical, current_buffer, bottom_pane
      -- },
    }

    pcall(require('telescope').load_extension, 'fzf')
    pcall(require('telescope').load_extension, 'ui-select')

    -- See `:help telescope.builtin`
    local builtin = require 'telescope.builtin'

    vim.keymap.set('n', '<C-p>', function()
      return builtin.find_files({
        wrap_results = true
      })
    end, { desc = '[S]earch [F]iles' })
    vim.keymap.set('n', '<leader>fg', function()
      return builtin.live_grep({
        wrap_results = true
      })
    end, { desc = '[S]earch by [G]rep' })
    vim.keymap.set('n', '<leader>fr', builtin.resume, { desc = '[S]earch [R]esume' })
    vim.keymap.set('n', '<leader>df', function() builtin.lsp_document_symbols() end,
      { desc = '[D]efinitions on document' })
    vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })
    vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
    vim.keymap.set('n', '<leader>fw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
    vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })

    -- local action_state = require('telescope.actions.state')
    -- vim.keymap.set('n', '<leader><leader>', function()
    --   builtin.buffers({
    --     initial_mode = "normal",
    --     attach_mappings = function(prompt_bufnr, map)
    --       local delete_buf = function()
    --         local current_picker = action_state.get_current_picker(prompt_bufnr)
    --         current_picker:delete_selection(function(selection)
    --           vim.api.nvim_buf_delete(selection.bufnr, { force = true })
    --         end)
    --       end
    --
    --       map('n', 'dd', delete_buf)
    --
    --       return true
    --     end
    --   }, {
    --     sort_lastused = true,
    --     sort_mru = true,
    --     theme = "dropdown"
    --   })
    -- end)
  end,
}
