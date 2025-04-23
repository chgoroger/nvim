local keymap = vim.keymap.set


vim.cmd('compiler pyunit')
vim.cmd('set makeprg=python3\\ %')
vim.cmd('setlocal errorformat=%f:%l:%c:\\ %t%n\\ %m')
keymap("n", "<F9>", ":sp<CR> :term python3 %<CR> :startinsert<CR>")

-- keymap("n", "<F9>", ":term make %<CR>")
-- vim.keymap.set('n', '<F9>', function()
--   vim.cmd('below split')
--   vim.cmd('terminal')
--   vim.fn.feedkeys('a')
--   local enter = vim.api.nvim_replace_termcodes("<CR>", true, true, true)
--   vim.fn.feedkeys('clear' .. enter)
--   vim.fn.feedkeys('python3 %' .. enter)
-- end)
-- vim.cmd([[ autocmd FileType python      nnoremap <buffer> <F9>  ]])
