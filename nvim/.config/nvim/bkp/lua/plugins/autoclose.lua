return {
  {
      "m4xshen/autoclose.nvim",
      lazy = false,
      name = "autoclose",
      priority = 1000,
      config = function()
        require("autoclose").setup({
          keys = {
            ["<"] = { escape = true, close = true, pair = "<>", disabled_filetypes = {} },
          },
        })
      end
  }
}