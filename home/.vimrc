" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

filetype off " required for Vundle

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle. Required!
Bundle 'gmarik/Vundle.vim'

" Plugins/Packages
Plugin 'scrooloose/nerdtree'

" Syntax highlighting
Plugin 'kchmck/vim-coffee-script'
Plugin 'slim-template/vim-slim'
Plugin 'tpope/vim-rails'
Plugin 'pangloss/vim-javascript'
Plugin 'kien/ctrlp.vim'

" Clojure Syntax highlighting, repl, etc
Plugin 'tpope/vim-fireplace'
Plugin 'kien/rainbow_parentheses.vim'

call vundle#end() " required by Vundle
filetype plugin indent on " required by Vundle

" Make backspace behave in a sane manner.
set backspace=indent,eol,start

" Set tabs to 2 spaces
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

"handle .un~ and .swp~ files
set backupdir=/private/tmp
set directory=/private/tmp
set undodir=/private/tmp

" Highlight search results
set hlsearch

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

" git config --global core.editor /usr/bin/vim when git isn't behaving
