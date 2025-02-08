return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function ()
        local configs = require("nvim-treesitter.configs")

        configs.setup({
            ensure_installed = { "vim", "vimdoc", "lua", "python", "c", "cpp" },
            sync_install = false,
            auto_install = true,
            indent = { enable = true },
            matchup = { enable = true },
            highlight = {
                enable = true,
                use_languagetree = true,
                additional_vim_regex_highlighting = false,
            },
        })
    end
}
