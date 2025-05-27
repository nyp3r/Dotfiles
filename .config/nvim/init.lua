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

vim.keymap.set("n", "<leader>,", "mzA,<Esc>`z", { desc = "add comma to end of line" })
vim.keymap.set("n", "<leader>;", "mzA;<Esc>`z", { desc = "add semicolon to end of line" })
vim.keymap.set("n", "<Leader>r", ":w|!gcc %;./a.out <Enter>", { desc = "save, compile and run program"})
vim.keymap.set("n", "<Leader>l", ":e ~/todo <Enter>", { desc = "open TODO file"})
vim.keymap.set("n", "<Leader>i", ":e ~/funIdeas <Enter>", {desc = "open the file of fun ideas!"})
vim.keymap.set("n", "<Leader>n", ":e ~/Dotfiles/.config/nvim/init.lua <Enter>", {desc = "open init file"})
