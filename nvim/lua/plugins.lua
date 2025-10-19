-- lua/plugins.lua
-- Bootstrap example plugins

-- lazy.nvim must already be in runtimepath
local lazy = require("lazy")

lazy.setup({
  -- Treesitter for syntax highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  },

  -- Telescope for fuzzy finding
  { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },

  -- Which-key for keybinding hints
  { "folke/which-key.nvim" },

  -- Optional: color scheme
  { "catppuccin/nvim", name = "catppuccin" },
})
