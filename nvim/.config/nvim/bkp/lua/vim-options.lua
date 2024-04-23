vim.wo.number = true
vim.opt.fillchars:append { eob = " " }

vim.opt.list = true

vim.api.nvim_create_augroup("neotree_autoopen", { clear = true })
vim.api.nvim_create_autocmd("VimEnter", {
  desc = "Open neo-tree on enter",
  group = "neotree_autoopen",
  callback = function ()
    vim.cmd "Neotree show"
    vim.cmd "set lcs+=space:."
  end
})
vim.api.nvim_create_autocmd("BufEnter", {
  callback = function ()
    vim.cmd "set nu"
    vim.cmd "set cc=80"
  end
})

vim.g.virtcolumn_char = "|"
vim.g.virtcolumn_priority = 10


vim.opt.writebackup = false
vim.opt.backup = false
vim.opt.updatetime = 300
vim.opt.signcolumn = "yes"
