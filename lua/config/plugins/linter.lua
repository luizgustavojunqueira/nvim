return {
    'mfussenegger/nvim-lint',
    config = function()
        require('lint').linters_by_ft = {
            cpp = { 'clangtidy' },
        }

        require('lint').linters.cpp = {
            cmd = 'clang-tidy',
            args = { '--quiet', '--fix', '%t' },
            stream = 'stderr',
            parser = require('lint.parser').from_pattern(
                [[(%d+):(%d+):(%d+): (.*)]],
                { 'row', 'col', 'code', 'message' }
            ),
        }
        vim.api.nvim_create_autocmd({ "BufWritePost" }, {
            callback = function()
                require("lint").try_lint()
            end,
        })
    end
}
