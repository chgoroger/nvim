-- vim.cmd([[ autocmd FileType python      nnoremap <buffer> <F9> :sp<CR> :term python3    %<CR> :startinsert<CR> ]])
-- vim.cmd([[ autocmd FileType perl        nnoremap <buffer> <F9> :sp<CR> :term perl       %<CR> :startinsert<CR> ]])
-- vim.cmd([[ autocmd FileType bash        nnoremap <buffer> <F9> :sp<CR> :term bash       %<CR> :startinsert<CR> ]])
-- vim.cmd([[ autocmd FileType sh          nnoremap <buffer> <F9> :sp<CR> :term bash       %<CR> :startinsert<CR> ]])
-- vim.cmd([[ autocmd FileType javascript  nnoremap <buffer> <F9> :sp<CR> :term node       %<CR> :startinsert<CR> ]])
-- vim.cmd([[ autocmd FileType typescript  nnoremap <buffer> <F9> :sp<CR> :term node       %<CR> :startinsert<CR> ]])
-- vim.cmd(
-- [[ autocmd FileType tex         nnoremap <buffer> <F9> :sp<CR> :w<CR> :term rubber --pdf   %<CR> :startinsert<CR> ]]
-- )
-- vim.cmd([[ autocmd FileType raku        nnoremap <buffer> <F9> :sp<CR> :term raku       %<CR> :startinsert<CR> ]])
-- vim.cmd([[ autocmd FileType lua         nnoremap <buffer> <F9> :sp<CR> :term lua        %<CR> :startinsert<CR> ]])
-- vim.cmd([[ autocmd FileType html        nnoremap <buffer> <F9> :! firefox    %<CR> :startinsert<CR> ]])
-- vim.cmd([[ autocmd FileType rust        nnoremap <buffer> <F9> :sp<CR> :term cargo run  %<CR> :startinsert<CR> ]])
-- vim.cmd(
-- 	[[ autocmd FileType nroff       nnoremap <buffer> <F9> :sp<CR> :w<CR> :term groff -Tpdf % > %:r.pdf<CR> :q<CR> ]]
-- )
vim.cmd(
	[[ autocmd FileType vimwiki     nnoremap <buffer> <F9> :sp<CR> :w<CR> :term pandoc % --pdf-engine=xelatex -o %:r.pdf<CR> :q<CR> ]]
)
