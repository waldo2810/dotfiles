return {
  'stevearc/conform.nvim',
  enabled = true,
  config = function()
    local conform = require('conform')

    conform.setup({
      log_level = vim.log.levels.DEBUG,
      notify_on_error = true,
      formatters_by_ft = {
        lua = { 'stylua' },
        javascript = { "prettierd" },
        javascriptreact = { "prettierd" },
        typescript = { "prettierd" },
        typescriptreact = { "prettierd" },
        json = { "prettierd" },
        python = { "black" },
        java = { "google-java-format" },
        xml = { "xmlformatter" }
      },
      format_on_save = function(bufnr)
        -- Disable with a global or buffer-local variable
        local disable_filetypes = { filetypenamegoeshere = true }
        if disable_filetypes[vim.bo[bufnr].filetype] then
          return
        end
        if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
          return
        end
        return { timeout_ms = 500, lsp_format = "fallback" }
      end,
    })

    vim.keymap.set({ "n", "v" }, "<leader>f", function()
      conform.format({ timeout_ms = 800, lsp_fallback = false })
    end)

    vim.api.nvim_create_user_command("FormatDisable", function(args)
      if args.bang then
        -- FormatDisable! will disable formatting just for this buffer
        vim.b.disable_autoformat = true
      else
        vim.g.disable_autoformat = true
      end
    end, {
      desc = "Disable autoformat-on-save",
      bang = true,
    })
    vim.api.nvim_create_user_command("FormatEnable", function()
      vim.b.disable_autoformat = false
      vim.g.disable_autoformat = false
    end, {
      desc = "Re-enable autoformat-on-save",
    })
  end
}
