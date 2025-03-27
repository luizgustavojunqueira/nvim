return {
    "olimorris/codecompanion.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
    },
    config = function()
        require('codecompanion').setup({
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
                            url = "http://localhost:11434",
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
        })

        vim.keymap.set("n", "<leader>ccc", "<cmd>CodeCompanionChat<cr>", { noremap = true, silent = true })
        vim.keymap.set("n", "<leader>ccp", "<cmd>CodeCompanion<cr>", { noremap = true, silent = true })
        vim.keymap.set('n', '<leader>cca', '<cmd>CodeCompanionActions<cr>', { noremap = true, silent = true })
    end
}
