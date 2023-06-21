return {
    require("kali.plugins.lsp.lsp-zero"),
    require("kali.plugins.lsp.completion"),
    require("kali.plugins.lsp.null-ls"),
    require("kali.plugins.lsp.toggle-lsp-diagnostics"),
    require("kali.plugins.lsp.fidget"),
    -- require("kali.plugins.lsp.code-action-menu"),
    require("kali.plugins.lsp.lsp-signature"),
    -- require("kali.plugins.lsp.coc"),
    require("kali.plugins.lsp.handlers").setup(),
}
