local opts = { noremap = true, silent = true }

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

-- nvim-silicon plugin keymaps (lazily loaded on first use)
vim.keymap.set("v", "<leader>cn", function()
	require("nvim-silicon").clip()
end, { desc = "Copy code screenshot to clipboard" })

vim.keymap.set("v", "<leader>cf", function()
	require("nvim-silicon").file()
end, { desc = "Save code screenshot as file" })

vim.keymap.set("v", "<leader>cs", function()
	require("nvim-silicon").shoot()
end, { desc = "Create code screenshot" })


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

-- disable arrow key for movement b/c I'm bad at using them without thinking
vim.keymap.set("n", "<Up>", "<Nop>", opts)
vim.keymap.set("n", "<Down>", "<Nop>", opts)
vim.keymap.set("n", "<Left>", "<Nop>", opts)
vim.keymap.set("n", "<Right>", "<Nop>", opts)