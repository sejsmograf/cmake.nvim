local M = {}

local bufnr = nil
local winnr = nil

M.open_floating_window = function(content)
  local width = 80
  local height = 24

  local current_win = vim.api.nvim_get_current_win()
  local current_win_width = vim.api.nvim_win_get_width(current_win)
  local current_win_height = vim.api.nvim_win_get_height(current_win)

  bufnr = vim.api.nvim_create_buf(false, false)
  vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, content)

  winnr = vim.api.nvim_open_win(bufnr, true, {
    relative = "win",
    width = width,
    height = height,
    row = (current_win_height - height) / 2,
    col = (current_win_width - width) / 2,
  })

  vim.api.nvim_buf_set_option(bufnr, "modifiable", false)
  vim.api.nvim_win_set_option(winnr, "number", false)
  vim.api.nvim_win_set_option(winnr, "rnu", false)

  vim.api.nvim_buf_set_keymap(
    bufnr,
    "n",
    "q",
    string.format(":bdelete! %d<CR>", bufnr),
    {
      silent = true,
    }
  )
end

return M
