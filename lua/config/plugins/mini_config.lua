return {
    'echasnovski/mini.nvim',
    version = '*',
    config = function()
        require("mini.comment").setup({})
        require("mini.pairs").setup({})
        require("mini.icons").setup({})
        require("mini.surround").setup({
            mappings = {
                add = '<leader>aa',       -- Add surrounding in Normal and Visual modes
                delete = '<leader>ad',    -- Delete surrounding
                find = '<leader>af',      -- Find surrounding (to the right)
                find_left = '<leader>aF', -- Find surrounding (to the left)
                highlight = '<leader>ah', -- Highlight surrounding
                replace = '<leader>ar',   -- Replace surrounding
            }
        })
    end
}
