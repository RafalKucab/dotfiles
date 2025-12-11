return {
  -- highly configurable status line
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    options = {
      theme = "onedark",
      component_separators = "|",
      section_separators = "",
    },
  },
}
