return {
  "nanozuki/tabby.nvim",
  lazy = false,
  config = function ()
    vim.o.showtabline = 2
    vim.opt.sessionoptions = 'curdir,folds,globals,help,tabpages,terminal,winsize'
  end
}