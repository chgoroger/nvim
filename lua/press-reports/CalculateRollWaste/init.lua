-- ____      _            _       _
-- / ___|__ _| | ___ _   _| | __ _| |_ ___
-- | |   / _` | |/ __| | | | |/ _` | __/ _ \
-- | |__| (_| | | (__| |_| | | (_| | ||  __/
-- \____\__,_|_|\___|\__,_|_|\__,_|\__\___|
-- ____       _ _  __        __        _
-- |  _ \ ___ | | | \ \      / /_ _ ___| |_ ___
-- | |_) / _ \| | |  \ \ /\ / / _` / __| __/ _ \
-- |  _ < (_) | | |   \ V  V / (_| \__ \ ||  __/
-- |_| \_\___/|_|_|    \_/\_/ \__,_|___/\__\___|
-- ===============================================

local M = {}

-- =============================================================
--   Author: Roger Delgado
--     date: Thursday, November 25, 2021
-- Function: Calculate roll waste for my latex documents
-- =============================================================
function M.CalculateRollWaste()
  -- =============================================================
  -- Function: split
  -- Purpose: splits a string using a delimiter you choose
  -- Return: table with your variables
  -- =============================================================
  function split(s, delimiter)
    result = {}
    for match in (s .. delimiter):gmatch('(.-)' .. delimiter) do
      table.insert(result, match)
    end
    return result
  end

  -- =============================================================
  -- Function: getVariables
  -- Purpose: gets necessary variables from table. Only need the first
  --          and second values.
  -- Return: waste variable (start - stop)
  -- =============================================================
  function getVariables(variables)
    local start, stop = 0, 0
    for key, value in ipairs(variables) do
      -- print(key, value)
      if key == 1 then
        start = string.gsub(value, '\\RollInfo{', '')
      elseif key == 2 then
        stop = value
      end
    end
    return start - stop
  end

  -- =============================================================
  -- Function: rollWaste
  -- Purpose: gets start and stop variables from current line
  -- Return: start - stop
  -- =============================================================

  function rollWaste()
    local line = vim.api.nvim_get_current_line()
    local variables = split(line, '}{')
    local waste = getVariables(variables)
    return waste
  end

  -- =============================================================
  -- Function: insertRollWaste
  -- Purposse: inserts the roll waste variable into buffer at current cursor position
  -- Return: nil
  -- =============================================================
  function insertRollWaste(waste)
    local line = vim.api.nvim_get_current_line()
    local row, col = unpack(vim.api.nvim_win_get_cursor(0))
    local new_line = line:sub(0, col) .. tostring(waste) .. line:sub(col + 1)
    vim.api.nvim_set_current_line(new_line)
    vim.api.nvim_win_set_cursor(0, { row, col + string.len(tostring(waste)) })
  end

  -- =============================================================
  -- sets local varible to roll waste
  local waste = rollWaste()
  -- =============================================================
  -- calls function to insert waste varible
  insertRollWaste(waste)
  -- =============================================================
end

return M
