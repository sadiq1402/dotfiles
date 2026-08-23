-- Options are automatically loaded before lazy.nvim startup.
require("config.remote_clipboard").setup()

vim.opt.relativenumber = false
vim.g.autoformat = false

-- Personal preferences (ported from old config; not LazyVim defaults)
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.cursorline = false
vim.opt.conceallevel = 0 -- keep markdown markup (*, _, etc.) visible
vim.opt.swapfile = false
vim.opt.whichwrap = "bs<>[]hl" -- allow arrows/backspace/space to cross line boundaries
vim.opt.wrap = true -- soft-wrap long lines instead of scrolling horizontally
