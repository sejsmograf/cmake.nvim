local popup = require("plenary.popup")

local commands = require("cmake.subcommands")
local run = require("cmake.run")

vim.api.nvim_create_user_command("CM", run.run, {
  nargs = "*",
  desc = "Initialize cmake.nvim configuration, creates .cmake.nvim.json configuration file",
  complete = run.complete,
})
