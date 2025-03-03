return {
    {
        'williamboman/mason.nvim',
        lazy = false,
        opts = {},
    },

    -- Autocompletion
    {
        'hrsh7th/nvim-cmp',
        event = 'InsertEnter',
        dependencies = {

            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-path' },
            { 'hrsh7th/cmp-calc' },
            { 'hrsh7th/cmp-emoji' },
            { 'hrsh7th/cmp-nvim-lua' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-look' },
            { "onsails/lspkind.nvim" },
        },
        config = function()
            local cmp = require('cmp')

            cmp.setup({
                formatting = {
                    format = function(entry, vim_item)
                        vim_item.kind = require('lspkind').presets.default[vim_item.kind] .. ' ' .. vim_item.kind

                        vim_item.menu = ({
                            nvim_lsp = '[LSP]',
                            luasnip = '[Snip]',
                            buffer = '[Buffer]',
                            path = '[Path]',
                            calc = '[Calc]',
                            emoji = '[Emoji]',
                            nvim_lua = '[Lua]',
                            treesitter = '[Treesitter]',
                            spell = '[Spell]',
                            tags = '[Tags]',
                            look = '[Look]',
                        })[entry.source.name]

                        return vim_item
                    end,
                },
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                sources = {
                    { name = 'nvim_lsp' },
                    { name = 'luasnip' },
                    { name = 'buffer' },
                    { name = 'path' },
                    { name = 'calc' },
                    { name = 'emoji' },
                    { name = 'nvim_lua' },
                    { name = 'treesitter' },
                    { name = 'spell' },
                    { name = 'tags' },
                    { name = 'look' },
                },
                snippet = {
                    expand = function(args)
                        require('luasnip').lsp_expand(args.body)
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-u>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-d>"] = cmp.mapping.scroll_docs(4),
                    ["<C-y>"] = cmp.mapping.confirm({ select = false }),
                    ["<C-e>"] = cmp.mapping.abort(),
                    ["<Up>"] = cmp.mapping.select_prev_item({ behavior = "select" }),
                    ["<Down>"] = cmp.mapping.select_next_item({ behavior = "select" }),
                    ["<C-p>"] = cmp.mapping(function()
                        if cmp.visible() then
                            cmp.select_prev_item({ behavior = "insert" })
                        else
                            cmp.complete()
                        end
                    end),
                    ["<C-n>"] = cmp.mapping(function()
                        if cmp.visible() then
                            cmp.select_next_item({ behavior = "insert" })
                        else
                            cmp.complete()
                        end
                    end),
                    -- Super tab
                    ['<Tab>'] = cmp.mapping(function(fallback)
                        if require('luasnip').expand_or_jumpable() then
                            vim.fn.feedkeys(
                                vim.api.nvim_replace_termcodes('<Plug>luasnip-expand-or-jump', true, true, true), '')
                        else
                            fallback()
                        end
                    end, {
                        'i',
                        's',
                    }),

                    -- Super shift tab
                    ['<S-Tab>'] = cmp.mapping(function(fallback)
                        local luasnip = require('luasnip')

                        if luasnip.locally_jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, { 'i', 's' }),
                }),
            })
        end

    },

    -- LSP
    {
        'neovim/nvim-lspconfig',
        cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
        event = { 'BufReadPre', 'BufNewFile' },
        dependencies = {
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },
        },
        init = function()
            -- Reserve a space in the gutter
            -- This will avoid an annoying layout shift in the screen
            vim.opt.signcolumn = 'yes'
        end,
        config = function()
            local lsp_defaults = require('lspconfig').util.default_config

            -- Add cmp_nvim_lsp capabilities settings to lspconfig
            -- This should be executed before you configure any language server
            lsp_defaults.capabilities = vim.tbl_deep_extend(
                'force',
                lsp_defaults.capabilities,
                require('cmp_nvim_lsp').default_capabilities()
            )

            require('mason-lspconfig').setup({
                ensure_installed = {
                },
                handlers = {
                    -- this first function is the "default handler"
                    -- it applies to every language server without a "custom handler"
                    function(server_name)
                        require('lspconfig')[server_name].setup({})
                    end,

                    volar = function()
                        require('lspconfig').volar.setup({
                            filetypes = { 'vue', 'vuejsx', 'javascript' },
                            init_options = {
                                vue = {
                                    hybridMode = false,
                                },
                            },
                        })
                    end,

                    ts_ls = function()
                        require('lspconfig').ts_ls.setup({
                            filetypes = { 'typescript', 'typescriptreact', 'typescript.tsx' },
                            cmd = { "typescript-language-server", "--stdio" }
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
