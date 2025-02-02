return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.6",
        dependencies = { "nvim-lua/plenary.nvim", "BurntSushi/ripgrep", "sharkdp/fd", "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },

        config = function()
            require("telescope").setup({})

            local builtin = require('telescope.builtin')
            vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Search for files' })
            vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Livre grep' })
            vim.keymap.set('n', '<leader>fr', builtin.lsp_references, { desc = 'Find references of word under cursor' })
            vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Search for buffers' })
            vim.keymap.set('n', '<leader>fd', builtin.lsp_definitions,
                { desc = 'Find definitions for word under cursor' })
        end,
    },
    {
        "nvim-telescope/telescope-frecency.nvim",
        config = function()
            require("telescope").load_extension "frecency"
        end,
    }
}
