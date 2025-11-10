require("lsp.lua_ls")
require("lsp.ts_ls")
require("lsp.rust_analyzer")

local lsp = vim.lsp

local function format_buf()
    lsp.buf.format({ async = true })
end

local function format_selected()
    local start_pos = vim.api.nvim_buf_get_mark(0, "<")
    local end_pos   = vim.api.nvim_buf_get_mark(0, ">")
    lsp.buf.format({
        async = true,
        range = {
            ["start"] = { start_pos[1] - 1, start_pos[2] },
            ["end"]   = { end_pos[1] - 1, end_pos[2] },
        },
    })
end

local function goto_definition_filtered()
    lsp.buf.definition {
        on_list = function(options)
            local items = vim.tbl_filter(function(item)
                return not string.find(item.filename, "node_modules", 1, true)
            end, options.items)
            if #items == 0 then
                -- If there's only one result total (in node_modules), use it
                if #options.items == 1 then
                    vim.fn.setqflist({}, ' ', { title = options.title, items = options.items })
                    vim.cmd("cfirst")
                else
                    vim.notify("No non-node_modules definitions found")
                end
                return
            end
            vim.fn.setqflist({}, ' ', { title = options.title, items = items })
            vim.cmd("cfirst")
        end,
    }
end

local notified_clients = {}

local function lsp_attach_callback(event)
    local buf = event.buf
    local client = lsp.get_client_by_id(event.data.client_id)

    -- Using nvim-cmp instead of built-in completion
    vim.opt.completeopt = { "menu", "menuone" }
    -- lsp.completion.enable(true, client.id, buf, { autotrigger = true })
    -- vim.keymap.set("i", "<C-space>", function() lsp.completion.get() end)

    vim.keymap.set("n", "<leader>ff", format_buf)
    vim.keymap.set("v", "<leader>ff", format_selected)
    vim.keymap.set("n", "<leader>K", lsp.buf.hover)
    vim.keymap.set("n", "<leader>e", function() vim.diagnostic.open_float(nil, {}) end)
    vim.keymap.set("n", "<leader>tt", function() vim.diagnostic.get(nil) end) -- does not work
    vim.keymap.set("n", "<leader>rn", lsp.buf.rename)
    vim.keymap.set("n", "<leader>ca", lsp.buf.code_action)
    vim.keymap.set("n", "<leader>df", lsp.buf.document_symbol)
    vim.keymap.set("n", "gd", goto_definition_filtered)
    vim.keymap.set("n", "gi", lsp.buf.implementation)
    vim.keymap.set("n", "gr", lsp.buf.references)

    if not notified_clients[client.config.name] then
        vim.notify(string.format("✓ LSP ready: %s %s", client.config.name, vim.inspect(client.config.cmd)))
        notified_clients[client.config.name] = true
    end
end


-- Apply additionalTextEdits (like auto-imports) after completion
local function lsp_complete_done_callback()
    local completed_item = vim.v.completed_item
    if not completed_item or vim.tbl_isempty(completed_item) then
        return
    end

    -- Debug: uncomment to see what we get
    -- vim.notify("completed_item: " .. vim.inspect(completed_item))

    local user_data = completed_item.user_data
    if type(user_data) == "string" then
        local ok, decoded = pcall(vim.json.decode, user_data)
        if ok then
            user_data = decoded
        end
    end

    if not user_data then
        return
    end

    -- Try different paths where completion_item might be stored
    local completion_item = user_data.nvim and user_data.nvim.lsp and user_data.nvim.lsp.completion_item
        or user_data.completion_item
        or user_data

    if not completion_item then
        return
    end

    -- If completion item needs resolving, resolve it first
    local function apply_edits(item)
        if item.additionalTextEdits and #item.additionalTextEdits > 0 then
            vim.lsp.util.apply_text_edits(item.additionalTextEdits, vim.api.nvim_get_current_buf(), 'utf-8')
        end
    end

    -- Check if item needs to be resolved (doesn't have additionalTextEdits yet)
    if not completion_item.additionalTextEdits and completion_item.data then
        -- Need to resolve the completion item
        local bufnr = vim.api.nvim_get_current_buf()
        local clients = vim.lsp.get_clients({ bufnr = bufnr })

        for _, client in ipairs(clients) do
            if client.supports_method('completionItem/resolve') then
                client.request('completionItem/resolve', completion_item, function(err, resolved_item)
                    if err or not resolved_item then
                        return
                    end
                    apply_edits(resolved_item)
                end, bufnr)
                return
            end
        end
    else
        apply_edits(completion_item)
    end
end

vim.api.nvim_create_autocmd('LspAttach', { callback = lsp_attach_callback })

vim.api.nvim_create_autocmd('CompleteDone', { callback = lsp_complete_done_callback })

vim.api.nvim_create_user_command('LspStatus', ":checkhealth vim.lsp", {})
