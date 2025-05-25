require("config.lazy")

local tabSpaces = 4

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.autochdir = true
vim.opt.autoindent = true
vim.opt.copyindent = true
vim.opt.cursorline = true
vim.opt.mousehide = true
vim.opt.scrolloff = 5
vim.opt.smarttab = true
vim.opt.tabstop = tabSpaces
vim.opt.splitright = true
vim.opt.swapfile = false
vim.opt.expandtab = true
vim.opt.shiftwidth = tabSpaces

vim.g.mapleader = ","

vim.keymap.set("n", "<Leader>r", ":w|!gcc %;./a.out <Enter>")
