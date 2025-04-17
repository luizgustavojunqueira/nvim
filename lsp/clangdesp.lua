return {
    cmd = {
        "/home/luizg/llvm-project/build/bin/clangd",
        "--background-index",
        "-j=12",
        "--clang-tidy",
        "--all-scopes-completion",
        "--cross-file-rename",
        "--completion-style=detailed",
        "--header-insertion-decorators",
        "--header-insertion=iwyu",
        "--pch-storage=memory",
        "--suggest-missing-includes",
        -- "--query-driver=/home/luizg/.platformio/packages/toolchain-xtensa-esp32/bin/xtensa-esp32-elf-gcc*,/home/luizg/.platformio/packages/toolchain-xtensa-esp32/bin/xtensa-esp32-elf-g++*,xtensa-esp32-elf-gcc*,xtensa-esp32-elf-g++*",
        "--query-driver=/home/luizg/.platformio/packages/toolchain-xtensa/bin/xtensa-lx106-elf-g++*,/home/luizg/.platformio/packages/toolchain-xtensa/bin/xtensa-lx106-elf-g++*,xtensa-lx106-elf-gcc*,xtensa-lx106-elf-g++*",
        "--log=verbose",
    },
    filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
    root_markers = { "compile_commands.json", ".clangd" },
    single_file_support = true,
    capabilities = {
        offsetEncoding = { "utf-8", "utf-16" },
        textDocument = {
            completion = {
                completionItem = {
                    commitCharactersSupport = false,
                    deprecatedSupport = true,
                    documentationFormat = { "markdown", "plaintext" },
                    insertReplaceSupport = true,
                    insertTextModeSupport = {
                        valueSet = { 1 }
                    },
                    labelDetailsSupport = true,
                    preselectSupport = false,
                    resolveSupport = {
                        properties = { "documentation", "detail", "additionalTextEdits", "command", "data" }
                    },
                    snippetSupport = true,
                    tagSupport = {
                        valueSet = { 1 }
                    }
                },
                completionList = {
                    itemDefaults = { "commitCharacters", "editRange", "insertTextFormat", "insertTextMode", "data" }
                },
                contextSupport = true,
                editsNearCursor = true,
                insertTextMode = 1
            },
            foldingRange = {
                dynamicRegistration = false,
                lineFoldingOnly = true
            }
        }
    }
}
