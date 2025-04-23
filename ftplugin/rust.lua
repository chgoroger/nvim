local keymap = vim.keymap.set

keymap("n", "<F9>", ":sp<CR> :term cargo run  %<CR> :startinsert<CR>")
-- vim.cmd([[ autocmd FileType python      nnoremap <buffer> <F9>  ]])
