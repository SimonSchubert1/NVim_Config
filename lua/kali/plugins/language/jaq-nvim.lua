return {
    "is0n/jaq-nvim",
    opts = function()
        require("jaq-nvim").setup({
            cmds = {
                -- Uses vim commands
                internal = {
                    lua = "luafile %",
                    vim = "source %",
                },

                -- Uses shell commands
                external = {
                    typescript = "deno run %",
                    javascript = "node %",
                    lua = "lua %",
                    python = "python %",
                    rust = "cargo run",
                    cpp = "g++ % -o $fileBase && ./$fileBase",
                    go = "go run %",
                    sh = "sh %",
                    -- java = "javac -d bin *.java && java -cp bin %",
                    java = "javac -d bin src/*.java && java -cp bin %",
                    php = "php %",
                    markdown = "glow %",
                    c = "gcc % -o $fileBase && ./$fileBase",
                },
            },

            behavior = {
                -- Default type
                default = "terminal",

                -- Start in insert mode
                startinsert = false,

                -- Use `wincmd p` on startup
                wincmd = false,

                -- Auto-save files
                autosave = false,
            },

            ui = {
                float = {
                    -- See ':h nvim_open_win'
                    border = "none",

                    -- See ':h winhl'
                    winhl = "Normal",
                    borderhl = "FloatBorder",

                    -- See ':h winblend'
                    winblend = 0,

                    -- Num from `0-1` for measurements
                    height = 0.8,
                    width = 0.8,
                    x = 0.5,
                    y = 0.5,
                },

                terminal = {
                    -- Window position
                    position = "bot",

                    -- Window size
                    size = 20,

                    -- Disable line numbers
                    line_no = false,
                },

                quickfix = {
                    -- Window position
                    position = "bot",

                    -- Window size
                    size = 20,
                },
            },
        })
    end,
}
