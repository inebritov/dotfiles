" Terminal settings
set encoding=utf-8
filetype plugin indent on
syntax on

" Vim behavior
let mapleader=","

set mouse=
set pastetoggle=<F2>
set history=700
set undolevels=800
set tabstop=4 shiftwidth=4 expandtab

set hlsearch
set incsearch
set ignorecase
set smartcase

" Automatically create .backup directory, writable by the group.
if filewritable("~") && !filewritable("~/.vimbackup")
  silent execute '!umask 002; mkdir ~/.vimbackup'
endif

set backupdir=~/.vimbackup/
set directory=~/.vimbackup/
set bs=2
set clipboard=unnamed
set whichwrap=<,>,[,],h,l

" buffers navigation
nnoremap <F5> :buffers<CR>:buffer<Space>

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
vnoremap o :sort<CR>
vnoremap <S-h> <gv
vnoremap <S-l> >gv
inoremap <S-j> <Esc>:m .+1<CR>==gi
inoremap <S-k> <Esc>:m .-2<CR>==gi
nnoremap <S-k> :m .-2<CR>==
nnoremap <S-j> :m .+1<CR>==
vnoremap <S-j> :m '>+1<CR>gv=gv
vnoremap <S-k> :m '<-2<CR>gv=gv

" Visual settings
colorscheme holokai
set cursorline
hi CursorLine   cterm=NONE ctermbg=233 ctermfg=NONE
set hidden
set number
set list
set listchars=tab:>-

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

" git clone https://github.com/kien/ctrlp.vim ~/.vim/bundle/ctrlp.vim
"let g:ctrlp_show_hidden = 1
let g:ctrlp_map="<c-p>"
let g:ctrlp_cmd="CtrlP"

" python-mode
" git clone http://github.com/klen/python-mode
"let pymode = 1
"let pymode_breakpoint = 1
"let pymode_breakpoint_bind = '<leader>b'
"let pymode_doc = 1
"let pymode_doc_bind = 'K'
"let pymode_folding = 1
"let pymode_indent = 1
"let pymode_lint_cwindow = 0
"let pymode_lint_ignore = 'E111,E501,W0311'
"let pymode_lint_message = 1
"let pymode_lint_on_fly = 0
"let pymode_lint_on_write = 1
"let pymode_lint_select = ''
"let pymode_lint_signs = 1
"let pymode_motion = 1
"let pymode_options = 1
"let pymode_paths = []
"let pymode_quickfix_maxheight = 6
"let pymode_quickfix_minheight = 3
"let pymode_rope = 1
"let pymode_run = 1
"let pymode_run_bind = '<leader>r'
"let pymode_trim_whitespaces = 1
"let pymode_virtualenv = 1


"=====================================================
" User hotkeys
"=====================================================
" ConqueTerm
" запуск интерпретатора на F5
"nnoremap <F5> :ConqueTermSplit ipython<CR>

" а debug-mode на <F6>
"nnoremap <F6> :exe "ConqueTermSplit ipython " . expand("%")<CR>

"let g:ConqueTerm_StartMessages = 0
"let g:ConqueTerm_CloseOnEnd = 0

"imap <C-Space> <C-x><C-o>

" переключение между синтаксисами
"nnoremap <leader>sh :set ft=htmljinja<CR>
"nnoremap <leader>sp :set ft=python<CR>
"nnoremap <leader>sj :set ft=javascript<CR>
"nnoremap <leader>sc :set ft=css<CR>
"nnoremap <leader>sd :set ft=django<CR>

"=====================================================
" Languages support
"=====================================================
" --- Python ---
autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=8 formatoptions+=croq softtabstop=4 smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class,with
autocmd FileType pyrex setlocal expandtab shiftwidth=4 tabstop=8 softtabstop=4 smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class,with

" --- JavaScript ---
let javascript_enable_domhtmlcss=1
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd BufNewFile,BufRead *.json setlocal ft=javascript

" --- HTML ---
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
" --- template language support (SGML / XML too) ---
autocmd FileType html,xhtml,xml,htmldjango,htmljinja,eruby,mako setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
autocmd bufnewfile,bufread *.rhtml setlocal ft=eruby
autocmd BufNewFile,BufRead *.mako setlocal ft=mako
autocmd BufNewFile,BufRead *.tmpl setlocal ft=htmljinja
autocmd BufNewFile,BufRead *.py_tmpl setlocal ft=python
let html_no_rendering=1
let g:closetag_default_xml=1
let g:sparkupNextMapping='<c-l>'
autocmd FileType html,htmldjango,htmljinja,eruby,mako let b:closetag_html_style=1
autocmd FileType html,xhtml,xml,htmldjango,htmljinja,eruby,mako source ~/.vim/scripts/closetag.vim

" --- CSS ---
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType css setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4


" указываем каталог с настройками SnipMate
let g:snippets_dir = "~/.vim/vim-snippets/snippets"

"  при переходе за границу в 80 символов в Ruby/Python/js/C/C++ подсвечиваем на темном фоне текст
augroup vimrc_autocmds
    autocmd!
    autocmd FileType rubyython,javascript,c,cpp highlight Excess ctermbg=DarkGrey guibg=Black
    autocmd FileType rubyython,javascript,c,cpp match Excess /\%80v.*/
    autocmd FileType rubyython,javascript,c,cpp set nowrap
augroup END

