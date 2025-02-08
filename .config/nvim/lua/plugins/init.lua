return {
    {
        "nvim-tree/nvim-web-devicons",
        opts = {}
    },
    {
        "numToStr/Comment.nvim",
        opts = {}
    },
    {
        'nvim-java/nvim-java',
        priority = 10,
        config = function()
            require('java').setup()
            require('lspconfig').jdtls.setup({})
        end
    },
}
