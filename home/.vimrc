" This must be first, because it changes other options as a side effect.
set nocompatible

filetype off " required for Vundle

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle. Required!
Bundle 'gmarik/Vundle.vim'

" Plugins/Packages
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'thoughtbot/vim-rspec'
" Bundle 'tpope/vim-commentary'

" Syntax highlighting
Plugin 'kchmck/vim-coffee-script'
Plugin 'slim-template/vim-slim'
Plugin 'tpope/vim-rails'
Plugin 'pangloss/vim-javascript'
Plugin 'elixir-lang/vim-elixir'
Plugin 'scrooloose/syntastic'

" Clojure Syntax highlighting, repl, etc
Plugin 'tpope/vim-fireplace'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'tpope/vim-leiningen'
Plugin 'guns/vim-clojure-static'
Plugin 'guns/vim-clojure-highlight'

call vundle#end() " required by Vundle
filetype plugin indent on " required by Vundle

" Make backspace behave in a sane manner.
set backspace=indent,eol,start

" Set tabs to 2 spaces
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set ruler
"handle .un~ and .swp~ files
set backupdir=/private/tmp
set directory=/private/tmp
set undodir=/private/tmp

" Highlight search results
set hlsearch

" show matching bracket
 set showmatch

" Switch syntax highlighting on.
syntax on

" Enable file type detection and do language-dependent indenting.
filetype plugin indent on

" Map all the things
let mapleader = ','

imap jj <Esc>
imap kj <Esc>
imap jk <Esc>
map <Space> :

" map vim-rspec shortcuts
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

" Grab lines/blocks of lines and move them
noremap <C-j> :m .+1<CR>==
noremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" NerdTreeToggle
nnoremap <leader>n :NERDTreeToggle<CR>

" Open vimrc in buffer to edit
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>

" Line numbers
set number

" kill all the whitespace
function! TrimWhiteSpace()
  %s/\s\+$//e
endfunction

function! Save()
  :call TrimWhiteSpace()
  :retab
endfunction

" Strip trailing whitespace when saving
autocmd BufWritePre * call Save()

":W when I meant :w
cnoreabbrev <expr> W getcmdtype()==':'&&getcmdline()=~#'^W'?'w':'W'
