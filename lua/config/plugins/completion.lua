return {
    'saghen/blink.cmp',
    dependencies = { "onsails/lspkind.nvim", { 'L3MON4D3/LuaSnip', version = 'v2.*' } },

    version = '1.*',
    config = function()
        require('blink.cmp').setup({
            keymap = { preset = 'default' },
            snippets = { preset = 'luasnip' },
            appearance = {
                nerd_font_variant = 'mono'
            },
            signature = {
                enabled = true,
            },

            completion = {
                documentation = { auto_show = true, auto_show_delay_ms = 500, treesitter_highlighting = true },
                list = { selection = { preselect = true, auto_insert = true } },
                menu = {
                    draw = {
                        treesitter = { 'lsp' },
                        columns = { { "label", "label_description", gap = 1 }, { "kind_icon", "kind", gap = 1 } },
                        gap = 2,
                        components = {
                            kind_icon = {
                                text = function(ctx)
                                    local lspkind = require("lspkind")
                                    local icon = ctx.kind_icon
                                    if vim.tbl_contains({ "Path" }, ctx.source_name) then
                                        local dev_icon, _ = require("nvim-web-devicons").get_icon(ctx.label)
                                        if dev_icon then
                                            icon = dev_icon
                                        end
                                    else
                                        icon = require("lspkind").symbolic(ctx.kind, {
                                            mode = "symbol",
                                        })
                                    end

                                    return icon .. ctx.icon_gap
                                end,

                                -- Optionally, use the highlight groups from nvim-web-devicons
                                -- You can also add the same function for `kind.highlight` if you want to
                                -- keep the highlight groups in sync with the icons.
                                highlight = function(ctx)
                                    local hl = ctx.kind_hl
                                    if vim.tbl_contains({ "Path" }, ctx.source_name) then
                                        local dev_icon, dev_hl = require("nvim-web-devicons").get_icon(ctx.label)
                                        if dev_icon then
                                            hl = dev_hl
                                        end
                                    end
                                    return hl
                                end,
                            },
                            kind = {
                                highlight = function(ctx)
                                    local hl = ctx.kind_hl
                                    if vim.tbl_contains({ "Path" }, ctx.source_name) then
                                        local dev_icon, dev_hl = require("nvim-web-devicons").get_icon(ctx.label)
                                        if dev_icon then
                                            hl = dev_hl
                                        end
                                    end
                                    return hl
                                end,
                            }
                        }
                    }
                }
            },

            sources = {
                default = { 'lsp', 'path', 'snippets', 'buffer' },
            },

            fuzzy = { implementation = "prefer_rust_with_warning" }
        })

        vim.api.nvim_create_autocmd('User', {
            pattern = 'BlinkCmpMenuOpen',
            callback = function()
                require("copilot.suggestion").dismiss()
                vim.b.copilot_suggestion_hidden = true
            end,
        })

        vim.api.nvim_create_autocmd('User', {
            pattern = 'BlinkCmpMenuClose',
            callback = function()
                vim.b.copilot_suggestion_hidden = false
            end,
        })
    end
}
