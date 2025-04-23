-- _        _  _____ _______  __
-- | |      / \|_   _| ____\ \/ /
-- | |     / _ \ | | |  _|  \  /
-- | |___ / ___ \| | | |___ /  \
-- |_____/_/   \_\_| |_____/_/\_\
-- _  __
-- | |/ /___ _   _ _ __ ___   __ _ _ __  ___
-- | ' // _ \ | | | '_ ` _ \ / _` | '_ \/ __|
-- | . \  __/ |_| | | | | | | (_| | |_) \__ \
-- |_|\_\___|\__, |_| |_| |_|\__,_| .__/|___/
--          |___/                |_|
-- local wk = require("which-key")
-- wk.add({
--   { "<leader>t", group = "latex" }, -- group
--   { "<leader>td", '<cmd>lua require"press-reports.getPublicationDate".getPublicationDate()<cr>', desc = "Get Date", mode = "n"},
--   { "<leader>tc", ":w<CR>:set makeprg=compiler\\ %<CR>:silent make<CR>", desc = 'compile document with make', mode = "n"},
--   { "<leader>ts", ":!opout <c-r>%<CR><CR>", desc = "Open PDF", mode = "n"},
-- })

local keymap = vim.keymap.set
-- ====================================================
-- variables for getting the date for the following:
-- ====================================================
weekdays = {
	SUNDAY = 1,
	MONDAY = 2,
	TUESDAY = 3,
	WEDNESDAY = 4,
	THURSDAY = 5,
	FRIDAY = 6,
	SATURDAY = 7,
}

-- Latex Compile
-- =========================================================
-- LOAD.map("n", "<F5>", ":w!<CR> :!compiler <c-r>%<CR><CR>")
-- keymap("n", "<F5>", ":w!<CR> :!compiler <c-r>%<CR><CR>")
vim.cmd('set makeprg=compiler')
vim.keymap.set('n', '<F5>', ":w<CR>:set makeprg=compiler\\ %<CR>:silent make<CR>", {desc = 'compile document with make'})

-- View pdf
-- ================================================================================
keymap("n", "<F6>", ":!opout <c-r>%<CR><CR>")

-- cleanup extra files when you compile tex files
-- ================================================================================

-- LOAD.cmd("autocmd VimLeave *.tex !texclear %")
local TexCommands = vim.api.nvim_create_augroup("tex_commands", { clear = true })
vim.api.nvim_create_autocmd("VimLeave", { command = "!texclear %", group = TexCommands })

-- Newspaper Accounts Names
-- =================================================-----=================================
keymap("i", "<leader>dc", "Daily Corinthian - ")
keymap("i", "<leader>dm", "Daily Mountain Eagle - ")
keymap("i", "<leader>bi", "Banner - ")
keymap("i", "<leader>rb", "Red Bay - ")
keymap("i", "<leader>tc", "Tishomingo Co. - ")
keymap("i", "<leader>lc", "Lee County - ")
keymap("i", "<leader>bb", "Bolivar Bulletin - ")
keymap("i", "<leader>bn", "Baldwyn - ")
keymap("i", "<leader>wm", "West Memphis - ")
keymap("i", "<leader>cw", "Crossroads")
keymap("i", "<leader>cc", "Crime Seen")
keymap("i", "<leader>gg", "Gardners")
keymap("i", "<leader>ss", "Silver Star")
keymap("i", "<leader>um", "Univeristy of Memphis")
keymap("i", "<leader>ww", "Weekend - ")

-- insure filemode is tex
-- cmd('autocmd BufRead,BufNewFile *.tex set filetype=tex')

