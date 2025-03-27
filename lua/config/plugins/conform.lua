return {
    "stevearc/conform.nvim",
    config = function()
        require("conform").setup({
            formatters_by_ft = {
                lua = { "stylua" },
                python = { "isort", "black", "ast-grep" },
                javascript = { "prettier", stop_after_first = true },
                json = { "prettier", stop_after_first = true },
                javascriptreact = { "prettier", stop_after_first = true },
                typescriptreact = { "prettier", stop_after_first = true },
                typescript = { "prettier", stop_after_first = true },
                markdown = { "prettier", stop_after_first = true },
                vue = { "prettier", stop_after_first = true },
                yaml = { "prettier", stop_after_first = true },
                cpp = { "clang-format" },
                c = { "clang-format" },
                cu = { "ast-grep" },
                arduino = { "ast-grep" },
                go = { "gofumpt" },
                sql = { "sqlfmt" },
                html = { "prettier", stop_after_first = true },
                css = { "prettier", stop_after_first = true },
            },
            format_on_save = {
                timeout_ms = 500,
                lsp_format = "fallback",
            },
            log_level = vim.log.levels.ERROR,
            notify_on_error = true,
        })

        require("conform").formatters.prettier = {
            prepend_args = { "--tab-width", "4" },
        }
    end,
}
