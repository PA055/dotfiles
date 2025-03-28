return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
        spec = {
            {'<leader>c', group = 'Code', mode = { 'n', 'x' }},
            {'<leader>d', group = 'Debug'},
            {'<leader>e', group = 'Neotree'},
            {'<leader>f', group = 'Find'},
            {'<leader>r', group = 'Rename'},
            {'<leader>t', group = 'Toggle'},
            {'<leader>x', group = 'Trouble'},
            {'<leader>?', group = 'Help'},
        }
  },
  keys = {
    {
      "<leader>?k",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
}
