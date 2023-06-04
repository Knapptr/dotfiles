-- Lua config for Nvim
--clang
-- require 'lspconfig'.clangd.setup{}
----KEYS
local function map(mode, key, remap)
    vim.keymap.set(mode, key, remap, { silent = true })
end

vim.g.mapleader = ","
map("n", "<leader>a", ":pwd")
map("n", "<leader>e", ":Lexplore<cr>")
map("i", "<C-c>", "<ESC>")
-- edit / source init.lua
map("n", "<leader>rc", ":e ~/.config/nvim/init.lua<cr>")
map("n", "<leader>rr", ":so ~/.config/nvim/init.lua<cr>")
-- turn off search highlighting
map("n", "<space>", ":noh<cr>")
-- make windows even/zoom in on one
map("n", "-", "<c-w>|")
map("n", "=", "<c-w>=")
-- " Select buffers with alt+ alt _
map("n", "<M-=>", ":bn<cr>")
map("n", "<M-->", ":bp<cr>")
-- "open fugitive
map("n", "<leader>git", ":Git<cr>")
-- toggle ZEN MODE
map("n", "<leader>z", ":ZenMode<cr>")
-- Enter Explerer
map("n", "<leader>pp", ":Ex<cr>")
-- "General Setting
vim.opt.splitright = true
vim.opt.termguicolors = true
vim.opt.backspace = "indent,eol,start"
vim.opt.relativenumber = false -- I go back and forth on this
vim.opt.number = true
vim.opt.ruler = true
vim.opt.showcmd = true
vim.opt.showcmd = true
vim.opt.incsearch = true
vim.opt.linebreak = true
vim.opt.hlsearch = true
vim.opt.hidden = true
vim.opt.wrapmargin = 0
vim.opt.textwidth = 0
vim.opt.compatible = false
vim.opt.wrap = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.swapfile = false
vim.opt.scrolloff = 4
vim.opt.signcolumn = "no"
vim.opt.visualbell = false
vim.opt.breakindent = true
-- vim.opt.colorcolumn = "80"
-- "tabs
-- THIS IS LIKELY OVERWRITTEN BY tpope/vim-slueth
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = -1
vim.opt.smarttab = true
-- " mouse
vim.opt.mouse = "a"

-- "MISC BITS

-- "Correct highlighting for JSON
-- autocmd FileType json syntax match Comment +\/\/.\+$+

-- "Autocomplete in HTML files
-- autocmd FileType html set omnifunc=htmlcomplete#CompleteTags



-- tmux navigator settings
-- let g:tmux_navigator_no_mappings = 1
vim.g.tmux_navigator_no_mappings = 1
map("n", "<M-h>", ":TmuxNavigateLeft<cr>")
map("n", "<M-l>", ":TmuxNavigateRight<cr>")
map("n", "<M-j>", ":TmuxNavigateDown<cr>")
map("n", "<M-k>", ":TmuxNavigateUp<cr>")

-- " WSL yank support
vim.cmd([[
let s:clip = '/mnt/c/Windows/System32/clip.exe'  
if executable(s:clip)
    augroup WSLYank
        autocmd!
        autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
    augroup END
endif
]])

