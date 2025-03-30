return {
    cmd          = { 'vue-language-server', '--stdio' },
    filetypes    = { 'vue' },
    root_markers = { 'package.json', '.git' },
    init_options = {
        vue = {
            hybridMode = false,
        },
        typescript = {
            tsdk = '/home/luizg/.local/share/mise/installs/node/22.13.1/lib/node_modules/typescript/lib'
        },
    },
}
