vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.backspace = '2'
vim.opt.showcmd = true
vim.opt.laststatus = 2
vim.opt.autowrite = true
vim.opt.cursorline = true
vim.opt.autoread = true

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.shiftround = true
vim.opt.expandtab = true

vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')
vim.keymap.set('n', '<C-n>', ':NvimTreeFindFileToggle<CR>')
vim.keymap.set('n', '<C-w>', ':bd<CR>:b<CR>')

--vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
--vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})
--vim.keymap.set("n", "<leader>gD", vim.lsp.buf.declaration, {})
--vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
--vim.keymap.set('n', '<leader>gi', vim.lsp.buf.implementation, {})
--vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
--vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})

vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal right<CR>:set nonu<CR>", {})
vim.keymap.set("n", "<leader>bf", ":Neotree buffers reveal float<CR>:set nonu<CR>", {})

vim.keymap.set("v", "<tab>", ">gv")
vim.keymap.set("v", "<S-tab>", "<gv")

vim.keymap.set({"n", "i", "v"}, "<leader><tab>", ":bnext<CR>")
vim.keymap.set({"n", "i", "v"}, "<leader><S-tab>", ":bprev<CR>")

vim.keymap.set("n", "f", ":HopWord<CR>")
vim.keymap.set("n", "<leader>f", ":HopPattern<CR>")

vim.keymap.set("n", "<leader>lg", ":LazyGit<CR>")
vim.keymap.set("n", "<leader>t", ":FloatermNew --height=0.9 --width=0.9<CR>")

vim.keymap.set("n", "<leader>e", ":TroubleToggle<CR>")

vim.keymap.set("v", "gd", "y/<C-r>\"<CR>")
-- vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", {})
-- vim.keymap.set("n", "<leader>gt", ":Gitsigns toggle_current_line_blame<CR>", {})
