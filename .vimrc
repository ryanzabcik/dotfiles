set nocompatible

" Pathogen
call pathogen#infect()
call pathogen#helptags()
 
"set statusline=%<\ %n:%f\ %m%r%y%=%-35.(line:\ %l\ of\ %L,\ col:\ %c%V\ (%P)%)
filetype plugin indent on
 
set mouse=a
set mousehide

set hlsearch
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

if filewritable("/var/vim")
	set directory=/var/vim
else
	let choice = confirm("/var/vim does not exist; use which directory?", "&.\n&/tmp", 1) 
    if choice == 1
        set directory=.
    elseif choice == 2
        set directory=/tmp
    endif
endif

set timeoutlen=200 " make vim quicker to recognize ESC

set background=dark
colorscheme wombat
set guifont=Droid\ Sans\ Mono\ Slashed:h14
set guioptions-=T
set listchars=trail:~,tab:→\ ,eol:¬

let mapleader=","

"map ; :
"noremap ;; ;
map ;q :q
map ;qq :q!
map ;wq :wq

map <Leader>y "+y
map <Leader>p "+p
map <Leader>P "+P

nmap <C-]> :w<CR>
imap <C-]> <Esc>

command Sudow :w !sudo tee % >/dev/null
cabbrev qq q!
