local keymap = vim.keymap.set

keymap("n", "<F9>", ":! firefox    %<CR> :startinsert<CR>")
-- vim.cmd([[ autocmd FileType python      nnoremap <buffer> <F9>  ]])
