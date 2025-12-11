-- key mapping helper function
local map = function(mode, lhs, rhs, opts)
  if lhs == "" then return end
  opts = vim.tbl_deep_extend("force", { silent = true }, opts or {})
  vim.keymap.set(mode, lhs, rhs, opts)
end

-- tmux pane switching
map("n", "<C-h>", ":TmuxNavigateLeft<cr>", { desc = "Switch to the left Tmux pane" })
map("n", "<C-l>", ":TmuxNavigateRight<cr>", { desc = "Switch to the right Tmux pane" })
map("n", "<C-k>", ":TmuxNavigateUp<cr>", { desc = "Switch to the up Tmux pane" })
map("n", "<C-j>", ":TmuxNavigateDown<cr>", { desc = "Switch to the down Tmux pane" })
map("n", "<C-\\>", ":TmuxNavigatePrevious<cr>", { desc = "Switch to the previous Tmux pane" })

-- useful keymaps to run lua code
map("n", "<space><space>x", "<cmd>source %<CR>", { desc = "Source current Lua file" })
map("n", "<space>x", ":.lua<CR>", { desc = "Execute Lua code on current line" })
map("v", "<space>x", ":lua<CR>", { desc = "Execute Lua code on current line" })

-- terminal
map("t", "<esc><esc>", "<c-\\><c-n>")
map("n", "<space>tt", ":Floaterminal<CR>", { desc = "[T]oggle [T]erminal" })

-- show/hide neotree
map("n", "<leader>nt", ":Neotree<CR>", { desc = "[N]eo [T]ree" })

-- clear search and stop snippet on escape
map({ "i", "n", "s" }, "<esc>", function()
  vim.cmd("noh")
  return "<esc>"
end, { expr = true, desc = "Escape and Clear hlsearch" })

-- move Lines
map("n", "<A-j>", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Move Down" })
map("n", "<A-k>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "Move Up" })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
map("v", "<A-j>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "Move Down" })
map("v", "<A-k>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "Move Up" })

-- window navigation
-- map("n", "<C-H>", "<C-w>h", { desc = "Focus on left window" })
-- map("n", "<C-J>", "<C-w>j", { desc = "Focus on below window" })
-- map("n", "<C-K>", "<C-w>k", { desc = "Focus on above window" })
-- map("n", "<C-L>", "<C-w>l", { desc = "Focus on right window" })

-- telescope mapping
local builtin = require("telescope.builtin")
local config = require('telescope.config').values

map("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
map("n", "<leader>sf", builtin.find_files, { desc = "[S]earch [F]iles" })
map("n", "<leader>sh", builtin.help_tags, { desc = '[S]earch [H]elp' })
map("n", "<leader>sg", builtin.live_grep,
  { desc = "[S]earch by [G]rep", vimgrep_arguments = table.insert(config.vimgrep_arguments, '--fixed-strings') })
map("n", "<leader>e",
  [[<cmd>lua require('telescope.builtin').buffers({ sort_lastused = true, ignore_current_buffer = true })<CR>]],
  { desc = "Show [B]uffers" })

-- quick fix keymaps
map("n", "<M-l>", "<cmd>cnext<CR>", { desc = "Next item in quick fix" })
map("n", "<M-h>", "<cmd>cprev<CR>", { desc = "Prev item in quick fix" })

-- TODO: break new line in normal mode
-- map('n', "<Esc>[13;3u", "i<CR><ESC>k$", { desc = "Break line at cursor" })
-- map('n', "<Esc>[13;5u", "i<CR><ESC>k$", { desc = "Break line at cursor" })
-- map('n', "<S-CR>", "i<CR><ESC>k$", { desc = "Break line at cursor" })

-- toggle comment
local comment = require('mini.comment')
map('n', '<C-A-j>', function()
  local line = vim.api.nvim_win_get_cursor(0)[1]
  comment.toggle_lines(line, line)
  vim.cmd('norm! j')
end, { desc = "Toggle comment in current line, move cursor down" })
map('n', '<C-A-k>', function()
  local line = vim.api.nvim_win_get_cursor(0)[1]
  comment.toggle_lines(line, line)
  vim.cmd('norm! k')
end, { desc = "Toggle comment in current line, move cursor up" })

-- gitsigns keymaps
local gitsigns = require('gitsigns')

map('n', '<leader>hs', gitsigns.stage_hunk)
map('n', '<leader>hr', gitsigns.reset_hunk)
map('v', '<leader>hs', function() gitsigns.stage_hunk { vim.fn.line('.'), vim.fn.line('v') } end)
map('v', '<leader>hr', function() gitsigns.reset_hunk { vim.fn.line('.'), vim.fn.line('v') } end)
map('n', '<leader>hS', gitsigns.stage_buffer)
map('n', '<leader>hu', gitsigns.undo_stage_hunk)
map('n', '<leader>hR', gitsigns.reset_buffer)
map('n', '<leader>hp', gitsigns.preview_hunk)
map('n', '<leader>hb', function() gitsigns.blame_line { full = true } end)
map('n', '<leader>tb', gitsigns.toggle_current_line_blame)
map('n', '<leader>hd', gitsigns.diffthis)
map('n', '<leader>hD', function() gitsigns.diffthis('~') end)
map('n', '<leader>td', gitsigns.toggle_deleted)
