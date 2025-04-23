M = {}

M.cmd = vim.cmd -- to execute Vim commands e.g. cmd('pwd')
M.fn = vim.fn -- to call Vim functions e.g. fn.bufnr()
M.g = vim.g -- a table to access global variables

function M.opt(scope, key, value)
  scopes = { o = vim.o, b = vim.bo, w = vim.wo }
  scopes[scope][key] = value
  if scope ~= 'o' then
    scopes['o'][key] = value
  end
end

function M.map(mode, lhs, rhs, opts)
  options = { noremap = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

return M
