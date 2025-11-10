local dap = require("dap")
local dapui = require("dapui")

dapui.setup()

-- dap.listeners.after.event_initialized['dapui_config'] = dapui.open
-- dap.listeners.before.event_terminated['dapui_config'] = dapui.close
-- dap.listeners.before.event_exited['dapui_config'] = dapui.close

dap.listeners.before.attach.dapui_config = function()
    dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
    dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
    dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
    dapui.close()
end

dap.configurations.java = {
    {
        type = 'java',
        request = 'attach',
        name = "Attach to Spring Boot",
        hostName = "127.0.0.1",
        port = 5005
    }
}

vim.keymap.set("n", "<leader>Dc", function() dap.continue() end, {desc = 'Debug: Start/Continue'})
vim.keymap.set("n", "<leader>Dsi", function() dap.step_into() end, {desc = 'Debug: step_into'})
vim.keymap.set("n", "<leader>Dso", function() dap.step_over() end, {desc = 'Debug: step_over'})
vim.keymap.set("n", "<leader>DsO", function() dap.step_out() end, {desc = 'Debug: step_out'})
vim.keymap.set("n", "<leader>Db", function() dap.toggle_breakpoint() end, {desc = 'Debug: toggle_breakpoint'})
vim.keymap.set("n", "<leader>DB", function() dap.set_breakpoint(vim.fn.input 'Breakpoint condition: ') end, {desc = 'Debug: Set conditional breakpoint'})
vim.keymap.set("n", "<leader>Dl", function() dap.run_last() end, {desc = 'Debug: run_last'})
vim.keymap.set("n", "<leader>Dui", function() dapui.toggle() end, {desc = 'Debug: Toggle UI'})
