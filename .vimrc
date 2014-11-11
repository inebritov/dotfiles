" Terminal settings
set encoding=utf-8
filetype plugin indent on
syntax on

" Vim behavior
autocmd! bufwritepost .vimrc source %

let mapleader=","

set pastetoggle=<F2>
set clipboard=unnamed
set history=700
set undolevels=800

set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

set hlsearch
set incsearch
set ignorecase
set smartcase

set nobackup
set nowritebackup
set noswapfile

map <C-S> <esc>:w<CR>
map <Leader>, <esc>:tabnext<CR>
map <Leader>. <esc>:tabprevious<CR>
map <Leader>Q :q!<CR>
map <Leader>q :q<CR>
vmap <C-S> <esc>:w<CR>

vnoremap o :sort<CR>
vnoremap < <gv
vnoremap > >gv

" Visual settings
colorscheme inkpot
highlight ExtraWhitespace ctermbg=red
match ExtraWhitespace /\s\+$/
set ts=4 sw=4 noet
set number
let g:indent_guides_auto_colors = 0
hi IndentGuidesOdd  ctermbg=darkgrey
hi IndentGuidesEven ctermbg=darkgrey

let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1


" ==========================================================================
" Plugins settings
" ==========================================================================

" pathogen - plugins manager
" mkdir -p ~/.vim/autoload ~/.vim/bundle 
" curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
execute pathogen#infect()

" vim-powerline
" git clone https://github.com/Lokaltog/vim-powerline.git ~/.vim/bundle/vim-powerline
set laststatus=2










