-- File: ~/.config/nvim/lua/plugins/lspconfig.lua
return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim", -- LSP/DAP/Linters installer
    "williamboman/mason-lspconfig.nvim", -- Bridge between mason & lspconfig
    "hrsh7th/cmp-nvim-lsp", -- Autocompletion
  },
  config = function()
    local lspconfig = require("lspconfig")

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

    -- Diagnostic signs
    local signs = { Error = "E", Warn = "W", Hint = "H", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

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

    -- Servers list
    local servers = { "lua_ls", "pyright", "clangd", "html", "cssls", "intelephense" }

    -- Setup servers
    for _, lsp in ipairs(servers) do
      lspconfig[lsp].setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })
    end

    -- Extra Lua LS settings
    lspconfig.lua_ls.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = { globals = { "vim" } },
          workspace = { checkThirdParty = false },
          telemetry = { enable = false },
        },
      },
    })
  end,
}
