-- File: ~/.config/nvim/lua/plugins/lspconfig.lua
return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim", -- LSP/DAP/Linters installer
    "williamboman/mason-lspconfig.nvim", -- Bridge between mason & lspconfig
    "hrsh7th/cmp-nvim-lsp", -- Autocompletion
  },
  config = function()
    -- Capabilities for nvim-cmp
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    -- Diagnostic settings
    vim.diagnostic.config({
      virtual_text = true,
      signs = true,
      underline = true,
      update_in_insert = false,
      severity_sort = true,
    })

    vim.diagnostic.config({
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = "E",
          [vim.diagnostic.severity.WARN] = "W",
          [vim.diagnostic.severity.HINT] = "H",
          [vim.diagnostic.severity.INFO] = "",
        },
      },
    })

    -- On attach function (keymaps, etc.)
    local on_attach = function(_, bufnr)
      local bufmap = function(mode, lhs, rhs, desc)
        vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
      end

      bufmap("n", "gd", vim.lsp.buf.definition, "Go to Definition")
      bufmap("n", "gr", vim.lsp.buf.references, "References")
      bufmap("n", "K", vim.lsp.buf.hover, "Hover Docs")
      bufmap("n", "<leader>rn", vim.lsp.buf.rename, "Rename Symbol")
      bufmap("n", "<leader>ca", vim.lsp.buf.code_action, "Code Action")
      bufmap("n", "[d", vim.diagnostic.goto_prev, "Prev Diagnostic")
      bufmap("n", "]d", vim.diagnostic.goto_next, "Next Diagnostic")
    end

    --
    -- SERVERS
    --
    -- HTML LSP with Blade support
    vim.lsp.config("html", {
      on_attach = on_attach,
      capabilities = capabilities,
      filetypes = { "html", "blade" },
    })
    vim.lsp.enable("html")

    -- CSS LSP
    vim.lsp.config("cssls", {
      on_attach = on_attach,
      capabilities = capabilities,
      filetypes = { "css" },
    })
    vim.lsp.enable("cssls")

    -- emmet_language_server
    vim.lsp.config("emmet_language_server", {
      on_attach = on_attach,
      capabilities = capabilities,
      filetypes = {
        "html",
        "css",
        "scss",
        "javascript",
        "javascriptreact",
        "vue",
        "svelte",
        "blade",
      },
    })
    vim.lsp.enable("emmet_language_server")

    -- PHP intelephense
    vim.lsp.config("intelephense", {
      on_attach = on_attach,
      capabilities = capabilities,
      filetypes = { "php" },
    })
    vim.lsp.enable("intelephense")

    -- TAILWINDCSS
    vim.lsp.config("tailwindcss", {
      on_attach = on_attach,
      capabilities = capabilities,
      filetypes = { "php", "blade", "html" },
    })
    vim.lsp.enable("tailwindcss")

    -- Arduino Language Server requires special configuration
    vim.lsp.config("arduino_language_server", {
      cmd = {
        "arduino-language-server",
        "-fqbn",
        "arduino:avr:uno", -- Specify your board
        "-cli",
        "arduino-cli", -- Path to arduino-cli if not in PATH
        "-clangd",
        "clangd", -- Path to clangd if not in PATH
      },
      on_attach = on_attach,
      capabilities = capabilities,
      filetypes = { "arduino", "ino" },
    })
    vim.lsp.enable("arduino_language_server")

    --bash
    vim.lsp.config("bashls", {
      cmd = { "bash-language-server", "start" },
      on_attach = on_attach,
      capabilities = capabilities,
      filetypes = { "sh", "bash" },
    })
    vim.lsp.enable("bashls")

    -- javascrip
    vim.lsp.config("tsserver", {
      cmd = { "typescript-language-server", "--stdio" },
      on_attach = on_attach,
      capabilities = capabilities,
      filetypes = { "php", "blade", "html" },
    })
    vim.lsp.enable("tsserver")
  end,
}
