vim.g.mapleader = " " -- Set leader to spacebar
vim.opt.number = true -- Show line numbers
vim.opt.cursorline = true -- cursor line

vim.opt.undofile = true -- historial de undos

vim.opt.ignorecase = true -- case-insensitive searching
vim.opt.smartcase = true

-- integration works automatically. Requires Neovim >= 0.10.0
vim.opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus" -- Sync with system clipboard

-- comentarios en php con //
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "php" },
  callback = function()
    vim.bo.commentstring = "// %s"
  end,
})
