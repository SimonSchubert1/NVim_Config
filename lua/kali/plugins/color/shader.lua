return {
    "sunjon/shade.nvim",
    config = function()
        local shade = require("shade")
        shade.setup({
            overlay_opacity = 60,
            opacity_step = 1,
        })
    end,
}
