-- Setup nvim-cmp
return{
    "windwp/nvim-autopairs",
    config = function()
        local npairs = require("nvim-autopairs")
        npairs.setup {}
    end,
}
