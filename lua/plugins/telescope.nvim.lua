return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
    },
  },
  config = function()
    require("telescope").setup({
      defaults = {
        layout_config = {
          preview_width = 0.6,
        },
      },
    })
  end,
  keys = {
    { "<leader>sb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
    { "<leader>sc", "<cmd>Telescope git_commits<cr>", desc = "Git commits" },
    { "<leader>sd", "<cmd>Telescope diagnostics<cr>", desc = "Diagnostics" },
    { "<leader>sf", "<cmd>Telescope find_files<cr>", desc = "Find files" },
    { "<leader>sg", "<cmd>Telescope live_grep<cr>", desc = "Live grep" },
    { "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Help tags" },
    { "<leader>sj", "<cmd>Telescope jumplist<cr>", desc = "Jumplist" },
    { "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Keymaps" },
    { "<leader>sl", "<cmd>Telescoe loclist<cr>", desc = "Location list" },
    { "<leader>sm", "<cmd>Telescope marks<cr>", desc = "Marks" },
    { "<leader>so", "<cmd>Telescope oldfiles<cr>", desc = "Opened recently" },
    { "<leader>sr", "<cmd>Telescope registers<cr>", desc = "Registers" },
    { "<leader>ss", "<cmd>Telescope git_status<cr>", desc = "Git status" },
    { "<leader>sw", "<cmd>Telescope grep_string<cr>", desc = "Find word under cursor" },
    { "<leader>sq", "<cmd>Telescope quickfix<cr>", desc = "Quickfix" },
    {
      "<leader>sA",
      function()
        require("telescope.builtin").find_files({
          prompt_title = "Find All Files (including hidden & gitignored)",
          hidden = true,
          no_ignore = true,
        })
      end,
      desc = "Find ALL files (hidden + gitignored)",
    },
    {
      "<leader>sG",
      function()
        require("telescope.builtin").live_grep({
          prompt_title = "Grep All Files (including hidden & gitignored)",
          additional_args = function()
            return { "--hidden", "--no-ignore" }
          end,
        })
      end,
      desc = "Grep ALL files (hidden + gitignored)",
    },
  },
}
