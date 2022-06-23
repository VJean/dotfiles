" Set to auto read when file is changed from the outside
set autoread

" Show line numbers
set number

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

" netrw (directory browser) settings
" split to the right
let g:netrw_altv=1
" split below
let g:netrw_alto=0
" remove banner
let g:netrw_banner=0
" open file by splitting vertically
let g:netrw_browse_split=2
" list files as tree
let g:netrw_liststyle=3
