set nocompatible
filetype off

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'flazz/vim-colorschemes'
Plug 'bling/vim-airline'
Plug 'fatih/vim-go'
Plug 'tpope/vim-surround'
Plug 'kien/rainbow_parentheses.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'junegunn/fzf',  { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-commentary'
Plug 'luochen1990/rainbow'
Plug 'vim-airline/vim-airline-themes'
Plug 'wellle/targets.vim'
Plug 'jamessan/vim-gnupg'
Plug 'zah/nim.vim'
Plug 'wuelnerdotexe/vim-enfocado'
Plug 'francoiscabrol/ranger.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" All of your Plugins must be added before the following line
call plug#end()

filetype plugin indent on
set foldmethod=indent
set foldnestmax=3
set nofoldenable
set noswapfile
set confirm
set encoding=utf-8
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8
set clipboard+=unnamed
set clipboard+=unnamedplus
set cursorline
set history=1000
set showcmd
set showmode
set breakindent
set formatoptions=l
set lbr

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
set smarttab

set hlsearch
set incsearch
set ignorecase
set smartcase

set autoindent
set smartindent

set termguicolors
set background=dark
set t_Co=256
syntax on

set number
set title
set ruler
set showmatch
set wildmode=longest:full
set wildmenu
set laststatus=2

" Turn off menubar and toolbar in gui mode
if has('gui_running')
  set guioptions -=m
  set guioptions -=T
endif

" Open quickfix window after any grep invocation
if has('autocmd')
  autocmd QuickFixCmdPost *grep* cwindow
endif

if executable('rg')
    set grepprg=rg\ --vimgrep\ --no-heading
    set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

if has('autocmd')
  autocmd BufWritePre * :%s/\s\+$//e
endif

let g:airline_powerline_fonts = 1

" Tags (generate with "ctags -R")
set autochdir
set tags+=./tags;

" Ranger
let g:ranger_map_keys = 0
let g:ranger_command_override = 'ranger --cmd "set show_hidden=true"'

" Keys
nmap - :tabnext<CR>

" switch between header/source with F4 C
map <F4> :e %:p:s,.h$,.X123X,:s,.c$,.h,:s,.X123X$,.c,<CR>

" recreate tags file with F5
map <F5> :!ctags -R --exclude=.git --exclude=log .<CR>

" make
imap <F7> <ESC>:w<CR>:make<CR>

" make all
map <S-F7> :make clean all<CR>

" macro recording
nmap <S-F8> qq
nmap <F8> @q

" goto definition with F12
map <F12> <C-]>

nnoremap <C-p> :Files<CR>

let mapleader = " "

nnoremap <leader>bd :bd<CR>
nnoremap <leader>pf :Files<CR>
nnoremap <leader>ev :tabedit ~/.vimrc<CR>
nnoremap <leader>so :source %<CR>
nnoremap <leader>/ :Rg<SPACE>
nnoremap <leader>ww <C-w><C-w>
nnoremap <leader>wd <C-w>q
nnoremap <leader>gg :Git status<CR>
nnoremap <leader>gb :Git blame<CR>
nnoremap <leader>qq :q<CR>
nnoremap <leader>fs :w<CR>
nnoremap <leader>bb :Buffers<CR>
nnoremap <leader>ss :Lines<CR>
nnoremap <leader>* :Rg<SPACE><C-R><C-W><CR>
nnoremap <leader>fb :BookmarkShowAll<CR>
nnoremap <leader>sb :BookmarkAnnotate<CR>
nnoremap <leader>fr :History<CR>
nnoremap <leader>w/ :vsp<CR>
nnoremap <leader>ws :split<CR>
nnoremap <leader>cd :tag <C-R><C-W><CR>
nnoremap <leader>ji :Tags<CR>
nnoremap <leader>ht :Colors<CR>
nnoremap <leader>gr :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
nnoremap <leader>qq :q<CR>
nnoremap <leader>ff :Ranger<CR>
nnoremap <leader>tt :NERDTreeToggle<CR>
nnoremap <leader>bn :ene<CR>
nnoremap <leader>ot :shell<CR>

nnoremap Q q
nnoremap q <Nop>

vnoremap <leader>c "+y
nnoremap <leader>p "+p

" TODO
xnoremap p pgvy

" toggle relative line numbers
nnoremap <silent><leader>n :set relativenumber!<CR>

" Jumping between paragraphs
nnoremap <C-Up> {
nnoremap <C-Down> }
nnoremap <C-k> {
nnoremap <C-j> }

colorscheme enfocado
let g:enfocado_style = 'neon' " Available: `nature` or `neon`.
let g:airline_theme='enfocado'
