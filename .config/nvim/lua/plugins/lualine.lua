return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
        globalstatus = true,
    },
    setup = function()
        require('lualine').setup({})
    end
}
