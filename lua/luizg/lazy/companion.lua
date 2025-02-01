return {
    "olimorris/codecompanion.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
    },
    opts = {
        adapters = {
            deepseek = function()
                return require("codecompanion.adapters").extend("ollama", {
                    env = {
                        url = "http://localhost:11434",
                    },
                    parameters = {
                        sync = true,
                    },
                })
            end,
            codellama = function()
                return require("codecompanion.adapters").extend("codellama", {
                    env = {
                        url = "http://localhost:11500",
                    },
                    parameters = {
                        sync = true,
                    },
                })
            end,
        },
        strategies = {
            chat = { adapter = "copilot", },
            inline = { adapter = "copilot" },
            agent = { adapter = "copilot" },
        },
    }
}
