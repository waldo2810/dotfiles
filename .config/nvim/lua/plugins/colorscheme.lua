return {
  {
    'maxmx03/solarized.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('solarized').setup({
        -- theme = 'neo',
        transparent = {
          enabled = true,
          -- enabled = false,
        },
      })
      vim.cmd("colorscheme solarized")
    end,
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
      require("rose-pine").setup({
        dark_variant = "main", -- main, moon, or dawn
        styles = {
          bold = true,
          italic = false,
          -- transparency = true,
        },
      })

      -- vim.cmd("colorscheme rose-pine")
    end
  },
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = function()
      require("gruvbox").setup({
        italic = {
          strings = false,
          emphasis = true,
          comments = true,
          operators = false,
          folds = true,
        },
        -- contrast = "hard", -- can be "hard", "soft" or empty string
        transparent_mode = true,
      })

      -- vim.cmd("colorscheme gruvbox")
    end,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      -- vim.cmd("colorscheme catppuccin")
    end
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("tokyonight").setup({
        style = "night",
        transparent = "true"
      })
      -- vim.cmd("colorscheme tokyonight")
    end,
  },

  {
    'projekt0n/github-nvim-theme',
    name = 'github-theme',
    lazy = false,    -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require('github-theme').setup({
        -- ...
      })
      -- vim.cmd('colorscheme github_dark_default')
    end,
  }
}
