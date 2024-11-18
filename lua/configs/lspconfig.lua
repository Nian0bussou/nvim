local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities
local util = require "lspconfig/util"

local lspconfig = require "lspconfig"
local servers = { "html", "cssls" }

lspconfig.ocamllsp.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  root_dir = util.root_pattern(".opam", "README.md", ".git"),
}

lspconfig.denols.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  root_dir = util.root_pattern("deno.json", "deno.jsonc"),
}

lspconfig.ts_ls.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  root_dir = util.root_pattern "package.json",
  single_file_support = false,
}

lspconfig.hls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "haskell" },
  root_dir = util.root_pattern("README.md", ".git"),
}

lspconfig.intelephense.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "php" },
  settings = {
    intelephense = {
      telemetry = {
        enabled = false,
      },
    },
  },
}

lspconfig.rust_analyzer.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "rust" },
  root_dir = util.root_pattern "Cargo.toml",
  settings = {
    ["rust_analyzer"] = {
      cargo = {
        allFeatures = true,
      },
    },
  },
}

lspconfig.zls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  root_dir = util.root_pattern("README.md", ".git"),
  filetypes = { "zig" },
}

lspconfig.clangd.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "cpp", "cc", "c", "h", "hpp" },
  root_dir = util.root_pattern("README.md", ".git"),
}

lspconfig.gopls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      usePlaceholders = true,
      completeUnimported = true,
      analyses = {
        unusedparams = true,
      },
    },
  },
}

lspconfig.omnisharp.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  filetypes = { "cs", "csharp"},
}

lspconfig.pyright.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  filetypes = { "python" },
}

lspconfig.elixirls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "/mnt/c/dev/zzzSourceLsps/elixir-ls-0.24.1/elixir-ls-0.24.1/scripts/language_server.sh" },
  root_dir = util.root_pattern(".ex", ".exs", "README.md", ".git"),
}

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end
