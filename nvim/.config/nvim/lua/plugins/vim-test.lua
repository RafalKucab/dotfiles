return {
  {
    "vim-test/vim-test",
    dependencies = {
      "preservim/vimux"
    },
    config = function()
      -- vim.keymap.set("n", "<C-T>f", ":TestFile<CR>", {})

      vim.cmd("let test#strategy = 'vimux'")
    end,
  }
}
