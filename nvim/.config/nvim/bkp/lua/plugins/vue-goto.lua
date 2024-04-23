local opts = {
  filters = {
    auto_imports = true,
    auto_components = true,
    same_file = true,
    declaration = true,
  },
  filetypes = { "vue", "typescript" },
  detection = {
    nuxt = function()
      return vim.fn.glob(".nuxt/") ~= ""
    end,
    vue3 = function()
      return vim.fn.filereadable("vite.config.ts") == 1 or vim.fn.filereadable("src/App.vue") == 1
    end,
    priority = { "nuxt", "vue3" },
  }
}

return {
  "catgoose/vue-goto-definition.nvim",
  event = "BufReadPre",
  opts = opts
}
