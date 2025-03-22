local remap = vim.keymap.set

vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('user_lsp_attach', { clear = true }),
    callback = function(event)
        local function opts(desc)
            return { buffer = event.buf, desc = "LSP: " .. desc }
        end

        remap('n', 'K', vim.lsp.buf.hover, opts "Show hover hints")
        remap('i', '<C-k>', vim.lsp.buf.hover, opts "Show hover hints")
        remap({ 'n', 'v' }, '<leader>cf', vim.lsp.buf.format, opts "Format buffer")

        vim.keymap.set({ 'i', 's' }, '<Tab>', function()
           if vim.snippet.active({ direction = 1 }) then
             return '<cmd>lua vim.snippet.jump(1)<cr>'
           else
             return '<Tab>'
           end
         end, { expr = true })

        vim.keymap.set({ 'i', 's' }, '<C-f>', function()
           if vim.snippet.active({ direction = 1 }) then
             return '<cmd>lua vim.snippet.jump(1)<cr>'
           end
         end, { expr = true })

        vim.keymap.set({ 'i', 's' }, '<S-Tab>', function() if vim.snippet.active({ direction = -1 }) then return '<cmd>lua vim.snippet.jump(-1)<cr>'
           else
             return '<S-Tab>'
           end
         end, { expr = true })

        vim.keymap.set({ 'i', 's' }, '<C-F>', function()
           if vim.snippet.active({ direction = -1 }) then
             return '<cmd>lua vim.snippet.jump(-1)<cr>'
           end
         end, { expr = true })

        remap("n", "gD", vim.lsp.buf.declaration, opts "Go to declaration")
        remap("n", "gd", vim.lsp.buf.definition, opts "Go to definition")
        remap("n", "gi", vim.lsp.buf.implementation, opts "Go to implementation")
        remap("n", "<leader>ch", vim.lsp.buf.signature_help, opts "Show signature help")
        remap("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts "Add workspace folder")
        remap("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts "Remove workspace folder")

        remap("n", "<leader>wl", function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, opts "List workspace folders")

        remap("n", "<leader>D", vim.lsp.buf.type_definition, opts "Go to type definition")

        remap({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts "Code action")
        remap("n", "gr", vim.lsp.buf.references, opts "Show references")
    end
})

remap('n', '<A-v>', "<C-V>", { desc = "Visual Block Mode" })
remap('n', '<Esc>', "<Cmd>noh<CR>", { desc = "general clear highlights" })
remap({ "i", "n", "v", "s" }, "<C-s>", "<Cmd>w<CR><Esc>", { desc = "Save file" })
remap({ "n", "v", "s" }, "<leader>qq", "<Cmd>wa<CR><Cmd>qa<CR>", { desc = "Save and Quit all" })

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

remap({ "n", "v" }, "<leader>d", '"_d', { desc = "Delete to null register" })

remap("v", "<", "<gv")
remap("v", ">", ">gv")

remap("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Replace current word" })
remap("n", "<leader>r", [[:%s///gI<Left><Left><Left>]], { desc = "Replace last find" })
remap("v", "<leader>r", [[:s///gI<Left><Left><Left>]], { desc = "Replace last find" })

remap("n", "<leader>qe", ":<c-u><c-r><c-r>='let @'. v:register .' = '. string(getreg(v:register))<cr><c-f><left>", { desc = "Edit macro in selected register" })

remap("i", "<A-h>", "<Left>", { desc = "Move left" })
remap("i", "<A-j>", "<Down>", { desc = "Move down" })
remap("i", "<A-k>", "<Up>", { desc = "Move up" })
remap("i", "<A-l>", "<Right>", { desc = "Move right" })
remap("i", "<C-Left>", "<C-o>b", { desc = "Move back 1 word" })
remap("i", "<C-Right>", "<C-o>w", { desc = "Move forward 1 word" })
remap("i", "<C-A-h>", "<C-o>b", { desc = "Move back 1 word" })
remap("i", "<C-A-l>", "<C-o>w", { desc = "Move forward 1 word" })
remap("i", "<C-Backspace>", "<Esc>dbxi", { desc = "Delete 1 word" })
remap("i", "<C-Delete>", "<Esc>dwi", { desc = "Delete 1 word after" })
