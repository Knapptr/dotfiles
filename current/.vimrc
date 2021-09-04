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
Plug 'gruvbox-community/gruvbox' 
Plug 'junegunn/fzf',{'do':{ -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'neoclide/coc.nvim',{'branch':'release'}
Plug 'prettier/vim-prettier',{'do':'npm install'}
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
call plug#end()

"Setup Coc Extensions
let g:coc_global_extensions = [
			\ 'coc-snippets',
			\ 'coc-emmet',
			\ 'coc-tsserver',
			\ 'coc-html',
			\ 'coc-json',
			\ 'coc-pairs',
			\]


" PRETTIER settings
" auto format on save
let g:prettier#autoformat = 1
" prettier won't require //@format to be at top of document
let g:prettier#autoformat_require_pragma = 0

"KEYS--------------------------
"Move up by row, not by file line
nnoremap j gj
nnoremap k gk
set novisualbell
" remap escape
inoremap jk <ESC>
" remap leader
let mapleader = ","
"vimrc edit
nmap ,rc :e~/.vimrc<cr>
"source vimrc
nmap ,rr :source ~/.vimrc<cr>
"Chage buffers with leader h,l
nmap ,l :bn<cr>
nmap ,h :bp<cr>
"------------------------------

" general settings
set backspace=indent,eol,start
set ruler
set number
set showcmd
set showmatch
set incsearch
set hlsearch
set linebreak
set wrapmargin=8
set relativenumber
set nocompatible
set tabstop=4
set softtabstop=4
set shiftwidth=4
set hidden
set noswapfile
set scrolloff=8
set signcolumn=yes
" mouse
set mouse=a
"remove OG vi compatibile mode
set nocp

syntax enable
"BG toggler
" make bg dark if light, light if dark
function! ToggleBG()
	if &background =~ "dark"
		set background=light
	else
		set background=dark
	endif
endfunction

"bind bg toggle to leader b
nnoremap <silent><leader>b : call ToggleBG()<cr>



colorscheme gruvbox
"set termguicolors
let g:gruvbox_italic=1
set background=dark " dark mode

"Airline config
set laststatus=2
let g:airline_detect_paste=1
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1 

" Airline Theme
let g:airline_theme="gruvbox"
" Auto  save on change
"
"Correct highlighting for JSON
autocmd FileType json syntax match Comment +\/\/.\+$+

"Coc Tab Completion
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


"NERDtree toggler
nnoremap <Leader>q :NERDTreeToggle<CR>
"FZF Gitfiles
nmap <c-p> :Files <cr>
nmap <C-Bslash> :GitFiles<cr>:

"No auto comment on new line
au FileType * setlocal formatoptions-=cro
"Autocomplete in HTML files
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

"markdown preview grip
let vim_markdown_preview_github=1

" trigger docs in coc
nnoremap <silent> K :call <SID>show_documenation()<CR>
function! s:show_documenation()
	if (index(['vim','help'], &filetype) >=0)
		execute 'h '.expand('<cword')
	else
		call CocAction('doHover')
	endif
endfunction

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


"Visual line moving
vnoremap J :m '>+1<cr>gv=gv
vnoremap K :m '<-2<cr>gv=gv


