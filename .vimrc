" References:
" http://www.sitepoint.com/getting-started-vim/

"{{{vundle
set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.

Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-fugitive.git'
Plugin 'kchmck/vim-coffee-script'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'flazz/vim-colorschemes'
Plugin 'thoughtbot/vim-rspec'
Plugin 'bling/vim-airline'
Plugin 'rking/ag.vim'
Plugin 'fatih/vim-go'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-surround'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets' " for ultisnips
Plugin 'mattn/emmet-vim'

" All of your Plugins must be added before the following line
call vundle#end()
"}}}





" for fish shell
set shell=/bin/bash

set foldmethod=marker
set noswapfile

" UTF-8 encoding
set encoding=utf-8
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8

" highlight current line
set cursorline

" default history is 20
set history=1000

" Display incomplete commands
set showcmd

set showmode

" Turn off bell
set noerrorbells 
set novisualbell
set t_vb=

" load file type plugins + indentation
filetype plugin indent on

" Tabwidth and insert spaces instead of tabs
set nowrap
set tabstop=2 shiftwidth=2
set expandtab
set backspace=indent,eol,start

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" Disable vi compatibility (emulation of old bugs)
set nocompatible

" Indentation
set autoindent
set smartindent

" Tab width=2 and spaces instead of tabs
set tabstop=2
set shiftwidth=2
set expandtab

" Wrap lines at 80
set textwidth=80

" Syntax highlighting
set t_Co=256
syntax on

" Theme
if has('gui_running')
  " colorscheme wombat
  colorscheme badwolf
  if has('gui_macvim')
    set guifont=Inconsolata\ for\ Powerline:h18
    macmenu &File.New\ Tab key=<nop>
    map <D-t> :CommandT<cr>
  else
    set guifont=Ubuntu\ Mono\ 14
  endif
else
  " colorscheme wombat256
  colorscheme badwolf
endif

" airline font config
let g:airline_powerline_fonts = 1

" Line numbers 
set number

" Highlight matching braces
set showmatch

" Use intelligent file completion like in the bash
set wildmode=longest:full
set wildmenu

" vim-git plugin
set laststatus=2

" keyboard mappings
"

" Ultisnips
" Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsUsePythonVersion = 2
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" switch between header/source with F4 C
map <F4> :e %:p:s,.h$,.X123X,:s,.c$,.h,:s,.X123X$,.c,<cr>

" recreate tags file with F5
map <F5> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<cr>

" make 
imap <F7> <ESC>:w<cr>:make<cr>

" make all
map <S-F7> :make clean all<cr>

" macro recording
nmap <S-F8> qq
nmap <F8> @q

" goto definition with F12
map <F12> <C-]>

" Leader keystrokes
let mapleader = " "
map <leader>w :w<cr>
map <leader>t :NERDTreeToggle<cr>
map <leader>a :Ag!<space>
map <leader>p :CtrlP<cr>
map <leader>s :call RunCurrentSpecFile()<cr>
map <leader>S :call RunAllSpecs()<cr>
map <leader>r :!bundle exec rake<cr>
map <leader>ev :vsplit ~/.vimrc<cr>
map <leader>so :source %<cr>
map <leader>o :e<space>

" Enable toggle for relative numbers
nnoremap <silent><leader>n :set relativenumber!<cr>

