local M = {}

-- =============================================================
--   Author: Roger Delgado
--     date: Thursday, November 25, 2021
-- Function: gets the date of a particular day of week.
--  example: Sunday = 1, Monday = 2, etc...
-- =============================================================
function M.getDate(day)
  -- =============================================================
  -- library: date.lua
  -- Purpose: Supports date functions in lua
  --   Notes: This plugin depends on this library.
  -- =============================================================
  local date = require 'press-reports.getDate.date'

  -- =============================================================
  -- Function: searchNewDate
  -- Purpose: gets todays date
  -- Return: todays date
  -- =============================================================
  function searchNewDate(weekDay)
    local startDate = date(false)
    return findDate(startDate, weekDay)
    -- print(tuesDate:fmt('%m/%d/%y'))
    -- print(tuesDate:fmt('%A, %B %d %Y"'))
  end
  -- =============================================================
  -- Function: findDate
  -- Purpose: finds the next date of the day of the week given.
  -- Return: date for day of week
  -- example: If today is Monday and you need the date for Wednesday.
  --          This function starts with todays date and adds a day
  --          until it reaches the desired day.
  -- =============================================================
  function findDate(startDate, weekDay)
    day_offset = 1
    for i = 1, 10 do
      if date(startDate):getweekday() == weekDay then
        return startDate
      end
      startDate = date(startDate):adddays(day_offset)
    end
  end
  -- =============================================================
  -- Function: insertNewDate
  -- Purposse: inserts the new date for the weekDay at current cursor.
  -- Return: nil
  -- =============================================================
  function insertNewDate(weekDay)
    local pos = vim.api.nvim_win_get_cursor(0)[2]
    local line = vim.api.nvim_get_current_line()
    local nline = line:sub(0, pos) .. weekDay:fmt '%m/%d/%y' .. line:sub(pos + 1)
    vim.api.nvim_set_current_line(nline)
  end
  -- =============================================================
  -- sets local varible to weekDayDate
  weekDayDate = searchNewDate(day)
  -- =============================================================
  -- calls function to insert weekDayDate
  insertNewDate(weekDayDate)
end

return M
