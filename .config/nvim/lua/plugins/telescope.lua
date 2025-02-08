return {
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.8',
        dependencies = { 'nvim-lua/plenary.nvim' },

        config = function()
            require('telescope').setup({})
            local builtin = require('telescope.builtin')
            vim.keymap.set('n', '<leader>fa', "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>", { desc = "Find all files in PWD" })
            vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Find files in PWD" })
            vim.keymap.set('n', '<leader>fg', builtin.git_files, { desc = "Find files in git reposotory" })
            vim.keymap.set('n', '<C-/>', builtin.git_files, { desc = "Find files in git reposotory" })
            vim.keymap.set('n', '<leader>fw', builtin.live_grep, { desc = "Search for string" })
            vim.keymap.set('n', '<leader>?h', builtin.help_tags, { desc = "Search help tags" })
            vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = "Find open buffers" })
            vim.keymap.set('n', '<leader>f:', builtin.commands, { desc = "Search commands" })
            vim.keymap.set('n', '<leader>fc', "<cmd>Telescope find_files follow=true no_ignore=true hidden=true search_dirs=~/dotfiles/.config/nvim<CR>", { desc = "Search neovim config" })
            vim.keymap.set('n', '<leader>fC', "<cmd>Telescope find_files follow=true no_ignore=true hidden=true search_dirs=~/dotfiles/<CR>", { desc = "Search global config" })
            vim.keymap.set('n', 'z=', builtin.spell_suggest, { desc = "Spell Suggestions" })
        end
    },
    {
        "nvim-telescope/telescope-frecency.nvim",
        version = "*",
        config = function()
            require("telescope").load_extension "frecency"
            vim.keymap.set('n', '<leader>fr', '<cmd>Telescope frecency workspace=CWD<CR>', { desc = "Find recent files in PWD" })
            vim.keymap.set('n', '<leader>fR', '<cmd>Telescope frecency<CR>', { desc = "Find recent files" })
        end,
    }
}
