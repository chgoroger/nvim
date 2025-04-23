local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local remove_space = augroup('remove_space', {})
local yank_group = augroup('HighlightYank', {})
local python_format_on_save = augroup('python_format_on_save', {})

-- vim.api.nvim_create_autocmd({ "BufWritePost" }, {
--     group = python_format_on_save,
--     pattern = { "*.py" },
--     desc = "Auto-format Python files after saving",
--     callback = function()
--         local fileName = vim.api.nvim_buf_get_name(0)
--         vim.cmd(":silent !black --preview -q " .. fileName)
--         vim.cmd(":silent !isort --profile black --float-to-top -q " .. fileName)
--         vim.cmd(":silent !docformatter --in-place --black " .. fileName)
--     end,
-- })

autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})

autocmd({ "BufWritePre" }, {
    group = remove_space,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})
