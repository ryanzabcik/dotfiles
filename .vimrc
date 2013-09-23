set nocompatible

" Pathogen
call pathogen#infect()
call pathogen#helptags()
 
set statusline=%<\ %n:%f\ %m%r%y%=%-35.(line:\ %l\ of\ %L,\ col:\ %c%V\ (%P)%)
filetype plugin indent on
 
set mouse=a
set mousehide

"set hlsearch
syntax on
set showmatch
set number
set incsearch
set autoindent
set history=1000
set cursorline
set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4

set hidden

set background=dark
colorscheme wombat

let mapleader=","

map ; :
noremap ;; ;

map Y "+y
map P "+p
nmap <C-]> :w<CR>
imap <C-]> <Esc>:w<CR>a
vmap <C-]> :w<CR>
