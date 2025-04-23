-- LoadCMD = require 'core.keybindings.header'

vim.keymap.set("n", "<leader>g", "mzgg=G`z:delmarks z<CR>", { desc = "Format buffer" })

vim.keymap.set('n', '<C-n>', '<cmd>NvimTreeToggle<cr>', { desc = "Nvim Tree Toggle" })
-- Tab in normal mode will move to next buffer
vim.keymap.set('n', '<TAB>', ':bnext<CR>', { noremap = true, silent = true })
-- Shift Tab in normal mode will move to next buffer
vim.keymap.set('n', '<S-TAB>', ':bprevious<CR>', { noremap = true, silent = true })

-- Alternate ways of saving
vim.keymap.set('n', '<leader>ss', ':w<CR>  :luafile $MYVIMRC<CR>', { noremap = true, silent = true })
-- Alternate ways of saving
vim.keymap.set('n', '<F4>', ':w<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-s>', ':w<CR>', { noremap = true, silent = true })

-- Alternate way to quit and save
vim.keymap.set('n', '<C-Q>', ':wq!<CR>', { noremap = true, silent = true })

-- Tab completions
vim.keymap.set('i', '<expr><TAB>', 'pumvisible() ? "\\<C-n>" : "\\<TAB>', { noremap = true, silent = true })

-- Better tabbing
vim.keymap.set('v', '<', '<gv', { noremap = true, silent = true })
vim.keymap.set('v', '>', '>gv', { noremap = true, silent = true })

-- Better window navigation
vim.keymap.set('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
vim.keymap.set('n', '<C-j>', '<C-w>j', { noremap = true, silent = true })
vim.keymap.set('n', '<C-k>', '<C-w>k', { noremap = true, silent = true })
vim.keymap.set('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })

-- Keeping it centered - The Primeagen
vim.keymap.set('n', 'n', 'nzzzv', { noremap = true, silent = true })
vim.keymap.set('n', 'N', 'Nzzzv', { noremap = true, silent = true })
vim.keymap.set('n', 'J', 'mzJ`z', { noremap = true, silent = true })

-- Moving lines in all modes -- The Primeagen
-- Not sure I like the normal mode move
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { noremap = true, silent = true })
-- vim.keymap.set( "i", "<C-j>", "<esc>:m .+1<CR>==i", { noremap = true, silent = true })
-- vim.keymap.set( "i", "<C-K>", "<esc>:m .-2<CR>==i", { noremap = true, silent = true })
-- vim.keymap.set( "n", ";j", ":m .+1<CR>==", { noremap = true, silent = true })
-- vim.keymap.set( "n", ";k", ":m .-2<CR>==", { noremap = true, silent = true })

--------------------------------------------------------------------------------------
-- Vimscript Way
-- Automatically deletes all trailing whitespace and newlines at end of file on save.
-- vim.api.nvim_exec(
--   [[
-- 	autocmd BufWritePre * %s/\s\+$//e
-- 	autocmd BufWritePre * %s/\n\+\%$//e
-- 	autocmd BufWritePre *.[ch] %s/\%$/\r/e
-- ]],
--   true
-- )
--------------------------------------------------------------------------------------
-- Lua Way
local augroup = vim.api.nvim_create_augroup -- Create/get autocommand group
local autocmd = vim.api.nvim_create_autocmd -- Create autocommand




-- surrounds highlighted text with -- {}
vim.api.nvim_buf_set_keymap(0, 'v', '<leader>s{', [[c{<c-r>"}<esc>li]], { noremap = false })
-- surrounds highlighted with []
vim.api.nvim_buf_set_keymap(0, 'v', '<leader>s[', [[c[<c-r>"]<esc>li]], { noremap = false })
-- surrounds highlighted text with -- ()
vim.api.nvim_buf_set_keymap(0, 'v', '<leader>s(', [[c(<c-r>")<esc>li]], { noremap = false })
-- surrounds highlighted text with -- ''
vim.api.nvim_buf_set_keymap(0, 'v', "<leader>s'", [[c'<c-r>"'<esc>li]], { noremap = false })
-- surrounds highlighted text with -- ""
vim.api.nvim_buf_set_keymap(0, 'v', '<leader>s"', [[c"<c-r>""<esc>li]], { noremap = false })
-- =======================================================================================================
