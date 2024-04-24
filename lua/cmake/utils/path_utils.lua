local M = {}

local separator = package.config:sub(1, 1)

M.dir_exists = function(path) return vim.fn.isdirectory(path) == 1 end

M.file_exists = function(filename)
  local f = io.open(filename, "r")
  if f ~= nil then
    io.close(f)
    return true
  else
    return false
  end
end

M.join = function(path1, path2)
  if path1:sub(-1) == separator then
    return path1 .. path2
  else
    return path1 .. separator .. path2
  end
end

M.create_dir = function(path) vim.fn.jobstart({ "mkdir", path }) end

M.read_file = function(filename)
  local f = io.open(filename, "r")
  assert(f ~= nil, "Error opening file: " .. filename)
  local content = f:read("*a")
  io.close(f)
  return content
end

M.create_file = function(filename, content)
  local f = io.open(filename, "w")
  assert(f ~= nil, "Error opening file: " .. filename)
  f:write(content)
  io.close(f)
end

return M
