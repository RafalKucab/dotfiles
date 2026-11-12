-- on top of LazyVim's editor.telescope extra
return {
  "nvim-telescope/telescope.nvim",
  keys = {
    {
      "<leader>sf",
      function()
        require("telescope.builtin").find_files()
      end,
      desc = "Search Files (cwd)",
    },
    {
      "<leader>se",
      function()
        require("telescope.builtin").buffers({ sort_lastused = true, ignore_current_buffer = true })
      end,
      desc = "Buffers",
    },
  },
  opts = {
    defaults = {
      -- live grep matches literal strings, not regex
      vimgrep_arguments = {
        "rg",
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
        "--smart-case",
        "--fixed-strings",
      },
    },
  },
}
