local M = {}

M.prompt_path = function(prompt, default)
  local path_input = vim.fn.input({
    prompt = "\n" .. prompt,
    default = default,
    complete = "dir",
  })
  return path_input
end

M.prompt_accept = function(message)
  local user_input = vim.fn.input({
    prompt = "\n" .. message .. "\ny/n: ",
  })
  local len = string.len(user_input)
  return len == 1 and string.sub(user_input, 1, 1) == "y"
end

return M
