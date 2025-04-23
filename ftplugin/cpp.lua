
vim.keymap.set("n", "<F9>", ":sp<CR> :term . C_Plus_Compiler <CR> :startinsert<CR>")
vim.keymap.set("n", "<F5>", ":sp<CR> :term . C_Plus_Make <CR> :startinsert<CR>")
vim.keymap.set("n", "<F6>", ":make<CR>")
vim.cmd('set makeprg=C_Plus_Make')
