local print = require("cmake.utils.print_utils")
local run = require("cmake.run")

vim.api.nvim_create_user_command("CM", run.run, {
  nargs = "*",
  desc = "Initialize cmake.nvim configuration, creates .cmake.nvim.json configuration file",
  complete = run.complete,
})
