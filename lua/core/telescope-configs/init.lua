
-- require("core.keybindings.header")
require("telescope").setup({
    defaults = {
        mappings = {
            -- Telescope keymaps
            vim.keymap.set(
                "n",
                "<leader>ps",
                '<cmd>lua require("telescope.builtin").grep_string{search = vim.fn.input("Grep For > ")}<cr>'
            ),
            vim.keymap.set("n", "<leader>ff", '<cmd>lua require("telescope.builtin").find_files()<cr>', {desc = "Telescope Find Files"}),
            vim.keymap.set("n", "<leader>fg", '<cmd>lua require("telescope.builtin").live_grep()<cr>', {desc = "Telescope live grep"}),
            vim.keymap.set("n", "<leader>fb", '<cmd>lua require("telescope.builtin").buffers()<cr>', {desc = "Telescope Buffers"}),
            vim.keymap.set("n", "<leader>fh", '<cmd>lua require("telescope.builtin").help_tags()<cr>', {desc = "Telescope Help Tags"}),
            -- my custome telescope keymaps
            vim.keymap.set("n", "<leader>fs", "<cmd>lua require'core.telescope-configs'.PressReports()<cr>", {desc = "Telescope Search in Press Reports Dir"}),
            vim.keymap.set("n", "<leader>fc", "<cmd>lua require'core.telescope-configs'.NeovimConfigs()<cr>", {desc = "Telescope Search NVIM Dir"}),
            vim.keymap.set("n", "<leader>fv", "<cmd>lua require'core.telescope-configs'.VifmConfigs()<cr>", {desc = "Telescope Search VIFM Dir"}),
            -- vim.keymap.set("n", "<leader>cc", "<cmd>lua require'core.colorschemes'.changeColors()<cr>", {desc = "Telescope Change Color Schemes"}),
            vim.keymap.set("i", "<leader>rs", "<cmd>lua require'core.telescope-configs'.openRolls()<cr>", {desc = "Telescope Search for Open Rolls (Press Report Barcodes)"}),
            -- LoadCMD.map("i", "<leader>rr", "<cmd>lua require'core.telescope-configs'.allRolls()<cr>"),
            vim.keymap.set("i", "<leader>rr", "<cmd>lua require'core.telescope-configs'.allRolls()<cr>", {desc = "Telescope Search for All Rolls (Press Report Barcodes)"}),
        },
    },
})

local M = {}
;
-- --------------------------------------------------------------------------------------------
-- used for latex -- my plate reports to search open rolls using my python script
-- --------------------------------------------------------------------------------------------
function M.allRolls()
    local actions = require 'telescope.actions'
    local action_state = require 'telescope.actions.state'
    local pickers = require 'telescope.pickers'
    local finders = require 'telescope.finders'
    local sorters = require 'telescope.sorters'
    local dropdown = require "telescope.themes".get_dropdown()
    local cursor = require "telescope.themes".get_cursor()
    local ivy = require "telescope.themes".get_ivy()

    local input = { 'readFile', '' }
    unpack = unpack or table.unpack

    function createString(inputstr, sep)
        if sep == nil then
            sep = "%s"
        end
        local t = {}
        for str in string.gmatch(inputstr, "([^" .. sep .. "]+)") do
            table.insert(t, str)
        end
        local new_str = "\\RollInfo{" .. t[2] .. "}{<++>}{<++>}{" .. t[1] .. "}"
        insertLine(new_str)
    end

    function insertLine(data)
        local line = vim.api.nvim_get_current_line()
        print(vim.inspect(line))
        local row, col = unpack(vim.api.nvim_win_get_cursor(0))
        print(vim.inspect(col))
        local new_line = line:sub(0, col) .. tostring(data) .. line:sub(col + 1)
        vim.api.nvim_set_current_line(new_line)
        vim.api.nvim_win_set_cursor(0, { row, col + string.len(tostring(data)) })
    end

    function enter(prompt_bufnr)
        local selected = action_state.get_selected_entry()
        -- print(vim.inspect(selected))
        print(vim.inspect(selected[1]))
        actions.close(prompt_bufnr)
        createString(selected[1])
    end

    local opts = {
        finder = finders.new_oneshot_job(input),
        sorter = sorters.get_fzy_sorter(),
        attach_mappings = function(prompt_bufnr, map)
            map('i', '<CR>', enter)
            return true
        end,
    }

    local picker = pickers.new(opts)
    -- print(prompt)
    picker:find()
