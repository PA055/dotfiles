local remap = vim.keymap.set

remap('n', '<A-v>', "<C-V>", { desc = "Visual Block Mode" })
remap('n', '<Esc>', "<Cmd>noh<CR>", { desc = "general clear highlights" })
remap({ "i", "n", "v", "s" }, "<C-s>", "<Cmd>w<CR><Esc>", { desc = "Save file" })
remap({ "n", "v", "s" }, "<leader>qq", "<Cmd>wqa<CR>", { desc = "Save and Quit all" })

remap("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window" })
remap("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window" })
remap("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window" })
remap("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window" })

remap("n", "n", "'Nn'[v:searchforward].'zv'", { expr = true, desc = "Next Search Result" })
remap({ "x", "o" }, "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
remap("n", "N", "'nN'[v:searchforward].'zv'", { expr = true, desc = "Prev Search Result" })
remap({ "x", "o" }, "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })

remap({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
remap({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
remap({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })
remap({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })

remap("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
remap("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
remap("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
remap("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

remap('n', '<C-d>', '<C-d>zz', { desc = "Move cursor half page down" })
remap('n', '<C-u>', '<C-u>zz', { desc = "Move cursor half page up" })

remap("v", "<A-j>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "Move Down" })
remap("v", "<A-k>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "Move Up" })
remap("n", "<A-j>", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Move Down" })
remap("n", "<A-k>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "Move Up" })

remap('n', 'n', 'nzzzv', { desc = "Next search term" })
remap('n', 'N', 'Nzzzv', { desc = "Previous search term" })

remap('v', '<A-p>', '"_dP', { desc = "Paste without overwrite" })
remap({ 'n', 'v' }, '<leader>p', '"+p', { desc = "Paste from system clipboard" })
remap({ 'n', 'v' }, '<leader>P', '"+P', { desc = "Paste before from system clipboard" })
remap('i', '<C-p>', '<Esc>pa', { desc = "Paste from register" })
remap('i', '<C-P>', '<Esc>"+pa', { desc = "Paste from register" })

remap({ 'n', 'v' }, '<leader>y', '"+y', { desc = "Copy to system clipboard" })
remap('n', '<leader>Y', '"+Y', { desc = "Copy to system clipboard" })

remap({ "n", "v" }, "<A-d>", '"_d', { desc = "Delete to null register" })

remap("v", "<", "<gv")
remap("v", ">", ">gv")

remap("n", "<leader>rf", [[:%s///gI<Left><Left><Left>]], { desc = "Replace last find" })
remap("v", "<leader>rf", [[:s///gI<Left><Left><Left>]], { desc = "Replace last find" })

remap("n", "<leader>qe", ":<c-u><c-r><c-r>='let @'. v:register .' = '. string(getreg(v:register))<cr><c-f><left>", { desc = "Edit macro in selected register" })

remap("i", "<A-h>", "<Left>", { desc = "Move left" })
remap("i", "<A-j>", "<Down>", { desc = "Move down" })
remap("i", "<A-k>", "<Up>", { desc = "Move up" })
remap("i", "<A-l>", "<Right>", { desc = "Move right" })
remap("i", "<C-Left>", "<C-o>b", { desc = "Move back 1 word" })
remap("i", "<C-Right>", "<C-o>w", { desc = "Move forward 1 word" })
remap("i", "<C-A-h>", "<C-o>b", { desc = "Move back 1 word" })
remap("i", "<C-A-l>", "<C-o>w", { desc = "Move forward 1 word" })
remap("i", "<C-BS>", "<C-o>db", { desc = "Delete 1 word" })
remap("i", "<C-Del>", "<C-o>dw", { desc = "Delete 1 word after" })

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
