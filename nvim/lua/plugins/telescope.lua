return {
    "nvim-telescope/telescope.nvim",
    keys = {
        { "<leader>sh", function() require("telescope.builtin").help_tags() end, desc = "[S]earch [H]elp" },
        { "<leader>sk", function() require("telescope.builtin").keymaps() end, desc = "[S]earch [K]eymaps" },
        { "<leader>sf", function() require("telescope.builtin").find_files() end, desc = "[S]earch [F]iles" },
        { "<leader>ss", function() require("telescope.builtin").builtin() end, desc = "[S]earch [S]elect Telescope" },
        { "<leader>sw", function() require("telescope.builtin").grep_string() end, desc = "[S]earch current [W]ord" },
        { "<leader>sg", function() require("telescope.builtin").live_grep() end, desc = "[S]earch by [G]rep" },
        { "<leader>sd", function() require("telescope.builtin").diagnostics() end, desc = "[S]earch [D]iagnostics" },
        { "<leader>sr", function() require("telescope.builtin").resume() end, desc = "[S]earch [R]esume" },
        { "<leader>s.", function() require("telescope.builtin").oldfiles() end, desc = '[S]earch Recent Files ("." for repeat)' },
        {
            "<leader>/",
            function()
                require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
                    winblend = 10,
                    previewer = false,
                }))
            end,
            desc = "[/] Fuzzily search in current buffer",
        },
        {
            "<leader>s/",
            function()
                require("telescope.builtin").live_grep({
                    grep_open_files = true,
                    prompt_title = "Live Grep in Open Files",
                })
            end,
            desc = "[S]earch [/] in Open Files",
        },
    },
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
