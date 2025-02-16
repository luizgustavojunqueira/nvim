return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
        scope = {
            enabled = true,
        },
        rename = {
            enabled = true,
        },
        lazygit = {
            enabled = true,
        },
        input = {
            enabled = true,
        },
        notifier = {
            enabled = true,
        },
        quickfile = {
            enabled = true,
        },
        explorer = {
            enabled = true,
            replace_netrw = true,
        },
        picker = {
            enabled = true,

            sources = {
                explorer = {
                    enabled = true,
                    replace_netrw = true,
                },
            }
        },
        image = {
            enabled = true,

            -- your image configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        },
        indent = {
            enabled = true,

            chunk = {
                enabled = true,
                only_current = false,
                priority = 200,
                hl = "SnacksIndentChunk",
                char = {
                    corner_top = "╭",
                    corner_bottom = "╰",
                    horizontal = "─",
                    vertical = "│",
                    arrow = ">",
                },
            },
        },
        terminal = {
            enabled = true,

            {
                win = { style = "terminal" },
                bo = {
                    filetype = "snacks_terminal",
                },
                wo = {},
                keys = {
                    q = "hide",
                    gf = function(self)
                        local f = vim.fn.findfile(vim.fn.expand("<cfile>"), "**")
                        if f == "" then
                            Snacks.notify.warn("No file under cursor")
                        else
                            self:hide()
                            vim.schedule(function()
                                vim.cmd("e " .. f)
                            end)
                        end
                    end,
                    term_normal = {
                        "<esc>",
                        function(self)
                            self.esc_timer = self.esc_timer or (vim.uv or vim.loop).new_timer()
                            if self.esc_timer:is_active() then
                                self.esc_timer:stop()
                                vim.cmd("stopinsert")
                            else
                                self.esc_timer:start(200, 0, function() end)
                                return "<esc>"
                            end
                        end,
                        mode = "t",
                        expr = true,
                        desc = "Double escape to normal mode",
                    },
                },
            }
        },
    },
    keys = {
        { "<leader><space>", function() Snacks.picker.smart() end,                                   desc = "Smart Find Files" },
        { "<leader>,",       function() Snacks.picker.buffers() end,                                 desc = "Buffers" },
        { "<leader>/",       function() Snacks.picker.grep() end,                                    desc = "Grep" },
        { "<leader>:",       function() Snacks.picker.command_history() end,                         desc = "Command History" },
        { "<leader>n",       function() Snacks.picker.notifications() end,                           desc = "Notification History" },
        { "<leader>e",       function() Snacks.explorer.open() end,                                  desc = "File Explorer" },
        { "<leader>lg",      function() Snacks.lazygit.open() end,                                   desc = "Open lazygit" },
        { "<leader>tt",      function() Snacks.terminal.toggle() end,                                desc = "Open terminal" },
        { "<leader>tn",      function() Snacks.terminal.open() end,                                  desc = "Open terminal" },
        { "<leader>fb",      function() Snacks.picker.buffers() end,                                 desc = "Buffers" },
        { "<leader>fc",      function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File" },
        { "<leader>ff",      function() Snacks.picker.files() end,                                   desc = "Find Files" },
        { "<leader>fg",      function() Snacks.picker.git_files() end,                               desc = "Find Git Files" },
        { "<leader>fp",      function() Snacks.picker.projects() end,                                desc = "Projects" },
        { "<leader>fr",      function() Snacks.picker.recent() end,                                  desc = "Recent" },
        { "<leader>gb",      function() Snacks.picker.git_branches() end,                            desc = "Git Branches" },
        { "<leader>gl",      function() Snacks.picker.git_log() end,                                 desc = "Git Log" },
        { "<leader>gL",      function() Snacks.picker.git_log_line() end,                            desc = "Git Log Line" },
        { "<leader>gs",      function() Snacks.picker.git_status() end,                              desc = "Git Status" },
        { "<leader>gS",      function() Snacks.picker.git_stash() end,                               desc = "Git Stash" },
        { "<leader>gd",      function() Snacks.picker.git_diff() end,                                desc = "Git Diff (Hunks)" },
        { "<leader>gf",      function() Snacks.picker.git_log_file() end,                            desc = "Git Log File" },
        -- Grep
        { "<leader>sb",      function() Snacks.picker.lines() end,                                   desc = "Buffer Lines" },
        { "<leader>sB",      function() Snacks.picker.grep_buffers() end,                            desc = "Grep Open Buffers" },
        { "<leader>sg",      function() Snacks.picker.grep() end,                                    desc = "Grep" },
        { "<leader>sw",      function() Snacks.picker.grep_word() end,                               desc = "Visual selection or word", mode = { "n", "x" } },
        -- search
        { '<leader>s"',      function() Snacks.picker.registers() end,                               desc = "Registers" },
        { '<leader>s/',      function() Snacks.picker.search_history() end,                          desc = "Search History" },
        { "<leader>sa",      function() Snacks.picker.autocmds() end,                                desc = "Autocmds" },
        { "<leader>sb",      function() Snacks.picker.lines() end,                                   desc = "Buffer Lines" },
        { "<leader>sc",      function() Snacks.picker.command_history() end,                         desc = "Command History" },
        { "<leader>sC",      function() Snacks.picker.commands() end,                                desc = "Commands" },
        { "<leader>sd",      function() Snacks.picker.diagnostics() end,                             desc = "Diagnostics" },
        { "<leader>sD",      function() Snacks.picker.diagnostics_buffer() end,                      desc = "Buffer Diagnostics" },
        { "<leader>sh",      function() Snacks.picker.help() end,                                    desc = "Help Pages" },
        { "<leader>sH",      function() Snacks.picker.highlights() end,                              desc = "Highlights" },
        { "<leader>si",      function() Snacks.picker.icons() end,                                   desc = "Icons" },
        { "<leader>sj",      function() Snacks.picker.jumps() end,                                   desc = "Jumps" },
        { "<leader>sk",      function() Snacks.picker.keymaps() end,                                 desc = "Keymaps" },
        { "<leader>sl",      function() Snacks.picker.loclist() end,                                 desc = "Location List" },
        { "<leader>sm",      function() Snacks.picker.marks() end,                                   desc = "Marks" },
        { "<leader>sM",      function() Snacks.picker.man() end,                                     desc = "Man Pages" },
        { "<leader>sp",      function() Snacks.picker.lazy() end,                                    desc = "Search for Plugin Spec" },
        { "<leader>sq",      function() Snacks.picker.qflist() end,                                  desc = "Quickfix List" },
        { "<leader>sR",      function() Snacks.picker.resume() end,                                  desc = "Resume" },
        { "<leader>su",      function() Snacks.picker.undo() end,                                    desc = "Undo History" },
        { "<leader>uC",      function() Snacks.picker.colorschemes() end,                            desc = "Colorschemes" },
        { "gd",              function() Snacks.picker.lsp_definitions() end,                         desc = "Goto Definition" },
        { "gD",              function() Snacks.picker.lsp_declarations() end,                        desc = "Goto Declaration" },
        { "gr",              function() Snacks.picker.lsp_references() end,                          nowait = true,                     desc = "References" },
        { "gI",              function() Snacks.picker.lsp_implementations() end,                     desc = "Goto Implementation" },
        { "gy",              function() Snacks.picker.lsp_type_definitions() end,                    desc = "Goto T[y]pe Definition" },
        { "<leader>ss",      function() Snacks.picker.lsp_symbols() end,                             desc = "LSP Symbols" },
        { "<leader>sS",      function() Snacks.picker.lsp_workspace_symbols() end,                   desc = "LSP Workspace Symbols" },
    },
}
