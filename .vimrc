" Terminal settings
set encoding=utf-8
filetype plugin indent on
syntax on

" Vim behavior
let mapleader=","

set mouse=a
set history=700
set undolevels=800

set tabstop=4 shiftwidth=4 expandtab

set hlsearch
set incsearch
set ignorecase
set smartcase

set nobackup
set nowritebackup
set noswapfile
set bs=2
set pastetoggle=<Leader>p
set clipboard=unnamed
set whichwrap=<,>,[,],h,l

map <C-S> <esc>:update<CR>
map <C-Q> <esc>:q<CR>
map <Leader>, <esc>:bn<CR>
map <Leader>. <esc>:bp<CR>
map <Leader>w <esc>:bd<CR>
map <Leader>f <esc>:b 
map <Leader>e <esc>:e 
map <Leader>Q :q!<CR>
map <Leader>q :q<CR>
map <Leader>s :update<CR>
imap <C-S> <esc>:update<CR>
imap <C-Q> <esc>:q<CR>

vnoremap o :sort<CR>
vnoremap < <gv
vnoremap > >gv

" Visual settings
colorscheme inkpot
set number
set listchars=tab:>-
set list

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

" ctrlp
" git clone https://github.com/kien/ctrlp.vim ~/.vim/bundle/ctrlp.vim
let g:ctrlp_show_hidden = 1


" python-mode
" git clone https://github.com/klen/python-mode
map <Leader>g :call RopeGotoDefinition()<CR>
let ropevim_enable_shortcuts = 1
let g:pymode_rope_goto_def_newwin = 'vnew'
let g:pymode_rope_extended_complete = 1
let g:pymode_breakpoint = 0
let g:pymode_syntax = 1
let g:pymode_syntax_builtin_objs = 0
let g:pymode_syntax_builtin_funcs = 0
map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>

set completeopt=longest,menuone
function! OmniPopup(action)
  if pumvisible()
    if a:action == 'j'
      return "\<C-N>"
    elseif a:action == 'k'
      return "\<C-P>"
    endif
  endif

  return a:action
endfunction

inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>

" python folding
" mkdir -p ~/.vim/ftplugin
" wget -O ~/.vim/ftplugin/python_editing.vim
" http://www.vim.org/scriptw/download_script.php?src_id=5492
set nofoldenable



