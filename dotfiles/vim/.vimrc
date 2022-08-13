syntax enable
filetype plugin indent on

" ###################################################
" Line numbers
set number relativenumber

" ###################################################
" Indentation
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent

" ###################################################
" Number of lines offset when jumping
set scrolloff=5

" ###################################################
" Custom shortcuts
let mapleader=" "

" Select all
nnoremap <leader>a ggVG

" Create 2 blank lines below cursor and move to the first
nnoremap <leader>o o<CR><Esc>ki

" Create 2 blank lines above cursor and move to the first 
nnoremap <leader>O O<CR><Esc>ki

noremap <leader>y "*y
noremap <leader>p "*p
noremap <leader>Y "+y
noremap <leader>P "+p

nnoremap <leader>s ^v$
