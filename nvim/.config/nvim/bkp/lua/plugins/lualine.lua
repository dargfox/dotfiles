return {
  "nvim-lualine/lualine.nvim",
  lazy = false,
  config = function ()
    require('lualine').setup {
      options = {
        icons_enabled = true,
        --theme = 'ayu-vim'
      },
      sections = {
        lualine_a = {
          {
            'filename',
            path = 1,
          }
        }
      }
    }
  end
}
