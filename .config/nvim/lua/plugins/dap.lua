return {
    'mfussenegger/nvim-dap',
    dependencies = {
        'rcarriga/nvim-dap-ui',
        'nvim-neotest/nvim-nio',
        'williamboman/mason.nvim',
        'jay-babu/mason-nvim-dap.nvim',
    },
    config = function()
        local dap = require 'dap'
        local dapui = require 'dapui'

        require('mason-nvim-dap').setup {
            -- Makes a best effort to setup the various debuggers with
            -- reasonable debug configurations
            automatic_installation = true,

            -- You can provide additional configuration to the handlers,
            -- see mason-nvim-dap README for more information
            handlers = {},

            -- You'll need to check that you have the required things installed
            -- online, please don't ask me how to install them :)
            ensure_installed = {
                -- Update this to ensure that you have the debuggers for the langs you want
                'python', 'cppdbg', 'codelldb'
            },
        }

        -- Dap UI setup
        -- For more information, see |:help nvim-dap-ui|
        dapui.setup {
            -- Set icons to characters that are more likely to work in every terminal.
            --    Feel free to remove or use ones that you like more! :)
            --    Don't feel like these are good choices.
            icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
            controls = {
                icons = {
                    pause = '⏸',
                    play = '▶',
                    step_into = '⏎',
                    step_over = '⏭',
                    step_out = '⏮',
                    step_back = 'b',
                    run_last = '▶▶',
                    terminate = '⏹',
                    disconnect = '⏏',
                },
            },
        }

        -- Change breakpoint icons
        -- vim.api.nvim_set_hl(0, 'DapBreak', { fg = '#e51400' })
        -- vim.api.nvim_set_hl(0, 'DapStop', { fg = '#ffcc00' })
        -- local breakpoint_icons = vim.g.have_nerd_font
        --     and { Breakpoint = '', BreakpointCondition = '', BreakpointRejected = '', LogPoint = '', Stopped = '' }
        --   or { Breakpoint = '●', BreakpointCondition = '⊜', BreakpointRejected = '⊘', LogPoint = '◆', Stopped = '⭔' }
        -- for type, icon in pairs(breakpoint_icons) do
        --   local tp = 'Dap' .. type
        --   local hl = (type == 'Stopped') and 'DapStop' or 'DapBreak'
        --   vim.fn.sign_define(tp, { text = icon, texthl = hl, numhl = hl })
        -- end

        dap.listeners.after.event_initialized['dapui_config'] = dapui.open
        dap.listeners.before.event_terminated['dapui_config'] = dapui.close
        dap.listeners.before.event_exited['dapui_config'] = dapui.close

        local dap = require("dap")
        local remap = vim.keymap.set

        remap({ 'n', 'i' }, '<F5>', dap.continue, { desc = "Debug: Start/Continue" })
        remap({ 'n' }, '<leader>dp', dap.continue, { desc = "Debug: Start/Continue" })

        remap({ 'n', 'i' }, '<F1>', dap.step_into, { desc = "Debug: Step Into" })
        remap({ 'n' }, '<leader>di', dap.step_into, { desc = "Debug: Step Into" })

        remap({ 'n', 'i' }, '<F2>', dap.step_over, { desc = "Debug: Step Over" })
        remap({ 'n' }, '<leader>do', dap.step_over, { desc = "Debug: Step Over" })

        remap({ 'n', 'i' }, '<F3>', dap.step_out, { desc = "Debug: Step Out" })
        remap({ 'n' }, '<leader>dO', dap.step_out, { desc = "Debug: Step Out" })

        remap({ 'n' }, '<leader>db', dap.toggle_breakpoint, { desc = "Debug: Toggle Breakpoint" })
        remap({ 'n' }, '<leader>dB', function()
            require('dap').set_breakpoint(vim.fn.input 'Breakpoint condition: ')
        end, { desc = "Debug: Set Breakpoint" })
        remap({ 'n' }, '<leader>ds', require("dapui").toggle, { desc = "Debug: See last session result." })
    end,
}
