-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Personal keymaps (ported from old config; not covered by LazyVim defaults)
local opts = { noremap = true, silent = true }

-- Save without triggering autoformat/autocmds
vim.keymap.set("n", "<leader>sn", "<cmd>noautocmd w<CR>", vim.tbl_extend("force", opts, { desc = "Save without formatting" }))

-- Quit current window
vim.keymap.set("n", "<C-q>", "<cmd>q<CR>", opts)

-- Vertical scroll and center
vim.keymap.set("n", "<C-d>", "<C-d>zz", opts)
vim.keymap.set("n", "<C-u>", "<C-u>zz", opts)

-- Cycle buffers with Tab (LazyVim uses <S-h>/<S-l>/[b/]b; this adds Tab as an alt)
vim.keymap.set("n", "<Tab>", "<cmd>bnext<CR>", opts)
vim.keymap.set("n", "<S-Tab>", "<cmd>bprevious<CR>", opts)
vim.keymap.set("n", "<C-i>", "<C-i>", opts) -- restore jump-forward, since <Tab> above overrides it

-- Equalize split sizes
vim.keymap.set("n", "<leader>se", "<C-w>=", vim.tbl_extend("force", opts, { desc = "Equalize splits" }))

-- Keep last yanked register when pasting over a visual selection
vim.keymap.set("v", "p", '"_dP', opts)
