set nocompatible

" Pathogen
call pathogen#infect()
call pathogen#helptags()

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
set tags=tags;/
set backspace=indent,eol,start

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
if has("gui")
    if has("gui_macvim")
        set guifont=Fantasque\ Sans\ Mono:h14
    else
        set guifont=Fantasque\ Sans\ Mono\ 14
    endif
endif
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
