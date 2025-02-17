return {
    'echasnovski/mini.nvim',
    version = '*',
    config = function()
        require("mini.comment").setup({})
        require("mini.pairs").setup({})
        require("mini.surround").setup({
            mappings = {
                add = '<leader>sa',        -- Add surrounding in Normal and Visual modes
                delete = '<leader>sd',     -- Delete surrounding
                find = '<leader>sf',       -- Find surrounding (to the right)
                find_left = '<leader>sF',  -- Find surrounding (to the left)
                highlight = '<leader>sh',  -- Highlight surrounding
                replace = '<leader>sr',    -- Replace surrounding
                suffix_last = '<leader>l', -- Suffix to search with "prev" method
                suffix_next = '<leader>n', -- Suffix to search with "next" method
            }
        })
    end
}
