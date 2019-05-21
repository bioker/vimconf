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

Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'Shougo/unite.vim'
Plug 'rstacruz/vim-fastunite'

Plug 'Shougo/neomru.vim'
Plug 'Shougo/unite-outline'
Plug 'tsukkee/unite-tag'

""" git
Plug 'tpope/vim-fugitive'

""" status info
Plug 'itchyny/lightline.vim'
Plug 'airblade/vim-gitgutter'
Plug 'Xuyuanp/nerdtree-git-plugin'

""" appearance
Plug 'altercation/vim-colors-solarized'

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
Plug 'vim-syntastic/syntastic'

""" util
Plug 'actionshrimp/vim-xpath'
Plug 'will133/vim-dirdiff'
Plug 'amoffat/snake'

call plug#end()

"" appearance
syntax enable
set background=dark
let g:solarized_termcolors=256
colorscheme solarized
" Transparent background
hi Normal guibg=NONE ctermbg=NONE

"" common
vnoremap <leader>c "+y
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lel
"" abbreveations
iabbrev jmain public static void main(String[] args) {
iabbrev pmain if __main__ == "__main__":<cr>
iabbrev jsout System.out.println(
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
       \             [ 'fugitive', 'readonly', 'absolutepath', 'modified' ] ]
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

" C lang complete
let g:clang_library_path='/usr/lib/llvm-5.0/lib/'

" Syntastic
let g:syntastic_java_checkers = ['checkstyle']
let g:syntastic_java_checkstyle_classpath = g:vimDir. '/lib/checkstyle-8.16-all.jar'
let g:syntastic_java_checkstyle_conf_file = g:vimDir. '/res/checkstyle/google_checks.xml'
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_wq = 0

if filereadable(expand("~/.vim/bundle/snake/plugin/snake.vim"))
    source ~/.vim/bundle/snake/plugin/snake.vim
endif