-- Search for jump points <++> added <c-g>u to remove undo break points or fix them
-- =================================================================================
keymap("i", "<Space><Space>", '<ESC>/<++><Enter>"_c4l<c-g>u')
keymap("i", "<leader><Space>", '<ESC>/<++><Enter><ESC>/<++><Enter><ESC>/<++><Enter>"_c4l<c-g>u')
-- keymap("i", "<leader>z", '<++>')
keymap("i", "<leader>z", ':<ESC>vi{s<++>')
keymap("n", "<leader>z", ':<ESC>vi{s<++><ESC>')
keymap("n", "<leader>b", ":s/\\({.*}\\)\\({.*}\\)\\({.*}\\)\\({.*}\\)/\\2{<++>}{<++>}\\4/<Enter>")

-- Newspaper Section Names
-- =========================================================================
keymap("i", "<leader>as", "A-Section")
keymap("i", "<leader>bs", "B-Section")
keymap("i", "<leader>cs", "C-Section")
keymap("i", "<leader>ds", "D-Section")
keymap("i", "<leader>tv", "TV Guide")
keymap("i", "<leader>dcc", "Daily Corinthian - Comics")
keymap("i", "<leader>scc", "Searcy - Comics")
keymap("i", "<leader>pcc", "Paragould - Comics")
keymap("i", "<leader>jcc", "Jonesboro- Comics")

-- Enter Publications Dates -- format mm/dd/yy
-- =============================================================================================================================
keymap("i", "<leader>dsu", '<cmd>lua require"press-reports.getDate".getDate(weekdays.SUNDAY)<cr>') -- Sunday     = 1
keymap("i", "<leader>dmo", '<cmd>lua require"press-reports.getDate".getDate(weekdays.MONDAY)<cr>') -- Monday     = 2
keymap("i", "<leader>dtu", '<cmd>lua require"press-reports.getDate".getDate(weekdays.TUESDAY)<cr>') -- Tuesday    = 3
keymap("i", "<leader>dwe", '<cmd>lua require"press-reports.getDate".getDate(weekdays.WEDNESDAY)<cr>') -- Wednesday  = 4
keymap("i", "<leader>dth", '<cmd>lua require"press-reports.getDate".getDate(weekdays.THURSDAY)<cr>') -- Thursday   = 5
keymap("i", "<leader>dfr", '<cmd>lua require"press-reports.getDate".getDate(weekdays.FRIDAY)<cr>') -- Friday     = 6
keymap("i", "<leader>dsa", '<cmd>lua require"press-reports.getDate".getDate(weekdays.SATURDAY)<cr>') -- Saturday   = 7

-- Enter Publications Dates -- format example(Thursday, September 5, 2021)
-- ===========================================================================================================
keymap("i", "<leader>d", '<cmd>lua require"press-reports.getPublicationDate".getPublicationDate()<cr>')

-- Insert Press notes shortcut
-- ========================================================================================================
keymap("i", ";pr", "\\PressNotes{}<ESC><S-a><CR><CR><++><ESC>2kf{li")

-- Insert Press notes shortcut
-- =========================================================================================================================
keymap("i", ";r", "\\RollInfo{}{<++>}{<++>}{<++>}<Esc><S-a><CR><CR><++><Esc>2k$4F{li")
-- keymap(
	-- "i",
	-- ";rc",
	-- "\\RollInfo{}{<++>}{<++>}{<++>}<Esc><S-a><CR><CR><++><Esc>2ji\\columnbreak<CR><CR><++><Esc><Esc>6k$4F{li"
-- )

-- Insert roll shortcuts -- I get lazy and setup shortcut to enter roll prefix -- This needs to be updated often
-- ==============================================================================================================
keymap("i", "<leader>n", "NS12C0120")
keymap("i", "<leader>b", "B8C0F0103")


-- Shortcut to calculate press report waste
-- ====================================================================================================================
keymap("i", "<leader>u", '<cmd>lua require"press-reports.CalculateWaste".CalculateWaste()<cr>')

-- Shortcut to calculate roll waste
-- =============================================================================================================================
keymap("i", "<leader>w", '<cmd>lua require"press-reports.CalculateRollWaste".CalculateRollWaste()<cr>')
