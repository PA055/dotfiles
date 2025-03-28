local conf = require("config")

vim.g.mapleader = conf.leader
vim.g.maplocalleader = conf.localLeader

vim.g.have_nerd_font = true

vim.opt.mouse = "a"
vim.opt.mousemoveevent = true

vim.opt.whichwrap = "hl<>[]"
vim.opt.confirm = true

-- vim.schedule(function()
--     vim.opt.clipboard = 'unnamedplus'
-- end)

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = conf.indentSize
vim.opt.softtabstop = conf.indentSize
vim.opt.shiftwidth = conf.indentSize
vim.opt.expandtab = true

vim.opt.smartindent = true
vim.opt.breakindent = true

vim.opt.wrap = false
vim.opt.linebreak = true

vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

vim.opt.inccommand = 'split'
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.scrolloff = 10
vim.opt.signcolumn = "yes"

vim.opt.showmode = false
-- vim.opt.cmdheight = 0

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldnestmax = 5

vim.opt.updatetime = 50
