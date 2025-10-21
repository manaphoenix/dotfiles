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
                    cmp = true,
                    dashboard = true,
                    fzflua = true,
                    gitpad = true,
                    gitsigns = true,
                    grapple = true,
                    grugfar = true,
                    heirline = true,
                    helpview = true,
                    hop = true,
                    indentblankline = true,
                    kubectl = true,
                    lazy = true,
                    leap = true,
                    markdown = true,
                    markview = true,
                    mini = true,
                    noice = true,
                    neogit = true,
                    notify = true,
                    rainbow_delimiters = true,
                    snacks = true,
                    telescope = true,
                    treesitter = true,
                    treesittercontext = true,
                    trouble = true,
                    whichkey = true,
                },
            })
            vim.cmd("colorscheme cyberdream")
        end,
    },
}
