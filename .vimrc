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
set linebreak

if filewritable("/var/vim")
	set directory=/var/vim
elseif filewritable($HOME . "/.cache/vim")
    set directory=$HOME/.cache/vim
else
	let choice = confirm("Neither the /var/vim nor the ~/.cache/vim directories exist; use which directory?", "&.\n&/tmp\n&Create the ~/.cache/vim directory", 1) 
    if choice == 1
        set directory=.
    elseif choice == 2
        set directory=/tmp
    elseif choice == 3
        call mkdir($HOME . "/.cache/vim", "p")
        set directory=$HOME/.cache/vim
    endif
endif

set ttimeoutlen=200 " make vim quicker to recognize ESC

set background=dark
colorscheme wombat
if has("gui_macvim")
    set guifont=Droid\ Sans\ Mono\ Slashed:h14
else
    set guifont=Droid\ Sans\ Mono\ Slashed\ 14
endif
set guioptions-=T
set listchars=trail:~,tab:→\ ,eol:¬

let mapleader=" "

"map ; :
"noremap ;; ;
"map ;q :q
"map ;qq :q!
"map ;wq :wq

map <Leader>y "+y
map <Leader>p "+p
map <Leader>P "+P

map <Leader>t :TagbarToggle<CR>

nmap + :tabedit<CR>

nmap <C-]> :w<CR>
imap <C-]> <Esc>

command Sudow :w !sudo tee % >/dev/null
cabbrev qq q!

nnoremap gp `[v`]

nnoremap <Leader>{ :call search('^'. matchstr(getline('.'), '\(^\s*\)') .'\%<' . line('.') . 'l\S', 'be')<CR>
nnoremap <Leader>} :call search('^'. matchstr(getline('.'), '\(^\s*\)') .'\%>' . line('.') . 'l\S', 'e')<CR>

map zx :wq<CR>
map zq :q<CR>
