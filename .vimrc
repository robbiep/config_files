set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'bling/vim-airline'
Plugin 'airblade/vim-gitgutter'
Plugin 'kien/ctrlp.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

set number
set linebreak
set showmatch
set visualbell

set hlsearch
set ignorecase
set smartcase
set incsearch

set autoindent
set expandtab
set shiftwidth=2
set smartindent
set smarttab
set softtabstop=22
set ts=2


"""" COLOR SCHEME """"
"let g:molokai_original = 1
colorscheme Tomorrow-Night-Bright
set t_Co=256

"""" STATUS LINE & AIRLINE """"
"set cmdheight=1
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
" now set it up to change the status line based on mode
hi StatusLine term=reverse ctermfg=4 ctermbg=0 gui=bold,reverse
if version >= 700
  au InsertEnter * hi StatusLine term=reverse ctermfg=2 ctermbg=0 gui=undercurl guisp=Magenta
  au InsertLeave * hi StatusLine term=reverse ctermfg=4 ctermbg=0 gui=bold,reverse
endif
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ (\%c,\%l)
set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P


" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction

set backspace=eol,start,indent
set whichwrap+=<,>,h,l

set magic

set noerrorbells
set novisualbell
set t_vb=
set tm=500

set ruler

set undolevels=1000
set backspace=indent,eol,start

set cursorline

syntax enable

" colorscheme desert
" set background=dark
"highlight LineNr ctermfg=grey ctermbg=black

map 0 ^
" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

if has("mac") || has("macunix")
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif

" Highlight trailing whitespace
match Todo /\s\+$/

if has("gui_running")
    set guioptions-=T
    set guioptions+=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

" Syntax highlighitng for unknown extensions
au BufNewFile,BufRead *.pm setf perl
au BufNewFile,BufRead *.mhtml setf perl
au BufNewFile,BufRead *.mh setf perl

