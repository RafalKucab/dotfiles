local M = {}

local state = {
  floating = {
    buf = -1,
    window = -1,
  }
}

local function create_floating_window(opts)
  opts = opts or {}

  -- calculate width and height of the window
  local width = opts.width or math.floor(vim.o.columns * 0.8)
  local height = opts.height or math.floor(vim.o.lines * 0.8)

  -- calculate the position of the window
  local col = math.floor((vim.o.columns - width) / 2)
  local row = math.floor((vim.o.lines - height) / 2)

  -- create a buffer (scratch buffer) or reuse
  local buf = nil
  if vim.api.nvim_buf_is_valid(opts.buf) then
    buf = opts.buf
  else
    buf = vim.api.nvim_create_buf(false, true)
  end

  -- window configuration
  local window_config = {
    relative = "editor",
    width = width,
    height = height,
    col = col,
    row = row,
    style = "minimal",
    border = "double"
  }

  local window = vim.api.nvim_open_win(buf, true, window_config)

  return { buf = buf, window = window }
end

function M.toggle_terminal()
  if not vim.api.nvim_win_is_valid(state.floating.window) then
    state.floating = create_floating_window({ buf = state.floating.buf })
    if vim.bo[state.floating.buf].buftype ~= "terminal" then
      vim.cmd.terminal()
    else
      vim.api.nvim_buf_call(state.floating.buf, function()
        vim.cmd("$")
      end)
    end
  else
    vim.api.nvim_win_hide(state.floating.window)
  end
end

return M
