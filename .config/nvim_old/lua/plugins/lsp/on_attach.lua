return function(client, bufnr)
  local function map(keys, func, desc)
    vim.keymap.set("n", keys, func, { buffer = bufnr, desc = "LSP: " .. desc })
  end

  local builtin = require("telescope.builtin")
  map("gd", builtin.lsp_definitions, "Goto Definition")
  map("gr", function()
    return builtin.lsp_references({
      wrap_results = true
    })
  end, "Goto References")
  map("gi", builtin.lsp_implementations, "Goto Implementation")
  map("go", builtin.lsp_type_definitions, "Type Definition")
  map("<leader>p", builtin.lsp_document_symbols, "Document Symbols")
  map("<leader>P", builtin.lsp_workspace_symbols, "Workspace Symbols")
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
