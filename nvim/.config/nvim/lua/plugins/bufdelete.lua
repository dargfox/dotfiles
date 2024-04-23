return {
  "famiu/bufdelete.nvim",
  config = function ()
    local bufdelete = require('bufdelete')
    vim.keymap.set("n", "<C-w>", function()
      bufdelete.bufdelete(0)
    end)
  end
}
