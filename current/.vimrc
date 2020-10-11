set relativenumber
set nocompatible
" remap escape
inoremap jk <ESC>
" remap leader
let mapleader = ","
"load plug if not present
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
"load plugins
call plug#begin('~/.vim/plugged')
"Load Plugins Here
Plug 'iamcco/markdown-preview.nvim', {'do': {->mkdp#util#install()}}
Plug 'tpope/vim-surround'
Plug 'micha/vim-colors-solarized'
Plug 'morhetz/gruvbox' 
"Plug 'mattn/emmet-vim' I removed this, since coc-emmet issue seems to be fixed
Plug 'neoclide/coc.nvim',{'branch':'release'}
Plug 'maxmellon/vim-jsx-pretty'
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline-themes'
Plug 'jiangmiao/auto-pairs'
Plug 'prettier/vim-prettier',{'do':'npm install'}
call plug#end()
"Setup Coc Extensions
let g:coc_global_extensions = [
			\'coc-snippets',
			\'coc-emmet',
			\'coc-tsserver',
			\'coc-html',
			\'coc-json',
			\]
"remove OG vi compatibile mode
set nocp
"Move up by row, not by file line
nnoremap j gj
nnoremap k gk
"Map Emmet key comma
"let g:user_emmet_leader_key='<leader>' "commented out w/coc
"Turn off the bell!
 set novisualbell
" general settings
set backspace=indent,eol,start
set ruler
set number
set showcmd
set incsearch
set hlsearch
set linebreak
set wrapmargin=8
"NERDtree toggler
nnoremap <Leader>q :NERDTreeToggle<CR>
"BG toggler
function Transparify()
	:set background=dark 
	:hi Normal guibg=NONE ctermbg=NONE 
endfunction

nnoremap <Leader>b :set background=dark <CR>
nnoremap <Leader>l :set background=light <CR>
nnoremap <Leader>t :exec Transparify() <CR>
"Color SchemeZone
" Gruvbox (from morhetz)
autocmd vimenter * colorscheme gruvbox 
autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE
"set termguicolors
let g:gruvbox_italic=1
set background=dark " dark mode
"Airline config
set laststatus=2

let g:airline_detect_paste=1

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1 
" Airline Theme
let g:airline_theme="solarized"
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
