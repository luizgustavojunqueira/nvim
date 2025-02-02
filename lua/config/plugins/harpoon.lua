return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local harpoon = require("harpoon")

        -- REQUIRED
        harpoon:setup()
        -- REQUIRED

        vim.keymap.set("n", "<leader>ha", function() harpoon:list():add() end,
            { desc = "Add a directory to the harpoon marks" })
        vim.keymap.set("n", "<leader>he", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end,
            { desc = "Toggle the harpoon marks" })

        vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end,
            { desc = "Select the first harpoon mark" })
        vim.keymap.set("n", "<C-j>", function() harpoon:list():select(2) end,
            { desc = "Select the second harpoon mark" })
        vim.keymap.set("n", "<C-k>", function() harpoon:list():select(3) end,
            { desc = "Select the third harpoon mark" })
        vim.keymap.set("n", "<C-l>", function() harpoon:list():select(4) end,
            { desc = "Select the fourth harpoon mark" })
    end,
}
