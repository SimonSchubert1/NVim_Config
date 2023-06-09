return {
    "rcarriga/nvim-notify",
    init = function()
        vim.notify = require("notify")
    end,
    opts = function()
        require("notify").setup({
            background_colour = "#000000",
        })
    end
}
