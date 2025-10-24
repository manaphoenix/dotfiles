-- settings.lua
--vim.o.shell = "pwsh"
-- Line numbers
vim.wo.number = true        -- Enable absolute line numbers
vim.o.relativenumber = true -- Enable relative line numbers

-- Clipboard and mouse
vim.o.clipboard = "unnamedplus" -- Use system clipboard
vim.o.mouse = "a"               -- Enable mouse support in all modes

-- Wrapping and scrolling
vim.o.wrap = false      -- Disable line wrapping
vim.o.linebreak = true  -- Wrap lines at convenient points (words)
vim.o.scrolloff = 4     -- Keep 4 lines visible above and below cursor
vim.o.sidescrolloff = 8 -- Keep 8 columns visible at sides when no wrap

-- Indentation
vim.o.autoindent = true  -- Copy indent from current line on new lines
vim.o.smartindent = true -- Enable smart indentation
vim.o.shiftwidth = 4     -- Number of spaces for indentation
vim.o.tabstop = 4        -- Number of spaces a tab counts for
vim.o.softtabstop = 4    -- Number of spaces a tab counts for during editing
vim.o.expandtab = true   -- Use spaces instead of tabs

-- Search
vim.o.ignorecase = true -- Case insensitive search unless uppercase present
vim.o.smartcase = true  -- Override ignorecase if uppercase letter is in search
vim.o.hlsearch = false  -- Disable search highlight by default

-- User interface
vim.o.cursorline = false     -- Disable highlighting current line
vim.o.showmode = false       -- Don't show mode in command line (like -- INSERT --)
vim.o.showtabline = 1        -- Always show tabline
vim.o.numberwidth = 4        -- Width of number column
vim.o.cmdheight = 1          -- Command line height
vim.wo.signcolumn = "yes"    -- Always show sign column
vim.o.conceallevel = 0       -- Make markdown backticks visible
vim.opt.termguicolors = true -- Enable 24-bit colors support

-- Performance and behavior
vim.o.updatetime = 250    -- Faster completion (default is 4000)
vim.o.timeoutlen = 1000   -- Wait time for mapped sequences
vim.o.swapfile = false    -- Disable swapfile
vim.o.backup = false      -- Disable backup files
vim.o.writebackup = false -- Disable write backup
vim.o.undofile = true     -- Enable persistent undo

-- Completion and messaging
vim.o.completeopt = "menuone,noselect" -- Better completion experience
vim.opt.shortmess:append("c")          -- Don't show completion messages
vim.o.backspace = "indent,eol,start"   -- Allow backspacing over everything

-- Keywords and formatting
vim.opt.iskeyword:append("-")                   -- Consider hyphenated words as one word
vim.opt.formatoptions:remove({ "c", "r", "o" }) -- Disable auto inserting comment leader on new lines

-- Window splitting
vim.o.splitbelow = true -- Horizontal splits open below
vim.o.splitright = true -- Vertical splits open right

vim.o.ruler = false     -- Disable ruler
--vim.o.laststatus = 3    -- Always show status line



