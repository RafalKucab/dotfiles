return {
  'nvim-mini/mini.comment',
  config = function()
    require('mini.comment').setup({
      options = {
        start_of_line = true,
      },
      mappings = {
        comment = '',    -- disable `gc`
        comment_line = '', -- disable `gcc`
        comment_visual = '', -- disable visual `gc`
        textobject = '', -- disable textobject
      },
    })
  end
}
