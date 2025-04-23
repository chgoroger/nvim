local M = {}

function M.getPublicationDate(day)
  local date = require 'press-reports.getDate.date'

  function getDate(weekDay)
    local startDate = date(false)
    return startDate
    -- print(tuesDate:fmt('%m/%d/%y'))
    -- print(tuesDate:fmt('%A, %B %d %Y"'))
  end

  -- print(date(vdate):adddays(tuesday):fmt('%m/%d/%y'))
  function insertNewDate(weekDay)
    local pos = vim.api.nvim_win_get_cursor(0)[2]
    local line = vim.api.nvim_get_current_line()
    local nline = line:sub(0, pos) .. weekDay:fmt '%A, %B %d' .. line:sub(pos + 1)
    vim.api.nvim_set_current_line(nline)
  end

  weekDayDate = getDate(day)
  insertNewDate(weekDayDate)
end

return M
