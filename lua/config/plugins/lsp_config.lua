return {
    {
        'williamboman/mason.nvim',
        lazy = false,
        opts = {},
    },

    -- LSP
    {
        'neovim/nvim-lspconfig',
        cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
        event = { 'BufReadPre', 'BufNewFile' },
        dependencies = {
            { 'saghen/blink.cmp' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },
        },
        config = function()
            local capabilities = require("blink.cmp").get_lsp_capabilities()
            require('mason-lspconfig').setup({
                handlers = {
                    function(server_name)
                        require('lspconfig')[server_name].setup({
                            capabilities = capabilities,
                        })
                    end,

                    volar = function()
                        require('lspconfig').volar.setup({
                            capabilities = vim.tbl_deep_extend(
                                'force',
                                capabilities,
                                {
                                    filetypes = { 'vue', 'vuejsx', 'javascript' },
                                    init_options = {
                                        vue = {
                                            hybridMode = false,
                                        },
                                    },
                                }
                            ),
                        })
                    end,

                    ts_ls = function()
                        require('lspconfig').ts_ls.setup({
                            capabilities = vim.tbl_deep_extend(
                                'force',
                                capabilities,
                                {
                                    filetypes = { 'typescript', 'typescriptreact', 'typescript.tsx' },
                                    cmd = { "typescript-language-server", "--stdio" },
                                }
                            ),
                        })
                    end,

                    markdown_oxide = function()
                        require('lspconfig').markdown_oxide.setup({
                            capabilities = vim.tbl_deep_extend(
                                'force',
                                capabilities,
                                {
                                    workspace = {
                                        didChangeWatchedFiles = {
                                            dynamicRegistration = true,
                                        },
                                    },
                                }
                            ),
                        })
                    end,

                    clangd = function()
                        require('lspconfig').clangd.setup({
                            capabilities = vim.tbl_deep_extend(
                                'force',
                                capabilities,
                                {
                                    cmd = {
                                        "/home/luizg/Downloads/esp-clang/bin/clangd",
                                        "--background-index",
                                        "-j=12",
                                        "--query-driver=**",
                                        "--clang-tidy",
                                        "--all-scopes-completion",
                                        "--cross-file-rename",
                                        "--completion-style=detailed",
                                        "--header-insertion-decorators",
                                        "--header-insertion=iwyu",
                                        "--pch-storage=memory",
                                        "--suggest-missing-includes",
                                        "--background-index",
                                        "--query-driver=/home/luizg/.platformio/packages/toolchain-xtensa-esp32/bin/xtensa-esp32-elf-gcc*,/home/luizg/.platformio/packages/toolchain-xtensa-esp32/bin/xtensa-esp32-elf-g++*,xtensa-esp32-elf-gcc*,xtensa-esp32-elf-g++*",
                                        "--log=verbose",
                                    }
                                }
                            )
                        })
                    end
                }
            })
        end
    },

    -- Lsp signatures
    {
        "ray-x/lsp_signature.nvim",
        event = "VeryLazy",
        opts = {
            bind = true,
            handler_opts = {
                border = "rounded"
            }
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

    {
        "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
        config = function()
            require("lsp_lines").setup()
        end,
    }
}
