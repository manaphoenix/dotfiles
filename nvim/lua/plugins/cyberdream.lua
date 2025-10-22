return {
    {
        "scottmckendry/cyberdream.nvim",
        name = "cyberdream",
        lazy = false,    -- Colorschemes typically load immediately
        priority = 1000, -- High priority to load before other plugins
        opts = function()
            require("cyberdream").setup({
                transparent = true,
                extensions = {
                    alpha = true,
                    blinkcmp = true,
                    gitsigns = true,
                    lazy = true,
                    mini = true,
                    telescope = true,
                    treesitter = true,
                    treesittercontext = true,
                    whichkey = true,
                },
            })
            vim.cmd("colorscheme cyberdream")
        end,
    },
}
