-- This file  needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.ui = {
  theme = "rosepine",
  -- transparency = false,
  transparency = true,

  statusline = {
    theme = "vscode_colored",
  },

  telescope = { style = "borderless" },

  hl_override = {
    Comment = { italic = false },
    ["@comment"] = { italic = false },
    Search = { italic = true },
    ["@Search"] = { italic = true },
  },

  mason = {
    cmd = true,
    pkgs = {
      "fsautocomplete",
      "json-lsp",
      "ocaml-lsp",
      "deno",
      "rust-analyzser",
      "haskell-language-server",
      "elixir-ls",
      "gopls",
      "clangd",
      "omnisharp",
      "lua-language-server",
      "stylua",
      "html-lsp",
      "css-lsp",
      "prettier",
      "texlab",
      "zls",
      "pyright",
    },
  },
}

return M
