return {
    "nvim-telescope/telescope.nvim",
    event = "VimEnter", -- or consider lazy-loading via keymaps instead
    dependencies = {
        "nvim-lua/plenary.nvim",
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make",
            cond = function()
                return vim.fn.executable("make") == 1
            end,
        },
        { "nvim-telescope/telescope-ui-select.nvim" },
        {
            "nvim-tree/nvim-web-devicons",
            enabled = vim.g.have_nerd_font,
        },
    },
    config = function()
        local telescope = require("telescope")
        local actions = require("telescope.actions")

        telescope.setup({
            defaults = {
                mappings = {
                    i = {
                        ["<C-k>"] = actions.move_selection_previous,
                        ["<C-j>"] = actions.move_selection_next,
                        ["<C-l>"] = actions.select_default,
                    },
                },
            },
            pickers = {
                find_files = {
                    hidden = true,
                    file_ignore_patterns = { "node_modules", "%.git", "%.venv" },
                },
                live_grep = {
                    file_ignore_patterns = { "node_modules", "%.git", "%.venv" },
                    additional_args = function()
                        return { "--hidden" }
                    end,
                },
            },
            extensions = {
                ["ui-select"] = require("telescope.themes").get_dropdown(),
            },
        })

        pcall(telescope.load_extension, "fzf")
        pcall(telescope.load_extension, "ui-select")
    end,
}
