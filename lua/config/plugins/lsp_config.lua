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
            { 'hrsh7th/cmp-path' },
            { 'hrsh7th/cmp-calc' },
            { 'hrsh7th/cmp-emoji' },
            { 'hrsh7th/cmp-nvim-lua' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-vsnip' },
            { 'hrsh7th/cmp-look' },
            { "L3MON4D3/LuaSnip" },
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
                            buffer = '[Buffer]',
                            path = '[Path]',
                            calc = '[Calc]',
                            emoji = '[Emoji]',
                            nvim_lua = '[Lua]',
                            treesitter = '[Treesitter]',
                            vsnip = '[VSnip]',
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
                    { name = 'buffer' },
                    { name = 'path' },
                    { name = 'calc' },
                    { name = 'emoji' },
                    { name = 'nvim_lua' },
                    { name = 'treesitter' },
                    { name = 'vsnip' },
                    { name = 'spell' },
                    { name = 'tags' },
                    { name = 'look' },
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
                }),
                snippet = {
                    expand = function(args)
                        vim.snippet.expand(args.body)
                    end,
                },
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

            -- LspAttach is where you enable features that only work
            -- if there is a language server active in the file
            vim.api.nvim_create_autocmd('LspAttach', {
                desc = 'LSP actions',
                callback = function(event)
                    local opts = { buffer = event.buf }

                    vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
                    vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
                    vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
                    vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
                    vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
                    vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
                    vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
                    vim.keymap.set({ 'n', 'x' }, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
                    vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
                end,
            })

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
                            filetypes = { 'vue', 'typescript', 'javascript', 'javascriptreact', 'typescriptreact' },
                            init_options = {
                                vue = {
                                    hybridMode = false,
                                },
                            },
                        })
                    end,
                }
            })
        end
    }
}
