return {
  {
    "stevearc/conform.nvim",
    config = function()
      require "configs.conform"
    end,
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },
  {
    "williamboman/mason.nvim", -- moved to chadrc
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
      },
    },
  },
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function()
      vim.g.rustfmt_autosave = 1
    end,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    ft = { "ocaml", "go", "cpp", "cc", "c", "json" },
    opts = function()
      return require "configs.null-ls"
    end,
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },
  -- {
  --   "godlygeek/tabular",
  --   lazy = false,
  -- },
  {
    "smjonas/inc-rename.nvim",
    lazy = false,
    config = function()
      require("inc_rename").setup()
    end,
  },
  {
    "rose-pine/neovim",
    name = "rose-pine-pl",
  },
  {
    "uga-rosa/translate.nvim",
    lazy = false,

    config = function()
      require("translate").setup {
        preset = {
          output = {
            split = {
              position = "top",
              min_size = 5,
              max_size = 0.5,
              name = "translate://output",
              filetype = "translate",
              append = false,
            },
          },
        },
      }
    end,
  },
  {
    "fugitive",
    lazy = false,
  },

  -- {
  --   "jackMort/ChatGPT.nvim",
  --   event = "VeryLazy",
  --   config = function()
  --     require("chatgpt").setup({
  --       api_key_cmd = "cat ~/api.key" -- cant figure out how to use api keys
  --     }) 
  --   end,
  --   dependencies = {
  --     "MunifTanjim/nui.nvim",
  --     "nvim-lua/plenary.nvim",
  --     "folke/trouble.nvim", -- optional
  --     "nvim-telescope/telescope.nvim",
  --   },
  -- },

  -- {
  --   "nvim-lua/plenary.nvim",
  -- },

  ---
  -- CUSTOM PLUGINS BELOW
  -- -- donnu what i did wrong, will make nvim super fucking slow
  -- {
  --
  --   dir = "/mnt/c/dev/lua/rfceez/",
  --   name = "rfceez",
  --   config = function()
  --     require("rfceez").setup()
  --   end,
  -- },
}
