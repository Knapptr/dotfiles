-- Lua config for Nvim
----KEYS
local function map (mode,key,remap)
  vim.keymap.set(mode,key,remap,{silent = true})
end

vim.g.mapleader = ","
map("n","<leader>a",":pwd")
map("i","<C-c>","<ESC>")
-- edit / source init.lua
map("n","<leader>rc",":e ~/.config/nvim/init.lua<cr>")
map("n","<leader>rr",":so ~/.config/nvim/init.lua<cr>")
-- turn off search highlighting
map("n","<space>",":noh<cr>")
-- make windows even/zoom in on one
map("n","-","<c-w>|")
map("n","=","<c-w>=")
-- " Select buffers with alt+ alt _
map("n","<M-=>",":bn<cr>")
map("n","<M-->",":bp<cr>")
-- "open fugitive
map("n","<leader>git",":Git<cr>")

-- "General Setting 
vim.opt.termguicolors = true
vim.opt.backspace = "indent,eol,start"
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.ruler = true
vim.opt.showcmd = true
vim.opt.showcmd = true
vim.opt.incsearch = true
vim.opt.linebreak = true
vim.opt.hlsearch = true
vim.opt.hidden = true
vim.opt.wrapmargin=0
vim.opt.textwidth=0
vim.opt.compatible = false
vim.opt.wrap = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.swapfile = false
vim.opt.scrolloff=4
vim.opt.signcolumn = "yes"
vim.opt.visualbell = false
vim.opt.breakindent = true
vim.opt.colorcolumn="80"
-- "tabs
vim.opt.tabstop=2
vim.opt.softtabstop=2
vim.opt.shiftwidth=2
vim.opt.expandtab = true
-- " mouse
vim.opt.mouse="a"

-- "MISC BITS

-- "Correct highlighting for JSON
-- autocmd FileType json syntax match Comment +\/\/.\+$+

-- "Autocomplete in HTML files
-- autocmd FileType html set omnifunc=htmlcomplete#CompleteTags



-- tmux navigator settings
-- let g:tmux_navigator_no_mappings = 1
vim.g.tmux_navigator_no_mappings = 1
map("n","<M-h>",":TmuxNavigateLeft<cr>")
map("n","<M-l>",":TmuxNavigateRight<cr>")
map("n","<M-j>",":TmuxNavigateDown<cr>")
map("n","<M-k>",":TmuxNavigateUp<cr>")

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
  Plug 'nvim-lua/plenary.nvim' 
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'neovim/nvim-lspconfig'
	Plug 'folke/tokyonight.nvim'
	Plug 'tpope/vim-commentary'
	Plug 'tpope/vim-surround'
	Plug 'tpope/vim-fugitive'
	Plug 'christoomey/vim-tmux-navigator'
	Plug 'gruvbox-community/gruvbox' 
	Plug 'leafgarland/typescript-vim'
  Plug 'nvim-lualine/lualine.nvim'
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'akinsho/bufferline.nvim',{'tag': 'v2.*'}
  Plug 'hrsh7th/nvim-cmp'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-path'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'L3MON4D3/LuaSnip',{'tag':'<CurrentMajor>.*'}
  Plug 'nvim-treesitter/nvim-treesitter',{'do':':TSUpdate'}
  Plug 'epwalsh/obsidian.nvim'
 
call plug#end()
]])
-- removed from above
	-- Plug 'junegunn/fzf',{'do':{-> fzf#install()}}

-- Obsidian settings
require "obsidian".setup({
  dir = "/mnt/c/Users/knapp/Documents/TKnapp",
  completion = {nvim_cmp = true}
})
-- "TELESCOPE SETTINGS/BINDS
map("n","<leader>ff","<cmd>Telescope find_files<cr>")
map("n","<leader>bb","<cmd>Telescope buffers<cr>")
map("n","<leader>gg","<cmd>Telescope live_grep<cr>")
--
-- LSP SETUP
vim.opt.completeopt={"menu","menuone","noselect"}
vim.keymap.set('n','<leader>rn',vim.lsp.buf.rename,{silent=true,buffer=0,noremap=true})
--
require('lsp')
require('lsp.paths')  
require('lsp.completion')
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
  -- define autocommands
vim.api.nvim_create_autocmd("BufWritePre",{command="lua vim.lsp.buf.format()"})
-- Colorscheme
vim.cmd "colorscheme tokyonight" 
-- " EDITED 9/9/2022 TK
