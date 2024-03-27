-- User Keymaps
vim.keymap.set("n", "<C-s>", function()
	vim.cmd.write()
end)
vim.keymap.set("n", "<C-q>", function()
	vim.cmd.quit()
end)
vim.keymap.set("n", "<C-t>", function()
	vim.cmd.tabe()
end)
vim.keymap.set("n", "<C-S-w>", function()
	vim.cmd.close()
end)
vim.keymap.set("n", "<A-t>", function()
	vim.cmd.terminal()
end)
vim.keymap.set("n", "<leader>bn", ":bn<CR>")
vim.keymap.set("n", "<leader>bp", ":bp<CR>")
vim.keymap.set("n", "<leader>bk", ":bp<bar>sp<bar>bn<bar>bd<CR>")
vim.keymap.set("n", "<leader>wq", ":close<CR>")

-- Mapping tab navigation from M-1 to M-5
for i = 1, 5, 1 do
	local key = string.format("<M-%d>", i)
	local command = string.format("%dgt", i)
	vim.keymap.set("n", key, command)
end
