return {
  "lukas-reineke/indent-blankline.nvim",
  config = function ()
    require("ibl").setup({
      whitespace = {
          remove_blankline_trail = false,
      },
      scope = { enabled = true },
    })
  end
}
