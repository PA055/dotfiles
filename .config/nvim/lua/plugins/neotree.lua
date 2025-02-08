return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
        "3rd/image.nvim",
    },
    cmd = 'Neotree',
    init = function()
        vim.api.nvim_create_autocmd('BufEnter', {
            group = vim.api.nvim_create_augroup('NeoTreeInit', { clear = true }),
            callback = function()
                local f = vim.fn.expand('%:p')
                if vim.fn.isdirectory(f) ~= 0 then
                    vim.cmd('Neotree current dir=' .. f)
                    vim.api.nvim_clear_autocmds { group = 'NeoTreeInit' }
                end
            end
        })
    end,
    keys = {
        { '<leader>et', '<cmd>Neotree toggle<cr>',  desc = "Show filetree explorer" },
        { '<leader>eb', '<cmd>Neotree buffers<cr>', desc = "Show buffer explorer" },
    },
    opts = {
        filesystem = {
            hijack_netrw_behavior = 'open_current',
            window = {
                mappings = {
                    ['<C-e>'] = 'close_window'
                }
            }
        }
    }
}
