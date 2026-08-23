-- LazyVim has no standalone "lang.html" extra, so wire up html-lsp directly
-- (ported from old config's lsp.lua, which enabled `html` for html/twig/hbs)
return {
  {
    "mason.nvim",
    opts = { ensure_installed = { "html-lsp" } },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        html = { filetypes = { "html", "twig", "hbs" } },
      },
    },
  },
}
