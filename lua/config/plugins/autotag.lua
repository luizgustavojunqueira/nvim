return {
    'windwp/nvim-ts-autotag',
    ft = { 'html', 'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'svelte', 'vue' },
    config = function()
        require('nvim-ts-autotag').setup({
            enable_close_on_slash = true,
        })
    end,
}
