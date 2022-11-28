local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

local function assignDefaultKeybinds(server)
    server.setup({
        capabilities = capabilities,
        on_attach = function()
            vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = 0 })
            vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, { buffer = 0 })
        end
    })
end

local servers = {
    require "lsp.ts",
    require "lsp.bash",
    require "lsp.lua",
    require "lsp.c",
    require "lsp.rust"
}

for _, server in ipairs(servers) do
    assignDefaultKeybinds(server)
end
