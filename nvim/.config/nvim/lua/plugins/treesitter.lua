return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local config = require("nvim-treesitter")
      config.setup({
        -- Add languages to be installed here that you want installed for treesitter
        ensure_installed = { "c", "cpp", "elm", "go", "lua", "python", "scala", "vimdoc", "vim", "bash", "rust", "toml" },
        -- Autoinstall languages that are not installed. Defaults to false (but you can change for yourself!)
        auto_install = true,
        -- Install languages synchronously (only applied to `ensure_installed`)
        sync_install = false,
        -- List of parsers to ignore installing
        ignore_install = {},
        -- You can specify additional Treesitter modules here
        modules = {},
        highlight = { enable = true },
        indent = { enable = true },
      })
    end
  }
}
