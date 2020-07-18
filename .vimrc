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

Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'bling/vim-airline'
Plugin 'fatih/vim-go'
Plugin 'tpope/vim-surround'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'MattesGroeger/vim-bookmarks'
Plugin 'junegunn/fzf.vim'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-commentary'
Plugin 'luochen1990/rainbow'
Plugin 'posva/vim-vue'

" All of your Plugins must be added before the following line
call vundle#end()

" load file type plugins + indentation
filetype plugin indent on

" set foldmethod=marker
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
" set relativenumber

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
let g:ctrlp_map = '<c-0>'
let g:ctrlp_max_files=0
let g:ctrlp_max_depth=40
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
if executable('rg')
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
  let g:ctrlp_use_caching = 0
endif

" Open quickfix window after any grep invocation
autocmd QuickFixCmdPost *grep* cwindow

if executable('rg')
    set grepprg=rg\ --vimgrep\ --no-heading
    set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

autocmd BufWritePre * :%s/\s\+$//e

set tags=.tags

colorscheme wombat256i

" airline font config
let g:airline_powerline_fonts = 1

" Rainbow parentheses always on
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" Keyboard

nmap - :tabnext<cr>

" switch between header/source with F4 C
map <F4> :e %:p:s,.h$,.X123X,:s,.c$,.h,:s,.X123X$,.c,<cr>

" recreate tags file with F5
map <F5> :!ctags -R --languages=ruby --exclude=.git --exclude=log -f .tags . $(bundle list --paths)<cr>

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

nnoremap <C-p> :Files<CR>

let mapleader = " "
nnoremap <leader>w :w<cr>
nnoremap <leader>t :NERDTreeToggle<cr>
nnoremap <leader>r :NERDTreeFind<cr>
nnoremap <leader>a :Ag!<space>
nnoremap <leader>ev :tabedit ~/.vimrc<cr>
nnoremap <leader>so :source %<cr>
nnoremap <leader>o :e<space>
nnoremap <leader>f :Rg<space>
nnoremap <leader>b :Gblame<cr>
nnoremap <leader>g :set paste<CR>m`Obinding.pry<Esc>``:set nopaste<CR>
nnoremap <leader>qq :q<CR>
nnoremap <leader>pf :Files<CR>
nnoremap <leader>/ :Ag<CR>
nnoremap <leader>* :Ag! <C-R><C-W><CR>

nnoremap Q q
nnoremap q <Nop>

vnoremap <leader>c "+y
nnoremap <leader>p "+p

" Enable toggle for relative numbers
nnoremap <silent><leader>n :set relativenumber!<cr>

" Jumping between paragraphs
nnoremap <C-Up> {
nnoremap <C-Down> }

" Bubbling lines
nmap <C-A-Down> ddp
nmap <C-A-Up> ddkP

