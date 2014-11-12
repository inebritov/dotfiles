" Terminal settings
set encoding=utf-8
filetype plugin indent on
syntax on

" Vim behavior
autocmd! bufwritepost .vimrc source %

let mapleader=","

set mouse=a
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
set clipboard=unnamedplus
set whichwrap=<,>,[,],h,l

map <C-S> <esc>:update<CR>
map <C-Q> <esc>:q<CR>
map <Leader>, <esc>:tabnext<CR>
map <Leader>. <esc>:tabprevious<CR>
map <Leader>w <esc>:tabclose<CR>
map <Leader>t <esc>:tabnew<CR>
map <Leader>Q :q!<CR>
map <Leader>q :q<CR>
map <Leader>s :update<CR>
map Q <esc><Leader>ig

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

" vim-colorschemes
" cd ~/.vim
" git init
" git submodule add https://github.com/flazz/vim-colorschemes.git
" cp -r vim-colorschemes/colors colors

" pathogen
" mkdir -p ~/.vim/autoload ~/.vim/bundle
" curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
execute pathogen#infect()

" vim-airline
" git clone https://github.com/bling/vim-airline ~/.vim/bundle/vim-airline
" powerline fonts https://powerline.readthedocs.org/en/latest/installation/linux.html#font-installation
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" linemovement
" git clone https://github.com/yueyoum/vim-linemovement ~/.vim/bundle/vim-linemovement

"



