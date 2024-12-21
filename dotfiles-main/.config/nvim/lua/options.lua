require "nvchad.options"

-- add yours here!

local o = vim.o
local opt = vim.opt

o.wrap = false
o.linebreak = true
o.relativenumber = true
o.number = true
o.mouse = ""

opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
-- o.cursorlineopt ='both' -- to enable cursorline!
