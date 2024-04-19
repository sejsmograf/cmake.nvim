local M = {}

M.json_encode = function(table) return vim.json.encode(table) end
M.json_decode = function(str) return vim.json.decode(str) end

return M
