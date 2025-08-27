-- lua/plugins/conform.lua
return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  keys = {
    {
      "<leader>f",
      function()
        require("conform").format({ async = true, lsp_fallback = true })
      end,
      mode = "",
      desc = "Format buffer",
    },
  },
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        -- Lua
        lua = { "stylua" },

        -- Web development
        -- javascript = { "prettier" },
        -- typescript = { "prettier" },
        -- javascriptreact = { "prettier" },
        -- typescriptreact = { "prettier" },
        -- html = { "prettier" },
        -- css = { "prettier" },
        -- json = { "prettier" },
        -- yaml = { "prettier" },
        -- markdown = { "prettier" },
        
        -- PHP - Use PHP CS Fixer instead of prettier
        php = { "php_cs_fixer" },

        -- Python
        -- python = { "black" },

        -- Shell
        sh = { "shfmt" },
        bash = { "shfmt" },

        -- You can use a sub-list to specify multiple formatters to try
        -- They will be tried in order until one is found
        -- python = { "isort", "black" },
      },

      -- Format on save
      format_on_save = {
        -- These options will be passed to conform.format()
        timeout_ms = 500,
        lsp_fallback = true,
      },

      -- Customize formatters
      formatters = {
        shfmt = {
          prepend_args = { "-i", "2" }, -- Use 2 spaces for indentation
        },
        -- Configure PHP CS Fixer
        php_cs_fixer = {
          command = "php-cs-fixer",
          args = { "fix", "--rules=@PSR12", "$FILENAME" },
          stdin = false,
          env = {
            PHP_CS_FIXER_IGNORE_ENV = "1"
          },
        },
      },
    })
  end,
}
