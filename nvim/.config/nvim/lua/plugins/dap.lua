return {
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"},
    config = function ()
      local dap = require("dapui")
      dap.setup()
      vim.keymap.set("n", "<C-b>U", dap.toggle)
      vim.keymap.set("n", "<leader>bb", ":DapToggleBreakpoint<CR>")
      vim.fn.sign_define('DapBreakpoint', {text='🛑', texthl='', linehl='', numhl=''})
    end
  }
}
