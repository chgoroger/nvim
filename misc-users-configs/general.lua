-- ------------------------------------------------------------------------------------
-- setting keymaps --------------------------------------------------------------------
-- ------------------------------------------------------------------------------------
local keymap_list = {
	{ "n", "<leader>g", "mzgg=G`z:delmarks z<CR>" },
	{ "n", "<C-n>", "<cmd>NvimTreeToggle<cr>" },
	{ "n", "<TAB>", ":bnext<CR>" },
	{ "n", "<S-TAB>", ":bprevious<CR>" },
	{ "n", "<S-TAB>", ":bprevious<CR>" },
	-- Al ternate ways of saving
	{ "n", "<leader>ss", ":w<CR>  :luafile $MYVIMRC<CR>" },
	{ "n", "<F4>", ":w<CR>" },
	{ "n", "<C-s>", ":w<CR>" },
	-- Alternate way to quit and save
	{ "n", "<C-Q>", ":wq!<CR>" }, -- Tab completions
	{ "i", "<expr><TAB>", 'pumvisible() ? "\\<C-n>" : "\\<TAB>' },
	-- Better tabbing
	{ "v", "<", "<gv" },
	{ "v", ">", ">gv" }, -- Better window navigation
	{ "n", "<C-h>", "<C-w>h" },
	{ "n", "<C-j>", "<C-w>j" },
	{ "n", "<C-k>", "<C-w>k" },
	{ "n", "<C-l>", "<C-w>l" },
	-- Keeping it centered - The Primeagen
	{ "n", "n", "nzzzv" },
	{ "n", "N", "Nzzzv" },
	{ "n", "J", "mzJ`z" },
	-- Moving lines in all modes -- The Primeagen
	-- Not sure I like the normal mode move
	{ "v", "J", ":m '>+1<CR>gv=gv" },
	{ "v", "K", ":m '<-2<CR>gv=gv" },
} -- end list

local opts = {noremap = true, silent = true}
for _, map in ipairs(keymap_list) do
	local mode, key, command = unpack(map)
	vim.keymap.set(mode, key, command, opts)
end

-- ------------------------------------------------------------------------------------
-- setting buffer keymaps -------------------------------------------------------------
-- ------------------------------------------------------------------------------------
local buffer_keymap_list = {
	-- surrounds highlighted text with -- {}
	{ "v", "<leader>s{", [[c{<c-r>"}<esc>li]] }, -- surrounds highlighted with []
	{ "v", "<leader>s[", [[c[<c-r>"]<esc>li]] },
	-- surrounds highlighted text with -- ()
	{ "v", "<leader>s(", [[c(<c-r>")<esc>li]] },
	-- surrounds highlighted text with -- ''
	{ "v", "<leader>s'", [[c'<c-r>"'<esc>li]] },
	-- surrounds highlighted text with -- ""
	{ "v", '<leader>s"', [[c"<c-r>""<esc>li]] },
} -- end list

local buffer_opts = {noremap = false}
for _, map in ipairs(buffer_keymap_list) do
	local mode, key, command = unpack(map)
	vim.api.nvim_buf_set_keymap(0, mode, key, command, buffer_opts )
end