end

-- --------------------------------------------------------------------------------------------
-- end Funtion allRolls
-- --------------------------------------------------------------------------------------------

-- --------------------------------------------------------------------------------------------
-- used for latex -- my plate reports to search open rolls using my python script
-- --------------------------------------------------------------------------------------------
function M.openRolls()
    local actions = require 'telescope.actions'
    local action_state = require 'telescope.actions.state'
    local pickers = require 'telescope.pickers'
    local finders = require 'telescope.finders'
    local sorters = require 'telescope.sorters'

    local input = { 'openRolls', '' }

    function createString(inputstr, sep)
        if sep == nil then
            sep = "%s"
        end
        local t = {}
        for str in string.gmatch(inputstr, "([^" .. sep .. "]+)") do
            table.insert(t, str)
        end
        local new_str = " \\RollInfo{" .. t[2] .. "}{<++>}{<++>}{" .. t[1] .. "}"
        insertLine(new_str)
    end

    function insertLine(data)
        local line = vim.api.nvim_get_current_line()
        print(vim.inspect(line))
        local row, col = unpack(vim.api.nvim_win_get_cursor(0))
        print(vim.inspect(col))
        local new_line = line:sub(0, col) .. tostring(data) .. line:sub(col + 1)
        vim.api.nvim_set_current_line(new_line)
        vim.api.nvim_win_set_cursor(0, { row, col + string.len(tostring(data)) })
    end

    function enter(prompt_bufnr)
        local selected = action_state.get_selected_entry()
        -- print(vim.inspect(selected))
        print(vim.inspect(selected[1]))
        actions.close(prompt_bufnr)
        createString(selected[1])
    end

    local opts = {
        finder = finders.new_oneshot_job(input),
        sorter = sorters.get_fzy_sorter(),
        attach_mappings = function(prompt_bufnr, map)
            map('i', '<CR>', enter)
            return true
        end,
    }

    local picker = pickers.new(opts)
    -- print(prompt)
    picker:find()
end

-- --------------------------------------------------------------------------------------------
-- end Funtion openRolls
-- --------------------------------------------------------------------------------------------

function M.VifmConfigs()
    require("telescope.builtin").find_files({
        prompt_title = "VIFM CONFIG FILES",
        cwd = "~/.config/vifm/",
        layout_strategy = "horizontal",
        layout_config = { preview_width = 0.65, width = 0.75 },
    })
end

function M.NeovimConfigs()
    require("telescope.builtin").find_files({
        prompt_title = "NEOVIM CONFIG FILES",
        cwd = "~/.config/nvim/",
        layout_strategy = "horizontal",
        layout_config = { preview_width = 0.65, width = 0.75 },
    })
end

function M.PressReports()
    require("telescope.builtin").find_files({
        prompt_title = "BROWSE PRESS REPORTS",
        prompt_prefix = " > ",
        shorten_path = false,
        cwd = "~/Dropbox/PressReports/",

        layout_strategy = "horizontal",
        layout_config = {
            preview_width = 0.65,
        },
        file_ignore_patterns = {
            "Makefiles/",
            "RollLabels/",
            "barcode/",
            "converted/",
            "org-agenda/agenda.org",
            "pdf_files/",
            "rolllists_csv/",
            "style/",
            "tex_files/",
        },
    })
end

return M
