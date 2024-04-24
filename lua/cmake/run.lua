local subcommands = require("cmake.subcommands")
local M = {}

M.complete = function(arg, cmd_line)
  local matches = {}

  local words = vim.split(cmd_line, " ", { trimempty = true })
  if not vim.endswith(cmd_line, " ") then
    table.remove(words, #words)
  end

  if #words == 1 then
    for subcommand in pairs(subcommands) do
      if vim.startswith(subcommand, arg) and subcommand ~= "setup" then
        table.insert(matches, subcommand)
      end
    end
  end

  return matches
end

M.run = function(subcommand)
  if #subcommand.fargs == 0 then
    error("No subcommand chosen")
  end

  local subcommands_func = subcommands[subcommand.fargs[1]]

  subcommands_func()
end

return M
