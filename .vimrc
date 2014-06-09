" Use UTF-8 encoding
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8

" Disable vi compatibility (emulation of old bugs)
set nocompatible
set autoindent
set smartindent

" Tab width=2 and spaces instead of tabs
set tabstop=2        " tab width is 4 spaces
set shiftwidth=2     " indent also with 4 spaces
set expandtab        " expand tabs to spaces

" Wrap lines at 80
set textwidth=80

" Syntax highlighting
set t_Co=256
syntax on

" Theme
if has('gui_running')
  colorscheme darkblue
else
  colorscheme wombat256
endif

" Line numbers
set number

" Highlight matching braces
set showmatch

" Use intelligent file completion like in the bash
set wildmode=longest:full
set wildmenu

" vim-git plugin
set laststatus=2
set statusline=%{GitBranch()}

" keyboard mappings
"

" in normal mode F2 will save the file
nmap <F2> :w<CR>

" in insert mode F2 will exit insert, save, enters insert again
imap <F2> <ESC>:w<CR>i

" switch between header/source with F4 C
map <F4> :e %:p:s,.h$,.X123X,:s,.c$,.h,:s,.X123X$,.c,<CR>

" recreate tags file with F5
map <F5> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" make 
imap <F7> <ESC>:w<CR>:make<CR>

" make all
map <S-F7> :make clean all<CR>

" macro recording
nmap <S-F8> qq
nmap <F8> @q

" goto definition with F12
map <F12> <C-]>

