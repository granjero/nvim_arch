vim.g.mapleader = " " -- Set leader to spacebar
vim.opt.number = true -- Show line numbers
vim.opt.cursorline = true -- cursor line

vim.opt.undofile = true -- historial de undos

vim.opt.ignorecase = true -- case-insensitive searching
vim.opt.smartcase = true

-- comentarios en php con //
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "php" },
  callback = function()
    vim.bo.commentstring = "// %s"
  end,
})

-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
