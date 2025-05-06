return {
    'stevearc/overseer.nvim',
    config = function()
        local overseer = require("overseer")
        overseer.setup({})

        local function parse_make_targets(makefile_path)
            local targets = {}
            for line in io.lines(makefile_path) do
                local target = line:match("^([%w%-%_]+):")
                if target and target ~= "" and not target:match("^%.") then
                    targets[target] = true
                end
            end
            local list = {}
            for t in pairs(targets) do
                table.insert(list, t)
            end
            return list
        end

        overseer.register_template({
            name = "make_targets_with_env_port_runtests",
            condition = {
                callback = function(opts)
                    local makefile = vim.fs.find("Makefile", { upward = true, type = "file", path = opts.dir })[1]
                    return makefile ~= nil
                end,
            },
            cache_key = function(opts)
                return vim.fs.find("Makefile", { upward = true, type = "file", path = opts.dir })[1]
            end,
            generator = function(opts, cb)
                local makefile = vim.fs.find("Makefile", { upward = true, type = "file", path = opts.dir })[1]
                if not makefile then
                    cb({})
                    return
                end

                local targets = parse_make_targets(makefile)
                local templates = {}

                for _, target in ipairs(targets) do
                    table.insert(templates, {
                        name = "make: " .. target,
                        params = {
                            env_value = {
                                type = "string",
                                default = "esp32_nodemcu_test",
                                description = "Value for ENV variable",
                            },
                            port_value = {
                                type = "string",
                                default = "",
                                description = "Value for PORT variable (optional)",
                            },
                            run_tests = {
                                type = "string",
                                default = "",
                                description = "Value for RUN_TESTS variable (optional, semicolon separado)",
                            },
                        },
                        builder = function(params)
                            local env_vars = {
                                ENV = params.env_value,
                            }
                            if params.port_value ~= "" then
                                env_vars.PORT = params.port_value
                            end
                            if params.run_tests ~= "" then
                                env_vars.RUN_TESTS = params.run_tests
                            end
                            return {
                                cmd = { "make", target },
                                env = env_vars,
                                components = { "default" },
                            }
                        end,
                    })
                end

                cb(templates)
            end,
        })

        vim.api.nvim_set_keymap(
            "n",
            "<leader>ot",
            "<cmd>OverseerToggle<cr>",
            { noremap = true, silent = true }
        )

        vim.api.nvim_set_keymap(
            "n",
            "<leader>or",
            "<cmd>OverseerRun<cr>",
            { noremap = true, silent = true }
        )
    end
}
