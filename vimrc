" Vim
set nocompatible
set nu
set linebreak
set textwidth=100
set showmatch
set hlsearch
set smartcase
set ignorecase
set incsearch
set autoindent
set shiftwidth=4
set smartindent
set softtabstop=4
set expandtab
set smarttab
set ruler
set backspace=indent,eol,start
set encoding=utf-8
set fileencoding=utf-8
set laststatus=2
set listchars+=tab:>.
let mapleader=","
set updatetime=250
set colorcolumn=80
set omnifunc=syntaxcomplete#Complete

" VimPlug

"" install if not exist
if empty(glob("~/.vim/autoload/plug.vim"))
        execute '!curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif

"" plugins
call plug#begin()

""" navigation
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf'

""" git
Plug 'tpope/vim-fugitive'

""" status info
Plug 'itchyny/lightline.vim'
Plug 'airblade/vim-gitgutter'
Plug 'Xuyuanp/nerdtree-git-plugin'

""" appearance
Plug 'altercation/vim-colors-solarized'

""" template
Plug 'bioker/vBox.vim'

""" editing
Plug 'scrooloose/nerdcommenter'
Plug 'raimondi/delimitmate'
Plug 'valloric/MatchTagAlways'
Plug 'junegunn/vim-easy-align'
Plug 'kshenoy/vim-signature'
Plug 'chrisbra/csv.vim'
Plug 'davidhalter/jedi-vim'
Plug 'ternjs/tern_for_vim'
Plug 'rip-rip/clang_complete'

""" util
Plug 'actionshrimp/vim-xpath'
Plug 'will133/vim-dirdiff'

call plug#end()

"" appearance
syntax enable
set background=dark
let g:solarized_termcolors=256
colorscheme solarized
hi Normal guibg=NONE ctermbg=NONE

"" common
nnoremap <leader>el v$h
nnoremap <leader>hls :set hlsearch!<CR>
vnoremap <leader>c "+y
"" echo absolute path
nnoremap <leader>ecf :echo expand('%:p')<CR>
"" execute
noremap ; :!

" NERDTree
noremap <C-n> :NERDTreeToggle<CR>
let NERDTreeChDirMode=2

"" NERDTree Git
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "m",
    \ "Staged"    : "a",
    \ "Untracked" : "u",
    \ "Renamed"   : "r",
    \ "Unmerged"  : "!",
    \ "Deleted"   : "d",
    \ "Dirty"     : "m",
    \ "Clean"     : "c",
    \ 'Ignored'   : "i",
    \ "Unknown"   : "?"
    \ }
let g:NERDTreeShowIgnoredStatus = 1

" LightLine
let g:lightline = {
       \ 'colorscheme': 'wombat',
       \ 'active': {
       \   'left': [ [ 'mode', 'paste' ],
       \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
       \ },
       \ 'component': {
       \   'readonly': '%{&filetype=="help"?"READONLY":&readonly?"READONLY":""}',
       \   'modified': '%{&filetype=="help"?"":&modified?"MODIFIED":&modifiable?"":"-"}',
       \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():"NON VERSIONED"}'
       \ },
       \ 'component_visible_condition': {
       \   'readonly': '(&filetype!="help"&& &readonly)',
       \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
       \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
       \ },
       \ 'separator': { 'left': '', 'right': '' },
       \ 'subseparator': { 'left': '', 'right': '' }
       \ }

" VBox
let g:vimDir = $HOME.'/.vim'
let g:vbox = {
            \   'dir': g:vimDir. '/vbox'
            \ }
let g:vbox.empty_buffer_only = 0
nnoremap <leader>it :VBTemplate<space>

" Python
nnoremap <leader>py :%!python<CR>
vnoremap <leader>py :!python<CR>
vnoremap <leader>epy :w !python<CR>

" Scala
nnoremap <leader>sc :%!xargs -0 scala -e<CR>
vnoremap <leader>sc :!xargs -0 scala -e<CR>
vnoremap <leader>esc :w !xargs -0 scala -e<CR>

" Hive
nnoremap <leader>hv :%!xargs -0 beeline -u jdbc:hive2://localhost:10000 -e<CR>
vnoremap <leader>hv :!xargs -0 beeline -u jdbc:hive2://localhost:10000 -e<CR>
vnoremap <leader>ehv :w !xargs -0 beeline -u jdbc:hive2://localhost:10000 -e<CR>

" C lang complete
let g:clang_library_path='/usr/lib/llvm-5.0/lib/'
