return {
  {
    {
      "nvim-treesitter/nvim-treesitter",
      build = ":TSUpdate",
      config = function()
        local config = require("nvim-treesitter.configs")
        config.setup({
          auto_install = true,
          ensure_installerd = { "c", "lua", "rust", "ruby", "vim", "vue", "typescript", "python", "sql", "scss", "css", "prisma", "haskell", "go", "yaml", "xml" },
          indent = { enable = true },
          highlight = { enable = true },
        })
      end
    }
  },
  {
    "xiyaowong/virtcolumn.nvim",
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
  },
  {
    "echasnovski/mini.animate",
  },
}

