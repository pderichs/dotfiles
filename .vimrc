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

"{{{plugin list
Plugin 'tpope/vim-fugitive.git'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'bling/vim-airline'
Plugin 'rking/ag.vim'
Plugin 'fatih/vim-go'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fireplace'
Plugin 'easymotion/vim-easymotion'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'scrooloose/nerdcommenter'
"}}}

" All of your Plugins must be added before the following line
call vundle#end()

" load file type plugins + indentation
filetype plugin indent on
"}}}

"{{{general
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
set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif

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

" Indentation
set autoindent
set smartindent

" Syntax highlighting
set t_Co=256
syntax on

" Line numbers
set number

" Highlight matching braces
set showmatch

" Use intelligent file completion like in the bash
set wildmode=longest:full
set wildmenu

set laststatus=2

" Turn off menubar and toolbar in gui mode
if has('gui_running')
  set guioptions -=m
  set guioptions -=T
endif

"{{{automatically remove trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e
"}}}

"}}}

"{{{theme
if has('gui_running')
  " colorscheme wombat
  colorscheme badwolf
  if has('gui_macvim')
    set guifont=Inconsolata\ for\ Powerline:h18
    macmenu &File.New\ Tab key=<nop>
    map <D-t> :CommandT<cr>
  else
    set guifont=Droid_Sans_Mono_Dotted_for_Powe:h10:cANSI
  endif
else
  " colorscheme wombat256
  colorscheme badwolf
endif
"}}}

"{{{plugin config airline
" airline font config
let g:airline_powerline_fonts = 1
"}}}

"{{{keyboard mappings

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

" insert line without entering edit mode
nmap <CR> o<Esc>

"{{{leader keys
let mapleader = " "
nnoremap <leader>w :w<cr>
nnoremap <leader>t :NERDTreeToggle<cr>
nnoremap <leader>a :Ag!<space>
nnoremap <leader>ev :vsplit ~/.vimrc<cr>
nnoremap <leader>so :source %<cr>
nnoremap <leader>o :e<space>

"{{{accessing system clipboard
vnoremap <leader>c "+y
nnoremap <leader>p "+p
"}}}

" Enable toggle for relative numbers
nnoremap <silent><leader>n :set relativenumber!<cr>

nnoremap <leader>X :q!<cr>

nnoremap <leader>x :wq<cr>

nnoremap <leader>r :CtrlPTag<cr>

"{{{easy-motion
" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>s <Plug>(easymotion-bd-w)
nmap <Leader>S <Plug>(easymotion-overwin-w)

"}}}

"}}}
