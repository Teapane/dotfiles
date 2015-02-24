" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

filetype off " required for Vundle

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle. Required!
Bundle 'gmarik/Vundle.vim'

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

" Line numbers
set number

if has("autocmd")
  "Strip trailing whitespace when saving"
  autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()
endif
