-- treesitter.lua
return {
    {
        -- Core Treesitter
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        main = "nvim-treesitter.configs",
        event = { "BufReadPost", "BufNewFile" },
        opts = {
            ensure_installed = {
                "lua",
                "python",
                "vim",
                "markdown",
                "markdown_inline",
                "css",
                "html",
            },
            auto_install = true,
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = { "ruby" },
            },
            indent = {
                enable = true,
                disable = { "ruby" },
            },
        },
    },
    {
        -- Treesitter Textobjects
        "nvim-treesitter/nvim-treesitter-textobjects",
        event = "VeryLazy", -- or you can just let treesitter core load it automatically
        config = function()
            require("nvim-treesitter.configs").setup({
                textobjects = {
                    select = {
                        enable = true,
                        lookahead = true,
                        keymaps = {
                            ["af"] = "@function.outer",
                            ["if"] = "@function.inner",
                            ["ac"] = "@class.outer",
                            ["ic"] = "@class.inner",
                            ["at"] = "@tag.outer",
                            ["it"] = "@tag.inner",
                            ["aa"] = "@parameter.outer",
                            ["ia"] = "@parameter.inner",
                        },
                    },
                    move = {
                        enable = true,
                        set_jumps = true,
                        goto_next_start = {
                            ["]f"] = "@function.outer",
                            ["]c"] = "@class.outer",
                        },
                        goto_previous_start = {
                            ["[f"] = "@function.outer",
                            ["[c"] = "@class.outer",
                        },
                    },
                },
            })
        end,
    },
}
