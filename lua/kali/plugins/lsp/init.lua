return {
    require("kali.plugins.lsp.lsp-zero"),
    require("kali.plugins.lsp.completion"),
    require("kali.plugins.lsp.null-ls"),
    require("kali.plugins.lsp.toggle-lsp-diagnostics"),
    require("kali.plugins.lsp.lsp-colors"),
    -- require("kali.plugins.lsp.lspsaga"),
    -- require("kali.plugins.lsp.fidget"),
    -- require("kali.plugins.lsp.lsp-signature"),
    require("kali.plugins.lsp.handlers").setup(),
}
