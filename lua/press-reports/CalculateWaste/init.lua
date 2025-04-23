-- ____      _            _       _
-- / ___|__ _| | ___ _   _| | __ _| |_ ___
-- | |   / _` | |/ __| | | | |/ _` | __/ _ \
-- | |__| (_| | | (__| |_| | | (_| | ||  __/
-- \____\__,_|_|\___|\__,_|_|\__,_|\__\___|
-- __        __        _
-- \ \      / /_ _ ___| |_ ___
--  \ \ /\ / / _` / __| __/ _ \
--   \ V  V / (_| \__ \ ||  __/
--    \_/\_/ \__,_|___/\__\___|
-- ===========================================
local M = {}

-- =============================================================
--   Author: Roger Delgado
--     date: Thursday, November 25, 2021
-- Function: Calculate waste for my latex documents
-- =============================================================
function M.CalculateWaste()
	-- =============================================================
	-- Function: getNet
	-- Purpose: gets the net press run value
	-- Return: net value
	-- =============================================================
	function getNet()
		local net_line = vim.api.nvim_buf_get_lines(0, 65, 66, false)
		local _, _, net = string.find(net_line[1], "(%{%d+%})")
		net = removeCurlyBraces(net)
		return net
	end
	-- =============================================================
	-- Function: getGross
	-- Purpose: gets the gross press run value
	-- Return: gross value
	-- =============================================================
	function getGross()
		local gross_line = vim.api.nvim_buf_get_lines(0, 66, 67, false)
		local _, _, gross = string.find(gross_line[1], "(%{%d+%})")
		gross = removeCurlyBraces(gross)
		return gross
	end
	-- =============================================================
	-- Function: removeCurlyBraces
	-- Purpose: strip {} from the current string
	-- Return: string without curly braces
	-- =============================================================
	function removeCurlyBraces(temp)
		temp = temp:gsub("%{", "")
		temp = temp:gsub("%}", "")
		return temp
	end
	-- =============================================================
	-- Function: insertWaste
	-- Purposse: inserts the waste variable into buffer at current cursor position
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
	-- sets local varible to net value
	local net = getNet()
	-- =============================================================
	-- sets local varible to gross value
	local gross = getGross()
	-- =============================================================
	-- calls function to insert waste varible
	insertRollWaste(gross - net)
end

return M
