local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
    return
end

require "kali.lsp.lsp-installer"
require("kali.lsp.handlers").setup()
--require "kali.lsp.configs"
--require "kali.lsp.null-is"
