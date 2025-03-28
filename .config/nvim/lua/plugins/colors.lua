return {
    {
        'folke/tokyonight.nvim',
        priority = 1000,
        init = function()
            -- vim.cmd.colorscheme 'tokyonight-night'
            vim.cmd.hi 'Comment gui=none'
        end,
    },
    {
        "cdmill/neomodern.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("neomodern").setup({
                theme = "coffeecat"
            })
            -- require("neomodern").load()
        end,
    },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function ()
            require("catppuccin").setup({
                flavor = "frappe"
            })
            require("catppuccin").load()
        end
    }
}
