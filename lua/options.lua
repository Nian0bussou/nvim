require "nvchad.options"

-- add yours here!

local o = vim.o
o.cursorlineopt = "both" -- to enable cursorline!

o.ruler = true

-- o.colorcolumn = "80"

o.spelllang = "en,fr,cjk"

o.iskeyword = "@,48-57,_,192-255,-"

o.relativenumber = true

o.wrap = false
o.sidescrolloff = 990
o.so = 999

o.foldmethod="marker"
o.foldmarker="{,}"
o.foldlevelstart = 99

-- -- for C/C++
-- o.tabstop = 8
-- o.shiftwidth = 8
-- o.expandtab = true
-- o.autoindent = true
-- o.smarttab = true
