"""""""""""""""""""""""""""""""""""""""""""""""
"" Plugins

" curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
call plug#begin('~/.vim/plugged')

" navigation
Plug 'scrooloose/nerdtree'
Plug 'jlanzarotta/bufexplorer'
Plug 'terryma/vim-smooth-scroll'

" bars
Plug 'bling/vim-airline'
Plug 'edkolev/promptline.vim'
Plug 'majutsushi/tagbar'

" editor
Plug 'scrooloose/nerdcommenter'
Plug 'yueyoum/vim-linemovement'
Plug 'Yggdroot/indentLine'
Plug 'gregsexton/MatchTag'

" colorschemes
Plug 'changyuheng/color-scheme-holokai-for-vim'
Plug 'pfdevilliers/Pretty-Vim-Python'
Plug 'hdima/python-syntax'

" python
Plug 'davidhalter/jedi-vim'

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
autocmd bufenter * if (winnr('$') == 1 && exists('b:NERDTreeType') && b:NERDTreeType == 'primary') | q | endif

" vim-jedi
autocmd FileType python setlocal completeopt-=preview

" indentLine
let g:indentLine_color_term=239

" python-syntax
let python_highlight_all=1


"""""""""""""""""""""""""""""""""""""""""""""""
" Files

" Automatically create backup directory.
if ! filewritable("~/vim/backup")
    silent ! mkdir -pm 777 ~/.vim/backup > /dev/null 3>&1
endif

set backupdir=~/.vim/backup/
set directory=~/.vim/backup/

let NERDTreeIgnore=['\.pyc$']


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
set clipboard=unnamed
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
map <leader>d <esc>:bd<CR>
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
map <C-q> <esc>:q<CR>

map <C-o> o<esc>
imap <C-o> <esc>o

map <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
map <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
noremap <silent> <c-k> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-j> :call smooth_scroll#down(&scroll, 0, 2)<CR>
inoremap <silent> <c-k> <esc>:call smooth_scroll#up(&scroll, 0, 2)<CR>i
inoremap <silent> <c-j> <esc>:call smooth_scroll#down(&scroll, 0, 2)<CR>i
map <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
map <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>

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

" Tab
nmap <Tab> >>
vmap <Tab> >gv


" Other
nmap <bs> X
vnoremap o :sort<CR>
