" curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
call plug#begin('~/.vim/plugged')

" navigation
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'jlanzarotta/bufexplorer'

" bars
Plug 'bling/vim-airline'
Plug 'edkolev/promptline.vim'
Plug 'majutsushi/tagbar'

" editor
" Plug 'Shougo/neocomplete.vim'
" Plug 'Shougo/neosnippet.vim'
" Plug 'Shougo/neosnippet-snippets'
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
" Plug 'Xuyuanp/nerdtree-git-plugin' " Dont works. Dont know why.

" other
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'

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

" NERDTree
nmap <F4> <esc>:NERDTreeToggle<CR>
vmap <F4> <esc>:NERDTreeToggle<CR>
imap <F4> <esc><esc>:NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$']
let NERDSpaceDelims = 1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" BufExplorer
nmap <F3> <esc>:BufExplorer<CR>
vmap <F3> <esc>:BufExplorer<CR>
imap <F3> <esc><esc>:BufExplorer<CR>

" neocomplete
" let g:acp_enableAtStartup = 0
" let g:neocomplete#enable_at_startup = 1
" let g:neocomplete#enable_smart_case = 1
" let g:neocomplete#sources#syntax#min_keyword_length = 3

" vim-jedi
let g:jedi#goto_command = "<leader>b"
let g:jedi#usages_command = "<M-F7>"
" let g:jedi#auto_initialization = 0
" let g:jedi#popup_on_dot = 0
" let g:jedi#popup_select_first = 0
autocmd FileType python setlocal completeopt-=preview

" indentLine
let g:indentLine_color_term = 239

" tagbar
nmap <F5> :TagbarToggle<CR>
vmap <F5> :TagbarToggle<CR>
imap <F5> <esc>:TagbarToggle<CR>

" python-syntax
let python_highlight_all = 1

" vim-session
let g:session_directory = "~/.vim/tmp/session"
let g:session_autoload = "no"
let g:session_autosave = "no"


"""""""""""""""""""""""""""""""""""""""""""""""
"" User settings

" Terminal settings
set encoding=utf-8
filetype plugin indent on
syntax on
map <F9> :!python %<CR>

" Vim behavior
let mapleader="\<Space>"
set mouse=a
set pastetoggle=<F2>
set showmode
set clipboard=unnamed
set history=700
set undolevels=800
set autoread
set tabstop=4 shiftwidth=4 expandtab

set hlsearch
set incsearch
set ignorecase
set smartcase

" Automatically create backup directory.
if ! filewritable("~/vim/backup")
  silent !mkdir ~/.vim/backup > /dev/null 2>&1
endif

set backupdir=~/.vim/backup/
set directory=~/.vim/backup/
set bs=2
set whichwrap=<,>,[,],h,l

" buffers
map . :bn<CR>
map , :bp<CR>
map <leader>d <esc>:bd<CR>
map <leader>h <esc>:noh<CR>

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
map <C-o> o<esc>
imap <C-o> <esc>o
nmap <bs> X

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

" shift selection
map <S-Up> vk
imap <S-Up> <esc>vk
vmap <S-Up> k
map <S-Down> vj
imap <S-Down> <esc>vj
vmap <S-Down> j
