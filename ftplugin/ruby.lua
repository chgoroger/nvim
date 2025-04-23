local keymap = vim.keymap.set

keymap("n", "<F9>", ":sp<CR> :term ruby %<CR> :startinsert<CR>")
-- vim.cmd([[ autocmd FileType python      nnoremap <buffer> <F9>  ]])
