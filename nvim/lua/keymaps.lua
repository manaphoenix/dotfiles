local telescope_builtin = require("telescope.builtin")
local telescope_themes = require("telescope.themes")
local silicon_status, silicon = pcall(require, "nvim-silicon")

local opts = { noremap = true, silent = true }

-- Leader keys setup
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Scroll and center cursor
vim.keymap.set("n", "<C-d>", "<C-d>zz", opts, { desc = "move down centered" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", opts, { desc = "move up centered" })

-- Search and center matches
vim.keymap.set("n", "n", "nzzzv", opts, { desc = "next match centered" })
vim.keymap.set("n", "N", "Nzzzv", opts, { desc = "previous match centered" })

-- Disable space default behavior in normal and visual modes
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Keymaps
vim.keymap.set("n", "-", "<cmd>Oil --float<CR>", { desc = "Open Oil" })

-- Source the current file (useful for init.lua)
vim.keymap.set("n", "<leader><leader>x", "<cmd>source %<CR>", { desc = "Source current file" })

-- Telescope plugin keymaps
vim.keymap.set("n", "<leader>sh", telescope_builtin.help_tags, { desc = "[S]earch [H]elp" })
vim.keymap.set("n", "<leader>sk", telescope_builtin.keymaps, { desc = "[S]earch [K]eymaps" })
vim.keymap.set("n", "<leader>sf", telescope_builtin.find_files, { desc = "[S]earch [F]iles" })
vim.keymap.set("n", "<leader>ss", telescope_builtin.builtin, { desc = "[S]earch [S]elect Telescope" })
vim.keymap.set("n", "<leader>sw", telescope_builtin.grep_string, { desc = "[S]earch current [W]ord" })
vim.keymap.set("n", "<leader>sg", telescope_builtin.live_grep, { desc = "[S]earch by [G]rep" })
vim.keymap.set("n", "<leader>sd", telescope_builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
vim.keymap.set("n", "<leader>sr", telescope_builtin.resume, { desc = "[S]earch [R]esume" })
vim.keymap.set("n", "<leader>s.", telescope_builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })

vim.keymap.set("n", "<leader>/", function()
	telescope_builtin.current_buffer_fuzzy_find(telescope_themes.get_dropdown({
		winblend = 10,
		previewer = false,
	}))
end, { desc = "[/] Fuzzily search in current buffer" })

vim.keymap.set("n", "<leader>s/", function()
	telescope_builtin.live_grep({
		grep_open_files = true,
		prompt_title = "Live Grep in Open Files",
	})
end, { desc = "[S]earch [/] in Open Files" })

-- nvim-silicon plugin keymaps (only if plugin is available)
if silicon_status then
	vim.keymap.set("v", "<leader>cn", function()
		silicon.clip()
	end, { desc = "Copy code screenshot to clipboard" })

	vim.keymap.set("v", "<leader>cf", function()
		silicon.file()
	end, { desc = "Save code screenshot as file" })

	vim.keymap.set("v", "<leader>cs", function()
		silicon.shoot()
	end, { desc = "Create code screenshot" })
end


-- Reusable terminal management
local terminal_bufnr = nil

local function run_command_in_reusable_terminal(cmd)
    local cur_win = vim.api.nvim_get_current_win()

    if terminal_bufnr and vim.api.nvim_buf_is_loaded(terminal_bufnr) then
        for _, win in ipairs(vim.api.nvim_list_wins()) do
            if vim.api.nvim_win_get_buf(win) == terminal_bufnr then
                vim.api.nvim_win_close(win, true)
                break
            end
        end
        pcall(vim.api.nvim_buf_delete, terminal_bufnr, { force = true })
        terminal_bufnr = nil
    end

    vim.cmd("botright split")
    vim.cmd("resize 10")
    vim.cmd("terminal " .. table.concat(cmd, " "))

    terminal_bufnr = vim.api.nvim_get_current_buf()
    vim.api.nvim_buf_set_name(terminal_bufnr, "__reusable_terminal__")

    vim.api.nvim_set_current_win(cur_win)
end

vim.keymap.set("n", "<leader><leader>l", function()
    run_command_in_reusable_terminal({ "lua", vim.fn.expand("%") })
end, { desc = "Run Lua file in reusable terminal" })

vim.keymap.set("n", "<leader><leader>p", function()
    run_command_in_reusable_terminal({ "python", vim.fn.expand("%") })
end, { desc = "Run Python file in reusable terminal" })

-- Close reusable terminal if open
vim.keymap.set("n", "<leader><leader>q", function()
    if terminal_bufnr and vim.api.nvim_buf_is_loaded(terminal_bufnr) then
        for _, win in ipairs(vim.api.nvim_list_wins()) do
            if vim.api.nvim_win_get_buf(win) == terminal_bufnr then
                vim.api.nvim_win_close(win, true)
            end
        end
        pcall(vim.api.nvim_buf_delete, terminal_bufnr, { force = true })
        terminal_bufnr = nil
        print("Reusable terminal closed.")
    else
        print("No reusable terminal to close.")
    end
end, { desc = "Close reusable terminal anywhere" })
