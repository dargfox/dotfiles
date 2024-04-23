-- Use K to show documentation in preview window
function _G.show_docs()
    local cw = vim.fn.expand('<cword>')
    if vim.fn.index({'vim', 'help'}, vim.bo.filetype) >= 0 then
        vim.api.nvim_command('h ' .. cw)
    elseif vim.api.nvim_eval('coc#rpc#ready()') then
        vim.fn.CocActionAsync('doHover')
    else
        vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
    end
end

return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
  {
    "neoclide/coc.nvim",
    branch = "release",
    config = function ()
      local cocopts = {silent = true, noremap = true, expr = true, replace_keycodes = false}
      -- Use Tab for trigger completion with characters ahead and navigate
      -- NOTE: There's always a completion item selected by default, you may want to enable
      -- no select by setting `"suggest.noselect": true` in your configuration file
      -- NOTE: Use command ':verbose imap <tab>' to make sure Tab is not mapped by
      -- other plugins before putting this into your configs
      function _G.check_back_space()
          local col = vim.fn.col('.') - 1
          return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
      end
      vim.keymap.set("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', cocopts)
      vim.keymap.set("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], cocopts)
      vim.keymap.set("i", "<CR>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], cocopts)
      -- Make <CR> to accept selected completion item or notify coc.nvim to format
      -- <C-g>u breaks current undo, please make your own choice
      -- GoTo code navigation
      vim.keymap.set("n", "<leader>gd", "<Plug>(coc-definition)", {silent = true})
      vim.keymap.set("n", "<leader>gy", "<Plug>(coc-type-definition)", {silent = true})
      vim.keymap.set("n", "<leader>gi", "<Plug>(coc-implementation)", {silent = true})
      vim.keymap.set("n", "<leader>gr", "<Plug>(coc-references)", {silent = true})

      vim.keymap.set("n", "K", "<cmd>lua _G.show_docs()<CR>", {silent=true})

      vim.api.nvim_create_augroup("CocGroup", {})
      vim.api.nvim_create_autocmd("CursorHold", {
          group = "CocGroup",
          command = "silent call CocActionAsync('highlight')",
          desc = "Highlight symbol under cursor on CursorHold"
      })

      vim.g.coc_global_extentions = { "coc-lua", "coc-tsserver", "@yaegassy/coc-volar", "@yaegassy/coc-volar-tools" }
      vim.g.coc_status_error_sign = '×'
      vim.g.coc_status_warning_sign = '×'

    end
  },
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
  },
  {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup {
        pre_hook = function()
          return vim.bo.commentstring
        end,
      }
    end,
  },
  {
    "dmmulroy/tsc.nvim",
    config = function ()
      require('tsc').setup()
    end
  },
  {
    "posva/vim-vue"
  },
  {
    "sbdchd/neoformat"
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      local lspc = require("lspconfig")

      local configs = {
        lspc.lua_ls, lspc.volar, lspc.tsserver, lspc.basedpyright, lspc.prismals,
        lspc.pico8_ls, lspc.html, lspc.gopls, lspc.cssls, lspc.angularls,
        lspc.bashls, lspc.hydra_lsp
      }

      for _, conf in ipairs(configs) do
        conf.setup({
          capabilities = capabilities,
        })
      end
    end
  }
}
