" curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
call plug#begin('~/.vim/plugged')

" navigation
Plug 'kien/ctrlp'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'jlanzarotta/bufexplorer'

" bars
Plug 'bling/vim-airline'
Plug 'edkolev/promptline.vim'

" editor
Plug 'Shougo/neocomplete.vim'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'yueyoum/vim-linemovement'

" colorschemes
Plug 'changyuheng/color-scheme-holokai-for-vim'

" python
Plug 'davidhalter/jedi-vim'

" git
Plug 'tpope/vim-fugitive'

call plug#end()



"""""""""""""""""""""""""""""""""""""""""""""""
"" Plugin settings


" airline
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#hunks#enabled=1
let g:airline#extensions#branch#enabled=1
"let g:airline_left_sep = ' '
"let g:airline_right_sep = ' '

" ctrlp
let g:ctrlp_map="<c-p>"
let g:ctrlp_cmd="CtrlPMixed"




"""""""""""""""""""""""""""""""""""""""""""""""
"" User settings


" Terminal settings
set encoding=utf-8
filetype plugin indent on
syntax on
map <F9> :!python %<CR>

let mapleader=","

" Vim behavior
set mouse=a
set pastetoggle=<F2>
set history=700
set undolevels=800
set autoread
set tabstop=4 shiftwidth=4 expandtab

set hlsearch
set incsearch
set ignorecase
set smartcase

" Automatically create .backup directory, writable by the group.
if filewritable(".") && ! filewritable(".backup")
  silent execute '!umask 002; mkdir .backup'
endif

set backupdir=~/.vimbackup/
set directory=~/.vimbackup/
set bs=2
set clipboard=unnamedplus
set whichwrap=<,>,[,],h,l

" buffers navigation
map <C-b> :buffers<CR>

" save, quit
map <C-s> <esc>:w<CR>
map <C-q> <esc>:q<CR>
imap <C-s> <esc>:w<CR>
imap <C-q> <esc>:q<CR>

" insertion mode navigation
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>

" line movement
map <Tab> >>
map <S-Tab> <<
inoremap <S-Tab> <C-d>
vnoremap o :sort<CR>
vnoremap <S-h> <gv
vnoremap <S-l> >gv
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv
nmap <S-j> :m .+1<CR>==
nmap <S-k> :m .-2<CR>==
vnoremap <S-j> :m '>+1<CR>gv=gv
vnoremap <S-k> :m '<-2<CR>gv=gv



"""""""""""""""""""""""""""""""""""""""""""""""
"" Visual settings


colorscheme holokai
set cursorline
hi CursorLine   cterm=NONE ctermbg=233 ctermfg=NONE
set hidden
set number
set list
set listchars=tab:>-
