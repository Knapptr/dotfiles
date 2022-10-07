"KEYS

"though not strictly necessary to keep default behavior, this allows for
"block-wise visual selection insert to work. By default C-c aborts.
inoremap <C-c> <ESC>
let mapleader = ","
nnoremap <silent> ,rc :e ~/.config/nvim/init.vim <cr>
nnoremap <silent> ,rr :so ~/.config/nvim/init.vim <cr>
nnoremap <silent> <space> :set hlsearch !<cr>
nnoremap - <c-w>\|
nnoremap = <c-w>=
nmap <leader>- :%bd<cr

"General Settings

set backspace=indent,eol,start
set ruler
set number
set showcmd
set incsearch
set linebreak
set hlsearch
set hidden
set wrapmargin=0
set textwidth=0
set wrap
set relativenumber
set nocompatible
set ignorecase
set smartcase
set smartindent
set autoindent
set noswapfile
set scrolloff=4
set signcolumn=yes
set novisualbell
set breakindent
set colorcolumn=80
"tabs
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
" mouse
set mouse=a

"MISC BITS
"
"no automatic newline comment on o

autocmd FileType * setlocal formatoptions-=o

"Correct highlighting for JSON
autocmd FileType json syntax match Comment +\/\/.\+$+

"Autocomplete in HTML files
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags

" toggle paste
nnoremap <silent> ,v :set paste! <cr>
"open fugitive
nnoremap <silent> ,git :0Git<cr>

" Select buffers with alt+ alt _
nnoremap <silent> = :bn<cr>
nnoremap <silent> - :bp<cr>

" tmux navigator settings
let g:tmux_navigator_no_mappings = 1

nnoremap <silent>  h :TmuxNavigateLeft<cr>
nnoremap <silent> j :TmuxNavigateDown<cr>
nnoremap <silent> k :TmuxNavigateUp<cr>
nnoremap <silent> l :TmuxNavigateRight<cr>
nnoremap <silent> \ :TmuxNavigatePrevious<cr>

" WSL yank support
let s:clip = '/mnt/c/Windows/System32/clip.exe'  
if executable(s:clip)
    augroup WSLYank
        autocmd!
        autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
    augroup END
endif

"PLUGINS

call plug#begin()
  Plug 'nvim-lua/plenary.nvim' " A dependency of telescope
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'neovim/nvim-lspconfig'
	Plug 'folke/tokyonight.nvim'
	Plug 'neoclide/jsonc.vim'
	Plug 'tpope/vim-commentary'
	Plug 'tpope/vim-surround'
	Plug 'tpope/vim-fugitive'
	Plug 'pangloss/vim-javascript'
	Plug 'christoomey/vim-tmux-navigator'
	Plug 'gruvbox-community/gruvbox' 
	Plug 'maxmellon/vim-jsx-pretty'
	Plug 'leafgarland/typescript-vim'
	Plug 'junegunn/fzf',{'do':{-> fzf#install()}}
	Plug 'junegunn/fzf.vim'
call plug#end()

"TELESCOPE SETTINGS/BINDS
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>gg <cmd>Telescope live_grep<cr>
nnoremap <leader>bb <cmd>Telescope buffers<cr>
" EDITED 9/9/2022 TK
