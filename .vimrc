set number          
set linebreak       
set showbreak=+++   
set textwidth=100   
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
set cmdheight=1
set laststatus=2
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l
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

colorscheme desert
set background=dark
highlight LineNr ctermfg=grey ctermbg=black

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

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()

if has("gui_running")
    set guioptions-=T
    set guioptions+=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

" Mapping of autocompletion
inoremap {      {}<Left>
inoremap {<CR>  {<CR>}<Esc>O
inoremap {{     {
inoremap {}     {}
inoremap        (  ()<Left>
inoremap <expr> )  strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"
inoremap /*          /**/<Left><Left>
inoremap /*<Space>   /*<Space><Space>*/<Left><Left><Left>
inoremap /*<CR>      /*<CR>*/<Esc>O
inoremap <Leader>/*  /*
