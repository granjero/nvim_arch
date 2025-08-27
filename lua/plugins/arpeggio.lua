return { -- ARPEGIO
  "kana/vim-arpeggio",
  config = function()
    vim.api.nvim_command('call arpeggio#map("i", "", 0, ",.", "<Esc>:w<CR>")')
    vim.api.nvim_command('call arpeggio#map("n", "", 0, ",.", ":w<CR>")')
  end,
}
