let mapleader=','
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
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-unimpaired'
Plugin 'pangloss/vim-javascript'
Bundle 'jelera/vim-javascript-syntax'
Bundle 'morhetz/gruvbox'
Bundle 'altercation/vim-colors-solarized'
Plugin 'mileszs/ack.vim'
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'kchmck/vim-coffee-script'
Plugin 'tpope/vim-rails'
Plugin 'majutsushi/tagbar'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tomasr/molokai'
Plugin 'godlygeek/tabular'
Plugin 'moll/vim-node'
if (!system('command -v cmake'))
  Plugin 'Valloric/YouCompleteMe'
endif

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
set complete-=i

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
set wildmenu

set noswapfile

set regexpengine=1
syntax enable


"""" COLOR SCHEME """"
silent! colorscheme molokai "solarized "gruvbox
set background=dark
set t_Co=256

highlight DiffAdd    cterm=none ctermfg=fg ctermbg=Green gui=none guifg=fg guibg=Green
highlight DiffDelete cterm=none ctermfg=fg ctermbg=Red   gui=none guifg=fg guibg=Red
highlight DiffChange cterm=none ctermfg=fg ctermbg=Blue  gui=none guifg=fg guibg=Blue
highlight DiffText   cterm=none ctermfg=bg ctermbg=Blue  gui=none guifg=bg guibg=Blue


"""" Tabularize """"
if exists(":Tabularize")
  nmap <Leader>a= :Tabularize /=<CR>
  vmap <Leader>a= :Tabularize /=<CR>
  nmap <Leader>a> :Tabularize /=><CR>
  vmap <Leader>a> :Tabularize /=><CR>
  nmap <Leader>a: :Tabularize /:\zs<CR>
  vmap <Leader>a: :Tabularize /:\zs<CR>
endif


"""" STATUS LINE & AIRLINE """"
"set cmdheight=1
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
"let g:airline_powerline_fonts=1

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"""" NERDtree """"
map <C-n> :NERDTreeToggle<CR>


"""" indent guides """"
let g:indent_guides_auto_colors = 1
let g:indent_guides_start_level = 2
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4


" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif


"""" ctrlp """"
let g:ctrlp_max_files=0


"""" tagbar """"
nmap <F8> :TagbarToggle<CR>


"""" syntastic """"
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


"""" KEY MAPPING """"
set showtabline=2               " File tabs allways visible
nmap <C-t> :tabnew<cr>
map  <C-t> :tabnew<cr>
imap <C-t> <ESC>:tabnew<cr>
map  <S-t> :tabclose<cr>
imap <kplus>  :tabnext<cr>
map  <kplus>  :tabnext<cr>
nmap <kplus>  :tabnext<cr>
imap <kminus> :tabprevious<cr>
map  <kminus> :tabprevious<cr>
nmap <kminus> :tabprevious<cr>
map <Leader>h :noh<cr>
map <Leader>k :set expandtab!<cr>
map <Leader>l :set list!<cr>
vmap <C-b> :!column -t <cr>gv:s/\(\S\)  /\1 /g<cr>:noh<cr>

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

" Include external configs
:so ~/.vimrc_local.vim
