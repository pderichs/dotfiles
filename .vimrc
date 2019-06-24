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
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'bling/vim-airline'
Plugin 'rking/ag.vim'
Plugin 'fatih/vim-go'
Plugin 'tpope/vim-surround'
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
set relativenumber

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

" Ctrl+P settings
let g:ctrlp_max_files=0
let g:ctrlp_max_depth=40
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  " ag is fast enough - no caching needed
  let g:ctrlp_use_caching = 0
endif

"{{{searching
let g:ctrlp_use_caching = 0
if executable('ag')
      " We extract the column as well as the file and line number
    set grepprg=ag\ --nogroup\ --nocolor\ --column
    set grepformat=%f:%l:%c%m
endif
"}}}

"{{{automatically remove trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e
"}}}

"za}}}

"{{{theme
colorscheme 1989
"}}}

"{{{plugin config airline
" airline font config
let g:airline_powerline_fonts = 1
"}}}

"{{{plugin config rainbow parentheses

" always on
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

"}}}

"{{{keyboard mappings

nmap - :tabnext<cr>

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

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

"{{{leader keys
let mapleader = " "
nnoremap <leader>w :w<cr>
nnoremap <leader>t :NERDTreeToggle<cr>
nnoremap <leader>a :Ag!<space>
nnoremap <leader>ev :tabedit ~/.vimrc<cr>
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

" Bubbling lines
nmap <C-Up> ddkP
nmap <C-Down> ddp

"}}}

"}}}
