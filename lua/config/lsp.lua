-- nvim/lua/config/lsp.lua

local lspconfig = require("lspconfig")
local capabilities = vim.lsp.protocol.make_client_capabilities()

-- Integração com o seu blink.cmp
capabilities = require("blink.cmp").get_lsp_capabilities(capabilities)

vim.api.nvim_create_autocmd("LspAttach", {
    desc = "LSP actions",
    callback = function(event)
        local opts = { buffer = event.buf }

        vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
        vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
        vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
        vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
        vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
        vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
        vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
        vim.keymap.set("n", "gc", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
        vim.keymap.set({ "n", "x" }, "<F3>", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opts)
        vim.keymap.set("n", "<F4>", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
    end,
})

-- Função on_attach padrão para todos os LSPs
local on_attach = function(client, bufnr)
    -- Pode adicionar log aqui se quiser
    -- vim.notify("LSP started: " .. client.name, vim.log.levels.INFO, { title = "LSP" })
end

-- Configurações gerais que todos os LSPs podem usar
local default_lsp_setup_opts = {
    on_attach = on_attach,
    capabilities = capabilities,
}

vim.lsp.enable("clangdesp")

-- Configura o vtsls
-- Ele vai carregar as opções do seu arquivo nvim/lsp/vtsls.lua
-- lspconfig.vtsls.setup(vim.tbl_deep_extend("force", {}, default_lsp_setup_opts, require("lsp.vtsls")))
--
-- -- Configura outros LSPs que você usa
-- lspconfig.luals.setup(default_lsp_setup_opts)
-- lspconfig.clangd.setup(default_lsp_setup_opts) -- Verifique se o nome é 'clangd' e não 'clangdesp'
-- lspconfig.gopls.setup(default_lsp_setup_opts)
-- lspconfig.templ.setup(default_lsp_setup_opts)
-- lspconfig.elixir.setup(default_lsp_setup_opts)
-- lspconfig.php.setup(default_lsp_setup_opts)
-- lspconfig.hyprls.setup(default_lsp_setup_opts)
-- lspconfig["java-language-server"].setup(default_lsp_setup_opts) -- Note a notação de colchetes para nomes com hífen
-- lspconfig.intelephense.setup(default_lsp_setup_opts)
