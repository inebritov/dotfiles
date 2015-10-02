"""""""""""""""""""""""""""""""""""""""""""""""
"" Plugins

" curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
call plug#begin('~/.vim/plugged')

" navigation
Plug 'scrooloose/nerdtree'
Plug 'jlanzarotta/bufexplorer'
Plug 'terryma/vim-smooth-scroll'
Plug 'rbgrouleff/bclose.vim'

" bars
Plug 'bling/vim-airline'
Plug 'edkolev/promptline.vim'
Plug 'majutsushi/tagbar'

" editor
Plug 'scrooloose/nerdcommenter'
Plug 'yueyoum/vim-linemovement'
Plug 'Yggdroot/indentLine'
Plug 'gregsexton/MatchTag'
Plug 'terryma/vim-multiple-cursors'

" colorschemes
Plug 'changyuheng/color-scheme-holokai-for-vim'
Plug 'pfdevilliers/Pretty-Vim-Python'
Plug 'hdima/python-syntax'

" python
Plug 'davidhalter/jedi-vim'
Plug 'lambdalisue/vim-pyenv'

" git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'Xuyuanp/nerdtree-git-plugin'

call plug#end()

" airline
set laststatus=2
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#hunks#enabled=1
let g:airline#extensions#branch#enabled=1

" NERDTree
let NERDSpaceDelims=1
let NERDTreeQuitOnOpen=1
autocmd bufenter * if (winnr('$') == 1 && exists('b:NERDTreeType') && b:NERDTreeType == 'primary') | q | endif

" vim-jedi
autocmd FileType python setlocal completeopt-=preview

" indentLine
let g:indentLine_color_term=239

" python-syntax
let python_highlight_all=1

" bclose
let bclose_multiple = 0


"""""""""""""""""""""""""""""""""""""""""""""""
" Files

" Automatically create backup, swap and undo directories.
if ! filewritable("~/.vim/backup")
    silent ! mkdir -pm 777 ~/.vim/backup > /dev/null 3>&1
endif

if ! filewritable("~/.vim/swap")
    silent ! mkdir -pm 777 ~/.vim/swap > /dev/null 3>&1
endif

if ! filewritable("~/.vim/undo")
    silent ! mkdir -pm 777 ~/.vim/undo > /dev/null 3>&1
endif

" The '//' ending means full file names  
set undodir=~/.vim/undo//
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//


"""""""""""""""""""""""""""""""""""""""""""""""
"" Visual settings

colorscheme holokai
set cursorline
hi CursorLine cterm=NONE ctermbg=233 ctermfg=NONE
set hidden
set number
set list
set listchars=tab:>-


"""""""""""""""""""""""""""""""""""""""""""""""
"" Vim settings

" Terminal settings
filetype plugin indent on
set encoding=utf-8
syntax on

" Vim behavior
set mouse=a
set showmode
set clipboard=unnamedplus
set history=700
set undolevels=800
set autoread
set tabstop=4
set shiftwidth=4
set expandtab

set hlsearch
set incsearch
set ignorecase
set smartcase

set bs=2
set whichwrap=<,>,[,],h,l


"""""""""""""""""""""""""""""""""""""""""""""""
"" Keymap

" Leader
let mapleader="\<Space>"
let g:jedi#goto_command='<leader>b'
map <leader>d <esc>:Bclose<CR>
map <leader>h <esc>:noh<CR>

" Fn
set pastetoggle=<F2>

nmap <F3> <esc>:BufExplorer<CR>
vmap <F3> <esc>:BufExplorer<CR>
imap <F3> <esc><esc>:BufExplorer<CR>

nmap <F4> <esc>:NERDTreeToggle<CR>
vmap <F4> <esc>:NERDTreeToggle<CR>
imap <F4> <esc><esc>:NERDTreeToggle<CR>

nmap <F5> :TagbarToggle<CR>
vmap <F5> :TagbarToggle<CR>
imap <F5> <esc>:TagbarToggle<CR>

map <F9> :!python %<CR>

" Meta (alt)
let g:jedi#usages_command='<M-F7>'
map <M-Right> :bn<CR>
map <M-Left> :bp<CR>
imap <M-Right> <esc>:bn<CR>
imap <M-Left> <esc>:bp<CR>

" Ctrl
nmap <C-h> b
nmap <C-l> w
imap <C-h> <S-Left>
imap <C-l> <S-Right>

map <C-s> <esc>:w<CR>
map <C-q> <esc>:q<CR>
imap <C-s> <esc>:w<CR>

map <C-o> o<esc>
imap <C-o> <esc>o

map <silent> <c-u> :call smooth_scroll#up(&scroll, 10, 2)<CR>
map <silent> <c-d> :call smooth_scroll#down(&scroll, 10, 2)<CR>
noremap <silent> <c-k> :call smooth_scroll#up(&scroll, 10, 2)<CR>
noremap <silent> <c-j> :call smooth_scroll#down(&scroll, 10, 2)<CR>
inoremap <silent> <c-k> <esc>:call smooth_scroll#up(&scroll, 10, 2)<CR>i
inoremap <silent> <c-j> <esc>:call smooth_scroll#down(&scroll, 10, 2)<CR>i
map <silent> <c-b> :call smooth_scroll#up(&scroll*2, 10, 4)<CR>
map <silent> <c-f> :call smooth_scroll#down(&scroll*2, 10, 4)<CR>

" Shift
nmap <S-Tab> <<
imap <S-Tab> <C-d>
vmap <S-Tab> <gv

nmap <S-k> v<Up>
nmap <S-j> v<Down>
nmap <S-h> v<Left>
nmap <S-l> v<Right>
vmap <S-k> <Up>
vmap <S-j> <Down>
vmap <S-h> <Left>
vmap <S-l> <Right>

map <S-Up> vk
map <S-Down> vj
map <S-Left> vh
map <S-Right> vl
vmap <S-Up> k
vmap <S-Down> j
vmap <S-Left> h
vmap <S-Right> l
imap <S-Up> <esc>vk
imap <S-Down> <esc>vj
imap <S-Left> <esc>vh
imap <S-Right> <esc>vl

" Tab
nmap <Tab> >>
vmap <Tab> >gv

" Other
noremap p P
noremap P gp
nmap <bs> X
vnoremap o :sort<CR>
map + <C-w>>
map - <C-w><
