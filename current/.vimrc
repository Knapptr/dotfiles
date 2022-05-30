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
Plug 'maxmellon/vim-jsx-pretty'
Plug 'neoclide/coc.nvim',{'branch':'release'}
Plug 'junegunn/fzf',{'do':{-> fzf#install()}}
Plug 'neoclide/jsonc.vim'
Plug 'prettier/vim-prettier',{'do':'npm install'}
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'christoomey/vim-tmux-navigator'
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
			\
			\]


" PRETTIER settings
" auto format on save
let g:prettier#autoformat = 1
" prettier won't require //@format to be at top of document
let g:prettier#autoformat_require_pragma = 0

"KEYS--------------------------
"Move up by row, not by file line
" nnoremap j gj
" nnoremap k gk
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
set wrapmargin=0
set textwidth=0
set wrap
set relativenumber
set nocompatible
set tabstop=4
set softtabstop=4
set shiftwidth=4
set hidden
set noswapfile
set scrolloff=8
set signcolumn=yes
set novisualbell
set breakindent
" mouse
set mouse=a
"remove OG vi compatibile mode
set nocp

" syntax enable
" Make it so that tsconfig isn't a nightmare with errors
autocmd Bufread,BufNewFile tsconfig.json set filetype=jsonc



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

"NERDtree toggler
nnoremap <Leader>q :NERDTreeToggle<CR>

"No auto comment on new line
au FileType * setlocal formatoptions-=cro
"Autocomplete in HTML files
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags


"markdown preview grip
let vim_markdown_preview_github=1

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
nmap <silent> ,c A✅jk
"Visual line moving
nmap <silent> ,i :!echo % >> .gitignore <cr>
vnoremap J :m '>+1<cr>gv=gv
vnoremap K :m '<-2<cr>gv=gv
"toggle paste
map <silent> ,v :set paste! <cr>
"open fugitive
nmap <silent> ,git :0Git<cr>



" Select buffers with alt+ alt _
nmap <silent> = :bn<cr>
nmap <silent> - :bp<cr>

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

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)


"close all buffers except current buffer
command! Bco execute '%bd|e #|bd#'
nmap <silent> ,bco :Bco<cr>

"files for FZF
command! -bang -nargs=* FILES
			\ call fzf#run(fzf#wrap({'source':'rg --files --hidden  --no-ignore-vcs --glob  "!{node_modules/*,.git/*}"'}))

nnoremap <silent> <c-p> :FILES<cr>
nnoremap <silent> <c-b> :Buffers<cr>


" EDITED 5/26/22
