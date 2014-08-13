"PATHOGEN
execute pathogen#infect()

"=bundle ctrlpvim/ctrlp.vim
"=bundle scrooloose/syntastic
"=bundle scrooloose/nerdtree
"=bundle godlygeek/tabular
"=bundle terryma/vim-multiple-cursors
"=bundle tpope/vim-rails
"=bundle t9md/vim-ruby-xmpfilter
"=bundle airblade/vim-gitgutter

"Want a different map leader than \
let mapleader = ","

set t_Co=256
colorscheme smyck
set background=dark

" Control-P
set runtimepath^=~/.vim/bundle/ctrlp.vim
"let g:ctrlp_map = '<c-q>'
"jlet g:ctrlp_cmd = 'CtrlQ'

"set clipboard=unnamed

set backspace=indent,eol,start

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<

"For ERB  & HTML Formatting
autocmd BufRead,BufNewFile *.erb  set filetype=html autoread
autocmd BufRead,BufNewFile *.html set filetype=html autoread

" Trailing Whitespace
match ErrorMsg '\s\+$'

" KILL ALL WHITESPACE!
nnoremap <leader>rtw :%s/\s\+$//e<CR>

syntax on

set laststatus=2 " Always display the statusline in all windows
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)

"no swap
set noswapfile

" Toggle paste
" For some reason pastetoggle doesn't redraw the screen (thus the status bar
" doesn't change) while :set paste! does, so I use that instead.
" set pastetoggle=<F6>
nnoremap <F6> :set paste!<cr>
nnoremap <F7> :noh<cr>

" Toggle [i]nvisible characters
nnoremap <leader>i :set list!<cr>

" Don't try to highlight lines longer than 800 characters.
set synmaxcol=800

" Resize splits when the window is resized
au VimResized * :wincmd =

"jj escape
:imap jj <Esc>

" POWERLINE
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup
let g:Powerline_symbols = 'fancy'

" always show the status
set laststatus=2
set fillchars+=stl:\ ,stlnc:\
"set rtp+=/Users/watts/Library/Python/2.7/lib/python/site-packages/powerline/bindings/vim
set rtp+=/usr/local/lib/python2.7/site-packages/powerline/bindings.vim

" Enable filetypes
filetype on
filetype plugin on
filetype indent on
syntax on

"Write the old file out when switching between files.
set autowrite

"Display current cursor position in the lower right corner
set ruler

"Color line!
set colorcolumn=80

"We have a fast terminal
set ttyfast

" make vim redraw screen instead of scrolling when there are more than 3 lines to be scrolled
set ttyscroll=999

set so=999

"Backup stuff
set nobackup
set nowritebackup

"Lazy ReDraw!
set lazyredraw

"Tab stuff
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

"Show command in bottom right portion of the screen
set showcmd

"Show line numbers
set number

"Show cursor line
:set cursorline

"Indent stuff
set smartindent
set autoindent

"Always show last status line
set laststatus=2

"Better line wrapper
set wrap
set textwidth=80
set formatoptions=qrn1

"Set incremental searching
set incsearch

"Highlight searching
set hlsearch

"case insensitive search
set ignorecase
set smartcase

" Insert a hash rocket with <c-l>
imap <c-l> =><space>

"Opens a vertical split and switches over (\v)
nnoremap <leader>v <C-w>v<C-w>

"Map escape key to jj -- much faster
imap jj <esc>

" easier window navigation
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

"GitGutter
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0

" Added SignColumn used by Vim-gutter to match default BG colour
" Background color is the same as the one defined by the “:hi Normal” line
hi SignColumn ctermbg=145 guibg=#252c31 gui=NONE

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MULTIPURPOSE TAB KEY
" Indent if we're at the beginning of a line. Else, do completion.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! InsertTabWrapper()
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k'
    return "\<tab>"
  else
    return "\<c-p>"
  endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-n>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERD TREE TOGGLE
" press F4 to lint!
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <C-k><C-b> :NERDTreeToggle<CR>
" hidden files
let NERDTreeShowHidden=1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Inline Evaluation of Ruby
" leader + e
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType ruby nmap <buffer> <leader>e <Plug>(xmpfilter-mark) <Plug>(xmpfilter-run)
autocmd FileType ruby xmap <buffer> <leader>e <Plug>(xmpfilter-mark) <Plug>(xmpfilter-run)
autocmd FileType ruby imap <buffer> <leader>e <Plug>(xmpfilter-mark) <Plug>(xmpfilter-run)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Thor syntax highlighting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au BufRead,BufNewFile *.thor set filetype=thor

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CtrlP Configuration
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_user_command = 'find %s -type f'
let g:ctrlp_use_caching = 0

" Can't be bothered to understand ESC vs <c-c> in insert mode
imap <c-c> <esc>
nnoremap <leader><leader> <c-^>
