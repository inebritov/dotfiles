"""""""""""""""""""""""""""""""""""""""""""""""
"" Plugins

" curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
call plug#begin('~/.vim/plugged')

" navigation
Plug 'scrooloose/nerdtree'
Plug 'jlanzarotta/bufexplorer'
Plug 'terryma/vim-smooth-scroll'
Plug 'rbgrouleff/bclose.vim'
Plug 'kien/ctrlp.vim'

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
Plug 'kh3phr3n/python-syntax'

" completion
Plug 'davidhalter/jedi-vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'ervandew/supertab'
Plug 'lambdalisue/vim-pyenv'

" vcs
Plug 'vim-scripts/vcscommand.vim'
Plug 'mhinz/vim-signify'
Plug 'Xuyuanp/nerdtree-git-plugin'

call plug#end()

" airline
set laststatus=2
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#hunks#enabled=1
let g:airline#extensions#branch#enabled=1

" tagbar
let g:tagbar_autofocus = 1

" NERDTree
let NERDSpaceDelims=1
let NERDTreeIgnore=['.pyc', '__pycache__']
autocmd bufenter * if (winnr('$') == 1 && exists('b:NERDTreeType') && b:NERDTreeType == 'primary') | q | endif

" vim-jedi
let g:jedi#show_call_signatures = "2"
let g:jedi#use_splits_not_buffers = "right"
let g:jedi#popup_on_dot = 0

" supertab
let g:SuperTabDefaultCompletionType = "<c-n>"

" indentLine
let g:indentLine_color_term = 239

" python-syntax
let python_self_cls_highlight = 1

" bclose
let bclose_multiple = 0

" ctrlp
let g:ctrlp_cache_dir = "~/.cache/ctrlp"
let g:ctrlp_show_hidden = 1
let g:ctrlp_custom_ignore = {
\   'dir':  '\v[\/]\.(git|hg|svn|__pycache__)$',
\   'file': '\v\.(exe|so|dll|pyc)$',
\   'link': 'some_bad_symbolic_links',
\}


"""""""""""""""""""""""""""""""""""""""""""""""
" Completion

autocmd FileType * setlocal completeopt-=preview
autocmd FileType * setlocal omnifunc=syntaxcomplete#Complete
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=jedi#completions


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
"" Vim settings

" Terminal settings
filetype plugin indent on
set clipboard=unnamedplus
scriptencoding utf-8
set encoding=utf-8
set esckeys
set ttimeoutlen=1
syntax on

" Vim behavior
set autoread
set expandtab
set history=700
set mouse=a
set noshowmode
set shiftwidth=4
set showcmd
set tabstop=4
set undolevels=800
set wildmenu

set hlsearch
set ignorecase
set incsearch
set smartcase

set backspace=indent,eol,start
set whichwrap=<,>,[,],h,l


"""""""""""""""""""""""""""""""""""""""""""""""
"" Visual settings

colorscheme holokai
set cursorline
set listchars=tab:>-,trail:·
set list
set hidden
set number
hi CursorLine cterm=NONE ctermbg=233 ctermfg=NONE


"""""""""""""""""""""""""""""""""""""""""""""""
"" Keymap

" Leader
let mapleader="\<Space>"
let g:jedi#documentation_command="<leader>k"
map <leader>x <esc>:Bclose<CR>
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

map <silent><F8> <esc>Oimport ipdb; ipdb.set_trace()<esc>j
map <F9> :!python %<CR>

" Meta (alt)
map <M-Right> :bn<CR>
map <M-Left> :bp<CR>
imap <M-Right> <esc>:bn<CR>
imap <M-Left> <esc>:bp<CR>

" Ctrl
imap <C-Space> <C-x><C-o>
imap <C-@> <C-Space>

nmap <C-h> b
nmap <C-l> w

map <C-s> <esc>:w<CR>
map <C-q> <esc>:q<CR>
imap <C-s> <esc>:w<CR>
imap <C-v> <C-r>*

imap <C-o> <esc>o

map <silent> <C-u> :call smooth_scroll#up(&scroll, 10, 2)<CR>
map <silent> <C-d> :call smooth_scroll#down(&scroll, 10, 2)<CR>
map <silent> <C-b> :call smooth_scroll#up(&scroll*2, 10, 4)<CR>
map <silent> <C-f> :call smooth_scroll#down(&scroll*2, 10, 4)<CR>
inoremap <silent> <C-u> <esc>:call smooth_scroll#up(&scroll, 10, 2)<CR>i
inoremap <silent> <C-d> <esc>:call smooth_scroll#down(&scroll, 10, 2)<CR>i
inoremap <silent> <C-b> <esc>:call smooth_scroll#up(&scroll*2, 10, 4)<CR>i
inoremap <silent> <C-f> <esc>:call smooth_scroll#down(&scroll*2, 10, 4)<CR>i

map <silent> <C-k> :call smooth_scroll#up(&scroll, 10, 2)<CR>
map <silent> <C-j> :call smooth_scroll#down(&scroll, 10, 2)<CR>

inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>

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

" Search for selected text, forwards or backwards.
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
