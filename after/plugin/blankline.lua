local highlight = {
    "RainbowRed",
    "RainbowYellow",
    "RainbowBlue",
    "RainbowOrange",
    "RainbowGreen",
    "RainbowViolet",
    "RainbowCyan",
}

local hooks = require "ibl.hooks"
-- create the highlight groups in the highlight setup hook, so they are reset
-- every time the colorscheme changes
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
    vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
    vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
    vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
    vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
    vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
    vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
    vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
end)

require("ibl").setup { indent = { highlight = highlight } }


-- require('ibl').setup {
--   buftype_exclude = { 'terminal' },
--   filetype_exclude = { 'dashboard', 'NvimTree', 'packer' },
--   show_current_context = true,
--   context_patterns = {
--     'class',
--     'return',
--     'function',
--     'method',
--     '^if',
--     '^while',
--     'jsx_element',
--     '^for',
--     '^object',
--     '^table',
--     'block',
--     'arguments',
--     'if_statement',
--     'else_clause',
--     'jsx_element',
--     'jsx_self_closing_element',
--     'try_statement',
--     'catch_clause',
--     'import_statement',
--     'operation_type',
--   },
-- }
