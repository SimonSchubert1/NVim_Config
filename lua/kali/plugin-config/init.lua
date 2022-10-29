local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
    return
end

require "kali.plugin-config.alpha"
require "kali.plugin-config.autopairs"
require "kali.plugin-config.bufferline"
require "kali.plugin-config.comment"
require "kali.plugin-config.gitsigns"
require "kali.plugin-config.impatient"
require "kali.plugin-config.indentline"
require "kali.plugin-config.lualine"
require "kali.plugin-config.nvim-tree"
require "kali.plugin-config.project"
require "kali.plugin-config.telescope"
require "kali.plugin-config.toggleterm"
require "kali.plugin-config.treesitter"
require "kali.plugin-config.whichkey"
