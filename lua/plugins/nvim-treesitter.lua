return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
    "andymass/vim-matchup",
  },
  build = ":TSUpdate",
  branch = "master",
  lazy = false,
  config = function()
    require("nvim-treesitter.configs").setup({
      auto_install = true,
      ensure_installed = {
        "lua",
        "bash",
        "javascript",
        "html",
        "css",
        "php",
        "blade",
      },
      highlight = { enable = true },
      matchup = { enable = true },
      textobjects = { enable = true },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "gnn",
          node_incremental = "grn",
          scope_incremental = "grc",
          node_decremental = "grm",
        },
      },
    })
    vim.treesitter.language.register("html", "blade")
  end,
}
