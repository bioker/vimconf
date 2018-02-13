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
set tabstop=8
set softtabstop=4
set expandtab
set smarttab
set ruler
set undolevels=1000
set backspace=indent,eol,start
set encoding=utf-8
set fileencoding=utf-8
set laststatus=2
set listchars+=tab:>.
let mapleader=","
set updatetime=250

" VimPlug

"" install if not exist
if empty(glob("~/.vim/autoload/plug.vim"))
        execute '!curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif

"" plugins
call plug#begin()

""" navigation
Plug 'scrooloose/nerdtree'
Plug 'ivalkeen/nerdtree-execute'

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
Plug 'junegunn/vim-easy-align'
Plug 'kshenoy/vim-signature'
Plug 'chrisbra/csv.vim'

""" util
Plug 'actionshrimp/vim-xpath'
Plug 'will133/vim-dirdiff'
Plug 'valloric/MatchTagAlways'

call plug#end()

" My

"" appearance
syntax enable
set background=dark
let g:solarized_termcolors=256
colorscheme solarized

"" git
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>ga :Gwrite<CR>
nnoremap <leader>gr :Gread<CR>
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>gpu :!git pull<CR>
nnoremap <leader>gp :!git push<CR>
nnoremap <leader>gpt :!git push --tags<CR>

"" formatting
nnoremap <leader>ff gg=G
"" common
nnoremap <leader>el v$h
nnoremap <c-/> :call NERDComment("n", "Invert")<CR>
nnoremap <leader>hls :set hlsearch!<CR>
vnoremap <leader>c "+y

"" echo absolute path
nnoremap <leader>ecf :echo expand('%:p')<CR>

"" execute
noremap ; :!


"" maven

function! MavenExec()
    let class = input('Enter full class name:')
    execute '!mvn exec:java -Dexec.mainClass="' . class . '"'
endfunction

function! MavenInstallFile()
    let file = input('Enter file name:')
    let groupId = input('Enter group id:')
    let artifactId = input('Enter artifact id:')
    let artifactVersion = input('Enter version:')
    let packaging = input('Enter packaging:')
    execute '!mvn install:install-file -Dfile="' . file . '"' . ' -DgroupId="'
                \ . groupId . '" -DartifactId="' . artifactId . '" -Dversion="'
                \ . artifactVersion . '" -Dpackaging="' . packaging . '"'
endfunction

function! CreateJavaProject()
    let result = system("mkdir -p src/main/java;" . 
                \ "mkdir -p src/main/resources;" .
                \ "mkdir -p src/test/java;" .
                \ "mkdir -p src/test/resources")
endfunction

function! CreateGroovyProject()
    let result = system("mkdir -p src/main/groovy;" .
                \ "mkdir -p src/main/resources;" .
                \ "mkdir -p src/test/groovy;" .
                \ "mkdir -p src/test/resources")
endfunction

function! CreateScalaProject()
    let result = system("mkdir -p src/main/scala;" .
                \ "mkdir -p src/main/resources;" .
                \ "mkdir -p src/test/scala;" .
                \ "mkdir -p src/test/resources")
endfunction

"" maven test plugin call
function! MavenTest()
    let testGroup = input('Enter package:')
    execute '!mvn clean test -DtestGroup="' . testGroup . '"'
endfunction

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

" EasyAlign
xnoremap ga <Plug>(EasyAlign)
nnoremap ga <Plug>(EasyAlign)
