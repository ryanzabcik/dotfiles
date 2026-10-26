set nocompatible

" Pathogen
call pathogen#infect()
call pathogen#helptags()
set runtimepath-=~/.vim/bundle/supertab

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
set tabstop=4      " Visual width of a literal tab character
set shiftwidth=4   " Width of auto-indents and block shifts (>> and <<)
set softtabstop=4  " Number of spaces inserted/removed when hitting Tab/Backspace
set expandtab      " Convert all typed tabs into spaces
set linebreak
set tags=tags;/
set backspace=indent,eol,start
" turn off auto adding comments on next line
set fo=tcq

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
set guifont=FantasqueSansM_Nerd_Font_Mono:h14
set guioptions-=T
set listchars=trail:~,tab:→\ ,eol:¬

let mapleader=" "

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll|o)$',
  \ }

let g:vim_markdown_folding_disabled = 1

""""""""""
" Mappings

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

nnoremap <C-T> <C-]>
nmap <C-]> :w<CR>
imap <C-]> <Esc>

command Sudow :w !sudo tee % >/dev/null
cabbrev qq q!

nnoremap gp `[v`]

nnoremap <Leader>{ :call search('^'. matchstr(getline('.'), '\(^\s*\)') .'\%<' . line('.') . 'l\S', 'be')<CR>
nnoremap <Leader>} :call search('^'. matchstr(getline('.'), '\(^\s*\)') .'\%>' . line('.') . 'l\S', 'e')<CR>

map zx :wq<CR>
map zq :q<CR>

map <Right> gt
map <Left> gT
map <Up> :bprev<CR>
map <Down> :bnext<CR>

vmap <Leader>= :'<,'>Tabularize /=<CR>
vmap <Leader>: :'<,'>Tabularize /:\zs<CR>
vnoremap <Leader>w :'<,'>w !wc -w<CR>
nnoremap <Leader>w :%w !wc -w<CR>
