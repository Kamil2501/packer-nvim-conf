vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set({"i", "n"}, "<C-s>", function ()
	vim.cmd.Prettier()
	vim.cmd.w()
end)
