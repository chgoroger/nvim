local keymap = vim.keymap.set

keymap("n", "<F6>", ":sp<CR> :w<CR> :term pandoc % --pdf-engine=xelatex -o %:r.pdf<CR> :q<CR>")
