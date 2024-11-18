require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set


-- map("n", "<leader>", "<CMD> 'commandhere' <CR>", { desc = ""})

map("n", ";", ":", { desc = "CMD enter command mode" })
-- map("n", "j", "jzz")
-- map("n", "k", "kzz")
-- map("v", "j", "jzz")
-- map("v", "k", "kzz")
map("n", "1", ":!")
map("n", "<leader>fs", "<CMD> ter <CR> i", { desc = "new terminal full buffer"})
map("n", "<leader>mm", "<CMD> MarkdownPreview <CR>", { desc = "Open markdown preview"})
map("n", "<C-e>", "<CMD> Explore <CR>", { desc = ""})

map("n", "<leader>ds", vim.diagnostic.setloclist, { desc = "LSP Diagnostic loclist" })

--map("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<CR>")
map("n", "<F2>",
  function()
    return ":IncRename " .. vim.fn.expand("<cword>")
  end,
  { expr = true }
)

map("n", "H", "20h")
map("n", "L", "20l")

map("n", "gh", "0", { desc = "beginning of line"})
map("v", "gh", "0", { desc = "beginning of line"})

map("n", "gl", "$", { desc = "end of line"})
map("v", "gl", "$", { desc = "end of line"})

map("n", "go", "^", { desc = "start of non-whitespace text"})
map("v", "gl", "^", { desc = "start of non-whitespace text"})


map("n", "<leader>pdf", "<CMD> !pdflatex main.tex <CR>")
map("n", "<F5>", "<CMD> RMarkdown pdf <CR>")




map("n", "<leader>po", ":lua require('nabla').popup()<CR>")




