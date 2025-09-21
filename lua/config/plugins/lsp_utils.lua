return {
    {
        'williamboman/mason.nvim',
        lazy = false,
        opts = {
        },
    },

    {
        "mason-org/mason-lspconfig.nvim",
        opts = {
            -- Este handler genérico vai funcionar para a maioria dos LSPs,
            -- incluindo tsserver, volar, e vtsls (que vai carregar lsp.vtsls)
            handlers = {
                function(server_name)
                    local server_config = require("lsp." .. server_name) or {}
                    -- O capabilities deve ser o mesmo usado em nvim/lua/config/lsp.lua
                    local capabilities_from_lsp_config = require("blink.cmp").get_lsp_capabilities(
                        vim.lsp.protocol.make_client_capabilities()
                    )

                    server_config.capabilities = vim.tbl_deep_extend(
                        "force",
                        {},
                        capabilities_from_lsp_config,
                        server_config.capabilities or {}
                    )

                    require("lspconfig")[server_name].setup(server_config)
                end,
            },
        },
        dependencies = {
            -- Note: O opts={} aqui não é realmente usado, pois o Mason principal já está configurado.
            -- Você pode remover o opts={} aqui ou deixar como está, não causará problemas.
            { "williamboman/mason.nvim" },
            "neovim/nvim-lspconfig",
        },
    },

    -- TS Errors Translator
    { 'dmmulroy/ts-error-translator.nvim', opts = {} },

    -- Diagnostics
    {
        "folke/trouble.nvim",
        opts = {}, -- for default options, refer to the configuration section for custom setup.
        cmd = "Trouble",
        keys = {
            {
                "<leader>xx",
                "<cmd>Trouble diagnostics toggle<cr>",
                desc = "Diagnostics (Trouble)",
            },
            {
                "<leader>xX",
                "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
                desc = "Buffer Diagnostics (Trouble)",
            },
            {
                "<leader>cs",
                "<cmd>Trouble symbols toggle focus=false<cr>",
                desc = "Symbols (Trouble)",
            },
            {
                "<leader>cl",
                "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
                desc = "LSP Definitions / references / ... (Trouble)",
            },
            {
                "<leader>xL",
                "<cmd>Trouble loclist toggle<cr>",
                desc = "Location List (Trouble)",
            },
            {
                "<leader>xQ",
                "<cmd>Trouble qflist toggle<cr>",
                desc = "Quickfix List (Trouble)",
            },
        },
    },

}
