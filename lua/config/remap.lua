vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opts = { noremap = true, silent = true }

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move the selected lines down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move the selected lines up" })

vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Move the cursor down half a page" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Move the cursor up half a page" })

vim.keymap.set("n", "n", "nzzzv", { desc = "Move the cursor to the next match" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Move the cursor to the previous match" })

vim.keymap.set("x", "<leader>p", '"_dP', { desc = "Paste without copying into register" })

vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle the file explorer" })

vim.keymap.set("n", "<leader>d", ":lua vim.diagnostic.open_float(0, {scope='line'})<CR>",
    { desc = "Open the diagnostic float window" })

-- Allow moving the cursor through wrapped lines with j, k
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'",
    { expr = true, silent = true, noremap = true, desc = "Move the cursor up through wrapped lines" })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'",
    { expr = true, silent = true, noremap = true, desc = "Move the cursor down through wrapped lines" })

-- clear highlights
vim.keymap.set('n', '<Esc>', ':noh<CR>', opts)

-- delete single character without copying into register
vim.keymap.set('n', 'x', '"_x', opts)

-- Resize with arrows
vim.keymap.set('n', '<Up>', ':resize -2<CR>', opts)
vim.keymap.set('n', '<Down>', ':resize +2<CR>', opts)
vim.keymap.set('n', '<Left>', ':vertical resize -2<CR>', opts)
vim.keymap.set('n', '<Right>', ':vertical resize +2<CR>', opts)

-- Increment/decrement numbers
vim.keymap.set('n', '<leader>+', '<C-a>', opts) -- increment
vim.keymap.set('n', '<leader>-', '<C-x>', opts) -- decrement

-- Window management
vim.keymap.set('n', '<leader>v', '<C-w>v', { desc = "Split window vertically" })
vim.keymap.set('n', '<leader>h', '<C-w>s', { desc = "Split window horizontally" })
vim.keymap.set('n', '<leader>cw', ':close<CR>', { desc = "Close the current window" })

-- Replace word under cursor
vim.keymap.set('n', '<leader>j', '*``cgn', { desc = "Replace the word under the cursor" })

vim.keymap.set('n', '<F2>', '<cmd>lua LspRename()<cr>', opts)
