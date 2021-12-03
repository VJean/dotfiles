" Set to auto read when file is changed from the outside
set autoread

" Show cursor position
set ruler
" Always show the status line
set laststatus=2

" Highlight search results
set hlsearch

" Show matching brackets
set showmatch

" Enable syntax highlighting
syntax enable

set background=dark
set encoding=utf8

" Spaces instead of tabs
set expandtab
" Smart when using tabs
set smarttab
" Autoindent
set autoindent
" Smart indent
set smartindent

" 1 tab = 2 spaces
set shiftwidth=4
set tabstop=4
set softtabstop=4

" 1 tab = 4 spaces for Python
autocmd FileType python setlocal ts=4 sw=4 sts=4
" in makefiles, don't expand tabs to spaces
" tabs have to be 8 chars
autocmd FileType make set noexpandtab shiftwidth=8 softtabstop=0

set splitbelow
set splitright
