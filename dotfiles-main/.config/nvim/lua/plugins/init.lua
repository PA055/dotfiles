return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  {
    "ThePrimeagen/vim-be-good",
    cmd="VimBeGood",
  },

  {
    'vyfor/cord.nvim',
    build = './build || .\\build',
    cmd = { "CordConnect", "CordReconnect", "CordDisconnect", "CordTogglePresence", "CordShowPresence", "CordHidePresence", "CordToggleIdle", "CordIdle", "CordUnidle", "CordWorkspace" },
    opts = {}, -- calls require('cord').setup()
  },

  {
    "tversteeg/registers.nvim",
    cmd = "Registers",
    config = true,
    keys = {
      { "\"",    mode = { "n", "v" } },
      { "<C-R>", mode = "i" }
    },
    name = "registers",
  },

  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = { "TodoQuickFix", "TodoLocList", "TodoTelescope" },
    opts = {},
    lazy = false,
  },

  {
    "brenton-leighton/multiple-cursors.nvim",
    config = true,
    keys = {
      {"<A-Down>", "<Cmd>MultipleCursorsAddDown<CR>", mode = {"n", "i"}},
      {"<A-j>", "<Cmd>MultipleCursorsAddDown<CR>"},
      {"<A-Up>", "<Cmd>MultipleCursorsAddUp<CR>", mode = {"n", "i"}},
      {"<A-k>", "<Cmd>MultipleCursorsAddUp<CR>"},
      {"<A-LeftMouse>", "<Cmd>MultipleCursorsMouseAddDelete<CR>", mode = {"n", "i"}},
    },
  },

  {
    "kdheepak/lazygit.nvim",
    lazy = true,
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
      { "<leader>gi", "<cmd>LazyGit<cr>", desc = "LazyGit" }
    }
  },

  {
    'kaarmu/typst.vim',
    ft = 'typst',
    lazy=false,
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
}
