return {
    "mbbill/undotree",
    opts = {},
    config = function()
        vim.keymap.set('n', '<leader>z', vim.cmd.UndotreeToggle, { desc = "toggle undo tree" })
    end
}
