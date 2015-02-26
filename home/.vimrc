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
Plugin 'kchmck/vim-coffee-script'
Plugin 'slim-template/vim-slim'

call vundle#end() " required by Vundle
filetype plugin indent on " required by Vundle

" Make backspace behave in a sane manner.
set backspace=indent,eol,start

" Switch syntax highlighting on.
syntax on

" Enable file type detection and do language-dependent indenting.
filetype plugin indent on


" Map some stuff

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

function! TrimWhiteSpace()
  %s/\s\+$//e
endfunction

function! Save()
  :call TrimWhiteSpace()
  :retab
endfunction

" Strip trailing whitespace when saving
autocmd BufWritePre * call Save()

 " vim-fireplace. vim-clojure-static. rainbow_parentheses.vim, paredit.vim add these for clojure
