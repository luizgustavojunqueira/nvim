return {
    "rebelot/kanagawa.nvim",
    config = function()
        -- Default options:
        require("kanagawa").setup({
            compile = false,  -- enable compiling the colorscheme
            undercurl = true, -- enable undercurls
            commentStyle = { italic = true, bold = true },
            functionStyle = { bold = true },
            keywordStyle = { italic = true },
            statementStyle = { bold = true },
            typeStyle = { bold = true },
            transparent = true,    -- do not set background color
            dimInactive = false,   -- dim inactive window `:h hl-NormalNC`
            terminalColors = true, -- define vim.g.terminal_color_{0,17}
            colors = {             -- add/modify theme and palette colors
                palette = {},
                theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
            },
            background = {     -- map the value of 'background' option to a theme
                dark = "wave", -- try "dragon" !
                light = "lotus",
            },
            overrides = function(colors)
                local theme = colors.theme
                local makeDiagnosticColor = function(color)
                    local c = require("kanagawa.lib.color")
                    return { fg = color, bg = c(color):blend(theme.ui.bg, 0.95):to_hex() }
                end
                return {
                    NormalFloat                = { bg = "none" },
                    FloatBorder                = { bg = "none" },
                    FloatTitle                 = { bg = "none" },
                    SignColumn                 = { bg = "none", fg = theme.ui.fg_dim },
                    LineNr                     = { bg = "none", fg = theme.ui.fg_dim },
                    GitSignsAdd                = { bg = "none" },
                    GitSignsChange             = { bg = "none" },
                    GitSignsDelete             = { bg = "none" },

                    -- Save an hlgroup with dark background and dimmed foreground
                    -- so that you can use it where your still want darker windows.
                    -- E.g.: autocmd TermOpen * setlocal winhighlight=Normal:NormalDark
                    NormalDark                 = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },

                    -- Popular plugins that open floats will link to NormalFloat by default;
                    -- set their background accordingly if you wish to keep them dark and borderless
                    LazyNormal                 = { bg = theme.ui.bg, fg = theme.ui.fg_dim },
                    SnacksPicker               = { bg = theme.ui.bg, fg = theme.ui.fg_dim },
                    SnacksPickerBorder         = { bg = theme.ui.bg, fg = theme.ui.fg_dim },
                    SnacksPickerTitle          = { bg = theme.ui.bg, fg = theme.ui.fg_dim },
                    SnacksPickerDirectory      = { bg = theme.ui.bg, fg = theme.ui.fg_dim },
                    MasonNormal                = { bg = theme.ui.bg, fg = theme.ui.fg_dim },
                    TabLineFill                = { bg = "none", fg = theme.ui.fg_dim },
                    TabLineSel                 = { bg = "none", fg = theme.ui.fg },
                    Pmenu                      = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 }, -- add `blend = vim.o.pumblend` to enable transparency

                    PmenuSel                   = { fg = "NONE", bg = theme.ui.bg_p2 },
                    PmenuSbar                  = { bg = theme.ui.bg_m1 },
                    PmenuThumb                 = { bg = theme.ui.bg_p2 },
                    DiagnosticVirtualTextHint  = makeDiagnosticColor(theme.diag.hint),
                    DiagnosticVirtualTextInfo  = makeDiagnosticColor(theme.diag.info),
                    DiagnosticVirtualTextWarn  = makeDiagnosticColor(theme.diag.warning),
                    DiagnosticVirtualTextError = makeDiagnosticColor(theme.diag.error),

                }
            end,

        })

        require("kanagawa").load()
    end,
}
