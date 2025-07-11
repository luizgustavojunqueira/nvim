vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.nuw = 3

vim.opt.mouse = "a"
vim.opt.completeopt = "menuone,noselect"
vim.opt.breakindent = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.wo.signcolumn = "yes"
vim.opt.timeoutlen = 300

vim.opt.clipboard = "unnamedplus"
vim.o.whichwrap = 'bs<>[]hl'
vim.opt.wrap = true
vim.opt.linebreak = true
vim.o.sidescrolloff = 8

vim.o.numberwidth = 4
vim.o.shiftwidth = 4

vim.o.cursorline = false
vim.o.splitright = true
vim.o.splitbelow = true

vim.o.smartindent = true

vim.o.showtabline = 2
vim.o.backspace = 'indent,eol,start'

vim.o.pumheight = 10

vim.o.fileencoding = "utf-8"
vim.o.cmdheight = 1
vim.o.autoindent = true

vim.opt.shortmess:append 'c'
vim.opt.iskeyword:append '-'

vim.opt.formatoptions:remove { 'c', 'r', 'o' }

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8

vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

vim.g.mapleader = " "

vim.opt.conceallevel = 2

vim.cmd('filetype plugin indent on') -- Enable all filetype plugins

vim.filetype.add({
    extension = {
        ['http'] = 'http',
    },
})

vim.g.lazygit_floating_window_winblend = 0 -- transparency of floating window'

local diagnostic_signs = {
    [vim.diagnostic.severity.ERROR] = "",
    [vim.diagnostic.severity.WARN] = "",
    [vim.diagnostic.severity.INFO] = "",
    [vim.diagnostic.severity.HINT] = "󰌵",
}

local shorter_source_names = {
    ["Lua Diagnostics."] = "Lua",
    ["Lua Syntax Check."] = "Lua",
}

local function diagnostic_format(diagnostic)
    return string.format(
        "%s %s (%s): %s",
        diagnostic_signs[diagnostic.severity],
        shorter_source_names[diagnostic.source] or diagnostic.source,
        diagnostic.code,
        diagnostic.message
    )
end

vim.diagnostic.config({
    virtual_text = {
        spacing = 4,
        prefix = "",
        format = diagnostic_format,
    },
    signs = {
        text = diagnostic_signs,
    },
    virtual_lines = {
        current_line = true,
        format = diagnostic_format,
    },
    underline = true,
    severity_sort = true,
})
