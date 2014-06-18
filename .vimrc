set number          
set linebreak       
set showbreak=+++   
set textwidth=100   
set showmatch
set visualbell

set hlsearch
set smartcase
set incsearch

set autoindent
set expandtab
set shiftwidth=2    
set smartindent 
set smarttab    
set softtabstop=4   

set ruler

set undolevels=1000 
set backspace=indent,eol,start

set cursorline

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
