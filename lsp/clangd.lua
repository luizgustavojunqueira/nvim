return {
    cmd = {
        "/home/luizg/Downloads/esp-clang/bin/clangd",
        "--background-index",
        "-j=12",
        "--query-driver=**",
        "--clang-tidy",
        "--all-scopes-completion",
        "--cross-file-rename",
        "--completion-style=detailed",
        "--header-insertion-decorators",
        "--header-insertion=iwyu",
        "--pch-storage=memory",
        "--suggest-missing-includes",
        "--background-index",
        "--query-driver=/home/luizg/.platformio/packages/toolchain-xtensa-esp32/bin/xtensa-esp32-elf-gcc*,/home/luizg/.platformio/packages/toolchain-xtensa-esp32/bin/xtensa-esp32-elf-g++*,xtensa-esp32-elf-gcc*,xtensa-esp32-elf-g++*",
        "--log=verbose",
    },
    filetypes = {
        "c",
        "cpp",
    },
    root_markers = { "compile_commands.json", ".clang" },

}
