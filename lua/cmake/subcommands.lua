local Path = require("cmake.utils.path_utils")
local Print = require("cmake.utils.print_utils")
local UI = require("cmake.ui")
local user_config = require("cmake.user_config")
require("cmake.constants")

local M = {}

M.pop = function() UI.create_popup() end

M.init = function() user_config.create_user_config() end

M.show = function()
  local config = user_config.get_user_config()
  local config_str = Print.table_to_string(config)
  print(config_str)
end

M.configure = function()
  local config = user_config.get_user_config()
  local command = string.format(
    "cmake -%s -S %s -B %s",
    EXPORT_COMPILE_COMMANDS_FLAG,
    config.source_dir,
    config.build_dir
  )
  vim.fn.jobstart(command)
end

M.build = function()
  local config = user_config.get_user_config()
  local command = string.format("cmake --build %s", config.build_dir)
  vim.fn.jobstart(command)
end

return M
