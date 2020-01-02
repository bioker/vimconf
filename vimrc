" Vim
set nocompatible
set nu
set linebreak
set textwidth=120
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
set updatetime=250
set colorcolumn=120
set omnifunc=syntaxcomplete#Complete
let mapleader=","

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
Plug 'junegunn/fzf.vim'

""" git
Plug 'tpope/vim-fugitive'

""" status info
Plug 'itchyny/lightline.vim'
Plug 'airblade/vim-gitgutter'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'kshenoy/vim-signature'

""" appearance
Plug 'altercation/vim-colors-solarized'

""" editing
Plug 'scrooloose/nerdcommenter'
Plug 'raimondi/delimitmate'
Plug 'valloric/MatchTagAlways'
Plug 'junegunn/vim-easy-align'
Plug 'chrisbra/csv.vim'

call plug#end()

"" appearance
syntax enable
set background=dark
let g:solarized_termcolors=256
colorscheme solarized
" Transparent background
hi Normal guibg=NONE ctermbg=NONE

"" common
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>ecf :echo expand('%:p')<CR>
vnoremap <leader>cp :w !xclip -selection c<CR>

"" abbreveations
iabbrev jmain public static void main(String[] args) {
iabbrev pmain if __main__ == "__main__":<cr>
iabbrev jsout System.out.println(
iabbrev selal select * from
iabbrev desct describe table

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
