vim.g.loaded_perl_provider = 0
vim.g.loaded_luarocks = 1

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

-- Set leader key
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require("settings")

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- import your plugins
    { import = "plugins" },
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "cyberdream" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})

require("keymaps")
