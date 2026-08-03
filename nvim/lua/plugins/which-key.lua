return {
    -- Hints keybinds
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
        spec = {
            { "<leader>s", group = "Search", icon = "󰍉" },
            { "<leader>c", group = "Code", icon = "󰆏" },
            { "<leader>d", group = "Dashboard", icon = "󰎆" },
            { "<leader>f", group = "Format", icon = "󰹡" },
            { "<leader>t", group = "LSP", icon = "󰙅" },
            { "<leader><leader>", group = "Run", icon = "󰜺" },
        },
    },
}
