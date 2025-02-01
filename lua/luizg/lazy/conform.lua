return {
    "stevearc/conform.nvim",
    config = function()
        require("conform").setup({
            formatters_by_ft = {
                lua = { "stylua" },
                -- Conform will run multiple formatters sequentially
                python = { "isort", "black", "ast-grep" },
                -- Use a sub-list to run only the first available formatter
                javascript = { "prettierd", stop_after_first = true },
                json = { "prettierd", stop_after_first = true },
                javascriptreact = { "prettierd", stop_after_first = true },
                typescriptreact = { "prettierd", stop_after_first = true },
                typescript = { "prettierd", stop_after_first = true },
                markdown = { "prettierd", stop_after_first = true },
                vue = { "prettierd", stop_after_first = true },
                yaml = { "prettierd", stop_after_first = true },
                cpp = { "ast-grep" },
                c = { "ast-grep" },
                cu = { "ast-grep" },
                arduino = { "ast-grep" },
                go = { "ast-grep" },
                html = { "prettierd", stop_after_first = true },
                css = { "prettierd", stop_after_first = true },
            },
            format_on_save = {
                timeout_ms = 500,
                lsp_format = "fallback",
            },
            log_level = vim.log.levels.ERROR,
            -- Conform will notify you when a formatter errors
            notify_on_error = true,
        })

        require("conform").formatters.prettier = {
            prepend_args = { "--tab-width", "4" },
        }
    end,
}
