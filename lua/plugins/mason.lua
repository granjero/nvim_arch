-- lua/plugins/mason.lua
return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "zapling/mason-conform.nvim",
  },
  cmd = "Mason",
  keys = { { "<leader>ma", "<cmd>Mason<cr>", desc = "Mason" } },
  build = ":MasonUpdate",
  config = function()
    require("mason").setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    require("mason-conform").setup()
  end,
}
