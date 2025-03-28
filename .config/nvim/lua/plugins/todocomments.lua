return {
    'folke/todo-comments.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {
        signs = false
    },
    keys = {
        {
            "<leader>ft",
            "<cmd>TodoTelescope<CR>",
            desc = "Find TODO comments"
        }
    }
}
