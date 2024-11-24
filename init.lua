vim.g.base46_cache = vim.fn.stdpath "data" .. "/nvchad/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
    config = function()
      require "options"
    end,
  },

  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "nvchad.autocmds"

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*.tex",
  command = ":!pdflatex main.tex",
})



vim.api.nvim_create_user_command("Removeregisterednurse", ":%s/\\r//g", {})
vim.api.nvim_create_user_command("Rp", ":RMarkdown pdf", {})
vim.api.nvim_create_user_command("RP", ":RMarkdown pdf", {})
vim.api.nvim_create_user_command("RR", ":RMarkdown", {})
-- vim.api.nvim_create_user_command("Ashtioen", ":Qwerty!", {})
vim.api.nvim_create_user_command("SelectAll", ":normal ggVG", {})

vim.keymap.set("n", "<leader>sa", "<CMD> SelectAll <CR>", { desc = "Select All"})

vim.api.nvim_create_user_command("Scratchbuffer", ":e ~/scratch.md", { desc = "open scratch file"})
vim.api.nvim_create_user_command("Chatgptprompt", ":e ~/chatprompt.md", { desc = "open chatgpt file"})

-- --
-- vim.api.nvim_create_augroup("RMarkdown", { clear = true })
-- vim.api.nvim_create_autocmd("BufWritePost", {
--   pattern = "*.Rmd",
--   callback = function()
--     vim.cmd("RR")
--   end,
--   group = "RMarkdown",
-- })
--
vim.diagnostic.config {
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = true,
  severity_sort = true,
}

vim.schedule(function()
  require "mappings"
end)
