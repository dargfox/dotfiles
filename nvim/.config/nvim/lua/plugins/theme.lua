return {
  {
    "folke/lsp-colors.nvim",
  },
  {
    "ribru17/bamboo.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.opt.termguicolors = true
      vim.cmd [[ set background=dark ]]
      vim.cmd [[ colorscheme bamboo ]]
      vim.cmd [[ highlight Normal ctermbg=NONE ]]
      vim.cmd [[ highlight nonText ctermbg=NONE ]]
    end
  }
}