-- "PLUGINS
vim.cmd([[
call plug#begin()
    Plug 'akinsho/bufferline.nvim'
    Plug 'dracula/vim', { 'as': 'dracula' }
    Plug 'lukas-reineke/indent-blankline.nvim'
    Plug 'shaunsingh/solarized.nvim'
    Plug 'daschw/leaf.nvim'
    Plug 'arcticicestudio/nord-vim'
    Plug 'ellisonleao/gruvbox.nvim'
    Plug 'nvim-lua/plenary.nvim' 
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'neovim/nvim-lspconfig'
    Plug 'folke/tokyonight.nvim'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-fugitive'
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'leafgarland/typescript-vim'
    Plug 'nvim-lualine/lualine.nvim'
    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'nvim-treesitter/nvim-treesitter',{'do':':TSUpdate'}
    Plug 'epwalsh/obsidian.nvim'
    Plug 'windwp/nvim-autopairs'
    Plug 'folke/zen-mode.nvim'
    Plug 'iamcco/markdown-preview.nvim', {'do': 'cd app && npm install'}
    Plug 'tpope/vim-sleuth'
    Plug 'VonHeikemen/lsp-zero.nvim', {'branch':'v2.x'}
    Plug 'hrsh7th/nvim-cmp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-nvim-lua'
    Plug 'saadparwaiz1/cmp_luasnip'
    Plug 'neovim/nvim-lspconfig',
    Plug 'williamboman/mason.nvim',
    Plug 'williamboman/mason-lspconfig.nvim'
    Plug 'L3MON4D3/LuaSnip'
    Plug 'dNitro/vim-pug-complete', { 'for': ['jade', 'pug'] }
    Plug 'digitaltoad/vim-pug', 
    Plug 'shaunsingh/solarized.nvim',
 
call plug#end()
]])
-- run autopairs
require("nvim-autopairs").setup {}
-- removed from above
-- Plug 'junegunn/fzf',{'do':{-> fzf#install()}}

-- -ZEN MODE-
require("zen-mode").setup {
    window = { backdrop = 1 },
}
-- "TELESCOPE SETTINGS/BINDS
map("n", "<leader><leader>", "<cmd>Telescope find_files<cr>")
map("n", "<leader>bb", "<cmd>Telescope buffers<cr>")
map("n", "<leader>gg", "<cmd>Telescope live_grep<cr>")

require 'telescope'.setup({
    defaults = {
        find_command = { "rg", "-i", "--hidden", "--files", "-g", "!.git" }
    }
})
-- LSP SETUP
-- lsp0

lsp_setup = {
    float_border = 'rounded',
    call_servers = 'local',
    configure_diagnostics = true,
    setup_servers_on_start = true,
    set_lsp_keymaps = {
        preserve_mappings = false,
        omit = {},
    },
    manage_nvim_cmp = {
        set_sources = 'recommended',
        set_basic_mappings = true,
        set_extra_mappings = false,
        use_luasnip = true,
        set_format = true,
        documentation_window = true,
    },
}
local lsp = require("lsp-zero").preset(lsp_setup)
-- lsp.preset("recommended")
lsp.on_attach(function(client, bufnr)
    lsp.default_keymaps({ buffer = bufnr })
end)

lsp.format_on_save({
    format_opts = {
        async = false,
        timeout_ms = 10000,
    },
    servers = {
        ['lua_ls'] = { 'lua' },
        ['rust_analyzer'] = { 'rust' },
        ['tsserver'] = { 'javascript', 'typescript' }
        -- if you have a working setup with null-ls
        -- you can specify filetypes it can format.
        -- ['null-ls'] = {'javascript', 'typescript'},
    }
})
lsp.nvim_workspace()

require('lspconfig').tailwindcss.setup {
    settings = {
        scss = { validate = false },
        editor = {
            quickSuggestions = { strings = true },
            autoClosingQuotes = 'always',
        },
        tailwindCSS = {
            experimental = {
                classRegex = {
                    'tw`([^`]*)', -- tw`...`
                    'tw="([^"]*)', -- <div tw="..." />
                    'tw={"([^"}]*)', -- <div tw={"..."} />
                    'tw\\.\\w+`([^`]*)', -- tw.xxx`...`
                    'tw\\(.*?\\)`([^`]*)', -- tw(Component)`...`
                },
            },
            includeLanguages = {
                typescript = 'javascript',
                typescriptreact = 'javascript',
            },
        },
    },
}
lsp.setup()
-- vim.opt.completeopt = { "menu", "menuone", "noselect" }
-- -- rename
-- vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { silent = true, buffer = 0, noremap = true })
-- -- diagnostics
-- -- Configuration
vim.diagnostic.config({
    virtual_text = false,
    underline = true
})
-- diagnostic window on key
function showDiagnostics()
    local opts = {
        focusable = false,
        close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
        border = 'rounded',
        source = 'always',
        prefix = ' ',
    }
    vim.diagnostic.open_float(nil, opts)
end

vim.keymap.set('n', '<leader>d', showDiagnostics)
-- popup window diag
vim.api.nvim_create_autocmd("CursorHold", {
    buffer = bufnr,
    callback = function()
    end
})
---nvim-treesitter
require('treesitter')
-- start bufferline
require('bufferline').setup({
})
-- start status bar
require('lualine').setup({
    options = {
        theme = 'tokyonight'
    }
})
-- format before save
-- vim.api.nvim_create_autocmd("BufWritePre", { command = "lua vim.lsp.buf.formatting_sync()" })
-- Colorscheme
vim.cmd "colorscheme dracula"
-- " EDITED 12/4/2022 TK
