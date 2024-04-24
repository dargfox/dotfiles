return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
      signs = {
          error = "⚉",
          warning = "⚈",
          hint = "⚇",
          information = "⚆",
          other = "◍",
        },
      use_diagnostic_signs = true,
    },
}
