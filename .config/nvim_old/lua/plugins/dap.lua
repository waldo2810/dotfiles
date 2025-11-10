return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "rcarriga/nvim-dap-ui",
        "nvim-neotest/nvim-nio"
    },
    config = function()
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
    end,
    keys = {
        {
            '<leader>Dc',
            function()
                require("dap").continue()
            end,
            desc = 'Debug: Start/Continue'
        },
        {
            '<leader>Dsi',
            function()
                require("dap").step_into()
            end,
            desc = 'Debug: step_into'
        },
        {
            '<leader>Dso',
            function()
                require("dap").step_over()
            end,
            desc = 'Debug: step_over'
        },
        {
            '<leader>DsO',
            function()
                require("dap").step_out()
            end,
            desc = 'Debug: step_over'
        },
        {
            '<leader>Db',
            function()
                require("dap").toggle_breakpoint()
            end,
            desc = 'Debug: toggle_breakpoint'
        },
        {
            '<leader>DB',
            function()
                require("dap").set_breakpoint(vim.fn.input 'Breakpoint condition: ')
            end,
            desc = 'Debug: Set conditional breakpoint'
        },
        {
            '<leader>Dl',
            function()
                require("dap").run_last()
            end,
            desc = 'Debug: run_last'
        },
        {
            '<leader>Dui',
            function()
                require("dapui").toggle()
            end,
            desc = 'Debug: Toggle UI'
        },
    }
}
