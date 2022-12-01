local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

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

local rust_server = require "lsp.rust"

rust_server.setup({
    capabilities = capabilities,
    imports = {
        granularity = {
            group = "module",
        },
        prefix = "self",
    },
    cargo = {
        buildScripts = {
            enable = true,
        },
    },
    procMacro = {
        enable = true
    },
    on_attach = function()
        vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = 0 })
        vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, { buffer = 0 })
    end

})
local servers = {
    require "lsp.ts",
    require "lsp.bash",
    require "lsp.lua",
    require "lsp.c",
}

for _, server in ipairs(servers) do
    assignDefaultKeybinds(server)
end
