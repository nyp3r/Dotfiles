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
vim.o.softtabstop = tabSpaces
vim.opt.splitright = true
vim.opt.swapfile = false
vim.opt.expandtab = true

vim.g.mapleader = ","

vim.keymap.set("n", "<leader>,", "mzA,<Esc>`z", { desc = "add comma to end of line" })
vim.keymap.set("n", "<leader>;", "mzA;<Esc>`z", { desc = "add semicolon to end of line" })
vim.keymap.set("n", "<Leader>r", ":w|!gcc %;./a.out <Enter>", { desc = "save, compile and run program" })
vim.keymap.set("n", "<Leader>l", ":e ~/todo <Enter>", { desc = "open TODO file" })
vim.keymap.set("n", "<Leader>i", ":e ~/funIdeas <Enter>", { desc = "open the file of fun ideas!" })
vim.keymap.set("n", "<Leader>n", ":e ~/Dotfiles/.config/nvim/init.lua <Enter>", { desc = "open init file" })
vim.keymap.set("n", "<Leader>b", ":bnext <Enter>", { desc = "go to next buffer" })
vim.keymap.set("n", "<Leader>t", ":Telescope oldfiles <Enter>", { desc = "open old files with Telescope" })

-- check/uncheck item in checklist with 'æ' and 'ø'
vim.api.nvim_create_autocmd("BufReadPost", {
	callback = function()
		local buf_ID_text = vim.api.nvim_buf_get_lines(0, 0, 1, false)
		vim.api.nvim_echo({ { buf_ID_text[1], "Normal" } }, true, {})
		if buf_ID_text[1] == "--checklist--" then
			vim.keymap.set("n", "æ", "mz0lr✓`z", { desc = "check off that line" })
			vim.keymap.set("n", "ø", "mz0lr `z", { desc = "remove check from line" })
		end
	end,
})

-- Create a new check list with command :NewChecklist {file name}
vim.api.nvim_create_user_command("NewChecklist", function(opts)
	local file_name = opts.args

	repeat
		file_name = vim.fn.input("Enter checklist file name: ", "", "file")
	until file_name ~= ""

	local checklist_path = "/home/nyp3r/checklists/"
	local absolute_file_path = checklist_path .. file_name

	if vim.fn.isdirectory(checklist_path) == 0 then
		vim.fn.mkdir(checklist_path)
	end

	vim.cmd("edit " .. absolute_file_path)

	local bufnr = vim.api.nvim_get_current_buf()

	local content = {
		"--checklist--",
		"[ ] ",
	}

	vim.api.nvim_buf_set_lines(bufnr, 0, 0, false, content)

	vim.api.nvim_win_set_cursor(0, { 2, 4 })

	vim.cmd("startinsert")
end, {
	nargs = "?",
	desc = "Create a new checklist file with a template",
})
