require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

map({ "n", "v" }, "j", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map({ "n", "v" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map({ "n", "v" }, "k", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })
map({ "n", "v" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })

map("n", "<S-h>", function()
  require("nvchad.tabufline").prev()
end, { desc = "Prev Buffer" })

map("n", "<S-l>", function()
  require("nvchad.tabufline").next()
end, { desc = "Next Buffer" })

map("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Search For TODO's" })
