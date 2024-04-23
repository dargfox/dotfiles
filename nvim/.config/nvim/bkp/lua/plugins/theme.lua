return {
  {
    --"sainnhe/edge",
    --"patstockwell/vim-monokai-tasty",
    "Luxed/ayu-vim",
    lazy = false,
    name = "ayu-vim",
    priority = 1000,
    config = function()
      vim.g.ayucolor = "mirage"
      vim.o.termguicolors = true
      vim.cmd [[ colorscheme ayu ]]
    end
  }
}
