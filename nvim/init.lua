-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Make sure 'lua' folder in dotfiles is in runtimepath
vim.opt.rtp:prepend(vim.fn.stdpath("config") .. "/lua")

-- Load plugin configuration
require("plugins")
require("settings")
require("keymaps")
