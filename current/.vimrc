"This is for WSL on windows
if &term =~ '256color'
endif

"load plug if not present
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
"load plugins
call plug#begin('~/.vim/plugged')
"Load Plugins Here
Plug 'neoclide/coc.nvim',{'branch':'release'}
Plug 'neoclide/jsonc.vim'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'pangloss/vim-javascript'
Plug 'christoomey/vim-tmux-navigator'
Plug 'gruvbox-community/gruvbox' 
Plug 'vim-airline/vim-airline-themes'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'leafgarland/typescript-vim'
Plug 'junegunn/fzf',{'do':{-> fzf#install()}}
Plug 'junegunn/fzf.vim'
Plug 'ghifarit53/tokyonight-vim'
call plug#end()

"Setup Coc Extensions
let g:coc_global_extensions = [
			\ 'coc-snippets',
			\ 'coc-emmet',
			\ 'coc-tsserver',
			\ 'coc-html',
			\ 'coc-json',
			\ 'coc-pairs',
			\'coc-jest',
            \'coc-prettier',
            \'coc-eslint'
			\
			\]


"KEYS--------------------------
"Move up by row, not by file line
" nnoremap j gj
" nnoremap k gk
" remap escape
inoremap jk <ESC>
" remap leader
let mapleader = ","
"vimrc edit
nnoremap ,rc :e~/.vimrc<cr>
"source vimrc
nnoremap ,rr :source ~/.vimrc<cr>
"clear highlights
nnoremap <silent> <space> :set hlsearch !<cr>
"surround word with template literal
nmap <leader>` ysaw{i$
"------------------------------


" general settings
set backspace=indent,eol,start
set ruler
set number
set showcmd
set showmatch
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
"remove OG vi compatibile mode
set nocp

" syntax enable
" Make it so that tsconfig isn't a nightmare with errors
autocmd Bufread,BufNewFile tsconfig.json set filetype=jsonc



"set termguicolors
" let g:gruvbox_italic=1
let g:tokyonight_enable_italic = 0
let g:tokyonight_style = 'storm'
colorscheme tokyonight
set background= " dark mode

"Airline config
set laststatus=2
let g:airline_detect_paste=1
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1 

" Airline Theme
let g:airline_theme="violet"
" Auto  save on change
"
"Correct highlighting for JSON
autocmd FileType json syntax match Comment +\/\/.\+$+

"Coc Tab Completion

"BG toggler
" make bg dark if light, light if dark
function! ToggleBG()
	if &background =~ "dark"
		" set background=light
let tokyonight_style = 'storm'
        " set background=storm 
	else
		" set background=dark
let tokyonight_style = 'dark'
        " set background=dark
	endif
endfunction

"bind bg toggle to leader b
nnoremap <silent><leader>b : call ToggleBG()<cr>

"NERDtree toggler
nnoremap <Leader>q :NERDTreeToggle<CR>

"No auto comment on new line
au FileType * setlocal formatoptions-=cro
"Autocomplete in HTML files
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags



" trigger docs in coc
nnoremap <silent> K :call <SID>show_documenation()<CR>
function! s:show_documenation()
	if (index(['vim','help'], &filetype) >=0)
		execute 'h '.expand('<cword')
	elseif (coc#rpc#ready())
		call CocActionAsync('doHover')
	else
		execute '!' . &keywordprg . " " . expand('<cword>')
	endif
endfunction

" symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" make Y behave like D,C
nnoremap Y y$
" keep search result centered
nnoremap n nzzzv
nnoremap N Nzzzv

" undo break points
inoremap , ,<c-g>u
inoremap ! !<c-g>u
inoremap . .<c-g>u
inoremap ? ?<c-g>u

"checklist add check to end of line
nnoremap <silent> ,c A✅jk
"Visual line moving
nnoremap <silent> ,i :!echo % >> .gitignore <cr>
vnoremap J :m '>+1<cr>gv=gv
vnoremap K :m '<-2<cr>gv=gv
"toggle paste
nnoremap <silent> ,v :set paste! <cr>
"open fugitive
nnoremap <silent> ,git :0Git<cr>



" Select buffers with alt+ alt _
nnoremap <silent> = :bn<cr>
nnoremap <silent> - :bp<cr>

" tmux navigator 
let g:tmux_navigator_no_mappings = 1

nnoremap <silent>  h :TmuxNavigateLeft<cr>
nnoremap <silent> j :TmuxNavigateDown<cr>
nnoremap <silent> k :TmuxNavigateUp<cr>
nnoremap <silent> l :TmuxNavigateRight<cr>
nnoremap <silent> \ :TmuxNavigatePrevious<cr>

" coc setup
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
	  let col = col('.') - 1
	    return !col || getline('.')[col - 1]  =~# '\s'
	endfunction

	"Enter to select coc completion
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Prettier command
command! -nargs=0 Prettier :CocCommand prettier.forceFormatDocument
"prettier selection
vnoremap <leader>p  <Plug>(coc-format-selected)
nnoremap <silent> <leader>p  :Prettier <cr>
" GoTo code navigation.
nnoremap <silent> gd <Plug>(coc-definition)
nnoremap <silent> gy <Plug>(coc-type-definition)
nnoremap <silent> gi <Plug>(coc-implementation)
nnoremap <silent> gr <Plug>(coc-references)


"close all buffers except current buffer
command! Bco execute '%bd|e #|bd#'
nnoremap <silent> ,bco :Bco<cr>

"files for FZF
nnoremap <silent> <c-b> :Buffers<cr>
nnoremap <silent> <c-p> :Files<cr>
nnoremap <silent> <c-l> :Lines<cr>
nnoremap <silent> <c-a> :Rg<cr>

"
" WSL yank support
let s:clip = '/mnt/c/Windows/System32/clip.exe'  
if executable(s:clip)
    augroup WSLYank
        autocmd!
        autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
    augroup END
endif

" EDITED 5/30/22
