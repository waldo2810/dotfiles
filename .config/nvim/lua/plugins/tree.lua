return {
  "kyazdani42/nvim-tree.lua",
  dependencies = {
    "kyazdani42/nvim-web-devicons",
  },
  lazy = false,
  keys = {
    { "<leader>ff", "<cmd>NvimTreeFindFile<cr>", desc = "Find file in filetree" },
    { "<C-n>",      "<cmd>NvimTreeToggle<cr>",   desc = "Find file in filetree" },
  },
  opts = {
    filters = {
      custom = { ".git", "node_modules", ".vscode" },
      dotfiles = true,
    },
    git = {},
    view = {
      adaptive_size = true,
      float = {
        -- enable = true,
        enable = false,
      },
      relativenumber = true
    },
    update_focused_file = {
      enable = true
    },
    disable_netrw = false,
    hijack_netrw = false,
  },
}
