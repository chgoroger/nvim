local keymap = vim.keymap.set

keymap("n", "<F9>", ":sp<CR> :term lua     %<CR> :startinsert<CR>")
