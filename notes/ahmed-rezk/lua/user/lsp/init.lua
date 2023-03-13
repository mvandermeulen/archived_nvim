local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  print "lspconfig Error"
  return
end

require "user.lsp.lsp-installer"
require("user.lsp.handlers").setup()
require "user.lsp.null-ls"