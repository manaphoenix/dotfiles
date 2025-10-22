local M = {
    "goolord/alpha-nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VimEnter",
    cond = function()
        return vim.fn.argc() == 0
    end,
    config = function()
        local alpha = require("alpha")
        local dashboard = require("alpha.themes.dashboard")

        -- ASCII art header with gradient colors
        local function get_header()
            local header_lines = {
                "                    ▒▒▒▒                     ▒▒▒▒▒                   ",
                "               ▒▒▒░░▒                           ▒░▒▒▒▒               ",
                "           ▒▒▒▒▒▒░                                 ░▒▒▒▒▒▒           ",
                "          ▒▒▒▒▒░░                                   ░░░▒▒▒▒▒         ",
                "      ▒  ▒▒▒░░░░                                      ░░░░▒▒  ▒      ",
                "    ▒▒▒ ▒░░░░░░                                       ░░░░░░░ ▒▒▒    ",
                "  ▒▒▒▒▒ ░░░░░░░                                       ░░░░░░░ ░▒▒▒   ",
                " ▒▒▒▒▒░░ ░░░░░░                                       ░░░░░░ ░░░▒▒▒  ",
                " ▒▒▒▒▒░░░ ░░░░░                                       ░░░░░░░░░░▒▒▒▓ ",
                " ▒▒▒▒▒░░░░░░░░░░                                     ░░░░░░░░░░░▒▒▒▒ ",
                "  ▒▒▒░░░░░░░░░░░                                     ░░░░░░░░░░░▒▒▒  ",
                "▒▒ ▒▒░░░░░░░░░░                                       ░░░░░░░░░░░  ▒▒",
                "▒▒▒▒ ░░░░░░░░░░░░                                   ░ ░░░░░░░░░░ ▒▒▒▒",
                "▒▒▒▒▒░░░░░░░░░░░░░                                 ░░ ░░░░░░░░░░▒▒▒▒▒",
                "▒▒▒▒▒▒▒░░░░░░░ ░░░░       ▒▒░░░░                ░░░░ ░░░░░░░░▒▒▒▒▒▒▒",
                " ▒▒▒▒▒▒▒░░░░░░░░ ░░░░           ░░░░░░▒▒▒▒     ░░░░░ ░░░░░░░░░▒▒▒▒▒▒ ",
                "   ▒▒▒▒▒▒░░░░░░░░░░░░░░░░       ░░░░░░░     ░░░░░░ ░░░░░░░░░▒▒▒▒▒▒▒  ",
                "      ▒▒▒▒▒░░░░░░░░░░░░░░░░░    ░░░░░░░   ░░░░░░ ░░░░░░░░░▒▒▒▒▒      ",
                "     ▒▒▒▒▒▒▒▒▒░░░░░░░░░░░░░░░░ ░░░░░░░░░░░░░░░░░░░░░░░░░▒▒▒▒▒▒▒▓     ",
                "       ▓▒▒▒▒▒▒▒▒▒░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▒▒▒▒▒▒▒▒        ",
                "          ▒▒▒▒▒▒▒▒▒▒▒░▒░░░░░░░░░░░░░░░░░░░░░░░▒▒▒▒▒▒▒▒▒▒▒           ",
                "             ▓▒▒▒▒▒▒   ▒▒▒▒▒░░░░░░░░░░░░░▒▒▒▒▒   ▒▒▒▒▒▒▓             ",
                "                  ▒▒▒▒▒    ▒▒░░░░░░░░░░░▒▒    ▒▒▒▒▓                   ",
                "                        ▓     ░░░░░░░░░     ▓                        ",
                "                             ░░░░░░░░░░░                              ",
                "                            ░░░░░░░░░░░░░                             ",
                "                          ▒░░░░░░░░░░░░░░░▒                           ",
                "                         ▒▒▒░░░░░░░░░░░░░░▒▒                          ",
                "                         ▒▒ ░░░░░░░░░░░░░ ▒▒                          ",
                "                           ▒▒▒░░░░░░░ ░░░▒▒                            ",
                "                          ▒▒▒▒▒▒ ░░░ ▒▒▒▒▒▒                           ",
                "                          ▒▒▒▒▒▒ ░░░ ▒▒▒▒▒▒                           ",
                "                            ▒▒▒▒ ▒░░  ▒▒▒                             ",
                "                              ▒▒ ▒▒▒  ▒▒                              ",
                "                               ▓  ▒   ▓                               ",
                "                                  ▒                                  ",
                "                                  ▒                                  ",
            }

            local gradient_colors = {
                "#A05EFF",
                "#B066FF",
                "#C78FFF",
                "#D99FFF",
                "#EBBFFF",
            }

            local result = {}
            for i, line in ipairs(header_lines) do
                local color = gradient_colors[(i - 1) % #gradient_colors + 1]
                local hl_name = string.format("ManaHeaderLine%d", i)
                vim.api.nvim_set_hl(0, hl_name, { fg = color, bold = true })
                table.insert(result, {
                    type = "text",
                    val = line,
                    opts = {
                        hl = hl_name,
                        shrink_margin = false,
                        position = "center",
                        width = 80,
                    },
                })
            end
            return result
        end

        -- Set up dashboard buttons
        local function get_buttons()
            local buttons = {
                type = "group",
                val = {
                    dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>", { desc = "New file" }),
                    dashboard.button("f", "  Find file", ":Telescope find_files <CR>", { desc = "Find file" }),
                    dashboard.button("r", "  Recent files", ":Telescope oldfiles <CR>", { desc = "Recent files" }),
                    dashboard.button("g", "  Find text", ":Telescope live_grep <CR>", { desc = "Find text" }),
                    dashboard.button("c", "  Config",
                        ":cd C:\\Users\\Manaphoenix\\dotfiles\\nvim | e C:\\Users\\Manaphoenix\\dotfiles\\nvim\\init.lua<CR>",
                        { desc = "Config" }),
                    dashboard.button("q", "  Quit NVIM", ":qa<CR>", { desc = "Quit" }),
                },
                position = "center",
            }

            -- Style buttons and shortcuts
            vim.api.nvim_set_hl(0, "ManaphoenixButton", { fg = "#A85FFF" })
            vim.api.nvim_set_hl(0, "ManaphoenixShortcut", { fg = "#FF9F43", bold = true })

            for _, button in ipairs(buttons.val) do
                button.opts = button.opts or {}
                button.opts.hl = "ManaphoenixButton"
                button.opts.hl_shortcut = "ManaphoenixShortcut"
            end

            return buttons
        end

        -- Get a random footer quote
        local function get_footer()
            local quotes = {
                "🔥 Keep the fire burning in your code!",
                "🦜 Code smarter, not harder.",
                "🌌 Explore new plugins today!",
                "🚀 Your Neovim journey begins here.",
                "✨ Embrace the purple flame of creativity!",
            }
            math.randomseed(os.time())
            return {
                type = "text",
                val = quotes[math.random(#quotes)],
                opts = {
                    position = "center",
                    hl = "Comment",
                },
            }
        end

        -- Get header lines and apply center alignment to each line
        local header_lines = get_header()
        for _, line in ipairs(header_lines) do
            if not line.opts then
                line.opts = {}
            end
            line.opts.position = "center"
        end

        -- Create header group
        local header = {
            type = "group",
            val = header_lines,
            opts = {
                position = "center",
                hl = "Normal",
                width = "100%",
            },
        }

        local buttons = get_buttons()
        buttons.opts = buttons.opts or {}
        buttons.opts.position = "center"

        local footer = get_footer()
        footer.opts = footer.opts or {}
        footer.opts.position = "center"

        -- Configure dashboard with centered layout
        dashboard.config = {
            layout = {
                { type = "padding", val = 2 },
                header,
                { type = "padding", val = 2 },
                buttons,
                { type = "padding", val = 2 },
                footer,
            },
            opts = {
                margin = 5, -- Add margin around the entire dashboard
                layout = {
                    spacing = 1,
                    align = "center",
                    padding = 0,
                    width = "100%",
                },
                noautocmd = false,
            },
        }

        -- Set up alpha with the dashboard config
        alpha.setup(dashboard.config)

        -- Autocommand to properly clean up when leaving alpha
        local alpha_grp = vim.api.nvim_create_augroup("AlphaConfig", { clear = true })

        vim.api.nvim_create_autocmd("User", {
            group = alpha_grp,
            pattern = "AlphaReady",
            callback = function()
                vim.opt.laststatus = 0
                vim.opt.showtabline = 0
                vim.opt_local.winbar = ""
            end,
        })

        vim.api.nvim_create_autocmd("User", {
            group = alpha_grp,
            pattern = "AlphaClosed",
            callback = function()
                vim.opt.laststatus = 3
                vim.opt.showtabline = 2
            end,
        })
    end,
    init = function()
        -- Set up keymaps for toggling alpha
        vim.api.nvim_set_keymap("n", "<leader>d", ":Alpha<CR>", { noremap = true, silent = true })
    end,
}

return M
