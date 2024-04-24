local popup = require("plenary.popup")

local M = {}

local win_id = nil
local bufh = nil

local function close_popup()
  vim.api.nvim_win_close(win_id, true)

  win_id = nil
  bufh = nil
end

M.create_popup = function()
  local width = 60
  local height = 10
  local borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" }
  local bufnr = vim.api.nvim_create_buf(false, false)

  local win_id, win = popup.create({
    title = "cmake.nvim",
    line = math.floor(((vim.o.lines - height) / 2) - 1),
    col = math.floor((vim.o.columns - width) / 2),
    minwidth = width,
    minheight = height,
    borderchars = borderchars,
  })

  vim.api.nvim_win_set_option(win.border.win_id, "winhl")

  return {
    bufnr = bufnr,
    win_id = win_id,
  }
end

return M
