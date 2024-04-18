local M = {}

local separator = package.config:sub(1, 1)

M.prompt_path = function(prompt, default)
  local path_input = vim.fn.input({
    prompt = prompt,
    default = default,
    complete = "dir",
  })
  return path_input
end

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

M.join_paths = function(path1, path2)
  if path1:sub(-1) == separator then
    return path1 .. path2
  else
    return path1 .. separator .. path2
  end
end

return M
