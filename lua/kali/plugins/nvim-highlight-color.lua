return {
    "brenoprata10/nvim-highlight-colors",
    opts = function ()
        local highlight_colors = require("nvim-highlight-colors")
        highlight_colors.turnOn()
        highlight_colors.setup{
            enable_named_colors = true,
            render = "background",
        }
    end
}
