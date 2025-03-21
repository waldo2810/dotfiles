return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    { "williamboman/mason.nvim",          config = true },
    { "j-hui/fidget.nvim",                opts = {} },
    { "williamboman/mason-lspconfig.nvim" },
    { "folke/neodev.nvim" },
    { "b0o/schemastore.nvim" },
    { "hrsh7th/cmp-nvim-lsp" },
  },
  config = function()
    local lspconfig = require("lspconfig")
    local mason_lspconfig = require("mason-lspconfig")
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

    -- Global on_attach function
    local function on_attach(client, bufnr)
      local function map(keys, func, desc)
        vim.keymap.set("n", keys, func, { buffer = bufnr, desc = "LSP: " .. desc })
      end

      map("gd", require("telescope.builtin").lsp_definitions, "Goto Definition")
      map("gr", require("telescope.builtin").lsp_references, "Goto References")
      map("gi", require("telescope.builtin").lsp_implementations, "Goto Implementation")
      map("go", require("telescope.builtin").lsp_type_definitions, "Type Definition")
      map("<leader>p", require("telescope.builtin").lsp_document_symbols, "Document Symbols")
      map("<leader>P", require("telescope.builtin").lsp_workspace_symbols, "Workspace Symbols")
      map("gl", vim.diagnostic.open_float, "Open Diagnostic Float")
      map("K", vim.lsp.buf.hover, "Hover Documentation")
      map("gs", vim.lsp.buf.signature_help, "Signature Documentation")
      map("gD", vim.lsp.buf.declaration, "Goto Declaration")

      if client.server_capabilities.documentHighlightProvider then
        vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
          buffer = bufnr,
          callback = vim.lsp.buf.document_highlight,
        })
        vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
          buffer = bufnr,
          callback = vim.lsp.buf.clear_references,
        })
      end
    end

    -- Ensure LSP servers are installed
    mason_lspconfig.setup({
      ensure_installed = { "jsonls", "lua_ls", "ts_ls", "pyright", "gopls", "clangd", "templ", "cssls" },
    })

    -- Setup each server
    lspconfig.jsonls.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      settings = {
        json = {
          schemas = require("schemastore").json.schemas(),
          validate = { enable = true },
        },
      },
    })

    lspconfig.lua_ls.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      settings = {
        Lua = {
          runtime = { version = "LuaJIT" },
          workspace = {
            checkThirdParty = false,
            library = {
              "${3rd}/luv/library",
              unpack(vim.api.nvim_get_runtime_file("", true)),
            },
          },
          completion = { callSnippet = "Replace" },
        },
      },
    })

    lspconfig.ts_ls.setup({
      on_attach = function(client, bufnr)
        on_attach(client, bufnr)
        vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>oi",
          "<cmd>lua vim.lsp.buf.execute_command({ command = '_typescript.organizeImports', arguments = {vim.api.nvim_buf_get_name(0)} })<CR>",
          { noremap = true, silent = true })
      end,
      capabilities = capabilities,
    })

    lspconfig.angularls.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      cmd = { "ngserver", "--stdio", "--tsProbeLocations", "", "--ngProbeLocations", "" },
      on_new_config = function(new_config, new_root_dir)
        local project_library_path = new_root_dir
        new_config.cmd = {
          "ngserver",
          "--stdio",
          "--tsProbeLocations", project_library_path,
          "--ngProbeLocations", project_library_path,
        }
      end,
    })

    lspconfig.pyright.setup({ on_attach = on_attach, capabilities = capabilities })
    lspconfig.gopls.setup({ on_attach = on_attach, capabilities = capabilities })
    lspconfig.clangd.setup({ on_attach = on_attach, capabilities = capabilities })
    lspconfig.templ.setup({ on_attach = on_attach, capabilities = capabilities })
    lspconfig.cssls.setup({ on_attach = on_attach, capabilities = capabilities })
  end,
}
