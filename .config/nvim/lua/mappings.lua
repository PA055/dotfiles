require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", "<C-d>", "<C-d>zz")
map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
-- map("n", "<leader> ", "<leader>fa", { desc = "find files" })
map("n", "<leader>n", "<leader>h", { desc = "new horizontal terminal" })

