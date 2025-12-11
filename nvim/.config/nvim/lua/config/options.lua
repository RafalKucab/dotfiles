-- set <space> as the leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- set line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- indentation
vim.opt.autoindent = true  -- make indentation after pressing Enter key
vim.opt.tabstop = 2        -- number of spaces after pressing Tab key
vim.opt.shiftwidth = 2     -- number of spaces after pressing >> / << / ==
vim.opt.expandtab = true   -- turns Tab into spaces
vim.opt.smartindent = true -- use smart indentation

-- set no limit on maximum text width in line, no text wrap
vim.opt.textwidth = 0
vim.opt.wrapmargin = 0
vim.opt.wrap = false

-- highlight the line of the cursor
vim.opt.cursorline = true
