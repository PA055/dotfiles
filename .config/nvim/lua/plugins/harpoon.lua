return {}
--[[ {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local harpoon = require('harpoon')
        harpoon:setup({})

        -- basic telescope configuration
        local conf = require("telescope.config").values
        local function toggle_telescope(harpoon_files)
            local file_paths = {}
            for _, item in ipairs(harpoon_files.items) do
                table.insert(file_paths, item.value)
            end

            require("telescope.pickers").new({}, {
                prompt_title = "Harpoon",
                finder = require("telescope.finders").new_table({
                    results = file_paths,
                }),
                previewer = conf.file_previewer({}),
                sorter = conf.generic_sorter({}),
            }):find()
        end

        vim.keymap.set("n", "<C-e>", function() toggle_telescope(harpoon:list()) end, { desc = "Open harpoon window" })
        vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end, { desc = "Add to harpoon picker" })

        vim.keymap.set("n", "L", function() harpoon:list():select(1) end, { desc = "Go to 1st harpoon mark" })
        vim.keymap.set("n", "K", function() harpoon:list():select(2) end, { desc = "Go to 2nd harpoon mark" })
        vim.keymap.set("n", "J", function() harpoon:list():select(3) end, { desc = "Go to 3rd harpoon mark" })
        vim.keymap.set("n", "H", function() harpoon:list():select(4) end, { desc = "Go to 4th harpoon mark" })

        vim.keymap.set("n", "<leader>L", function() harpoon:list():select(1) end, { desc = "Replace 1st harpoon mark" })
        vim.keymap.set("n", "<leader>K", function() harpoon:list():select(2) end, { desc = "Replace 2nd harpoon mark" })
        vim.keymap.set("n", "<leader>J", function() harpoon:list():select(3) end, { desc = "Replace 3rd harpoon mark" })
        vim.keymap.set("n", "<leader>H", function() harpoon:list():select(4) end, { desc = "Replace 4th harpoon mark" })

        -- Toggle previous & next buffers stored within Harpoon list
        vim.keymap.set("n", "<leader>hn", function() harpoon:list():prev() end, { desc = "Go to next harpoon mark" })
        vim.keymap.set("n", "<leader>hb", function() harpoon:list():next() end, { desc = "Go to next harpoon mark" })
    end
} ]]
