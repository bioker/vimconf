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

""" status info
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'
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
Plug 'SirVer/ultisnips'

call plug#end()

" My

"" colorscheme
syntax enable
set background=dark
"set background=light
let g:solarized_termcolors=256
colorscheme solarized
noremap ; :!

"" git

function! GitCommit()
    let comment = input('Enter commit: ')
    execute '!git commit -m "' . comment '"'
endfunction
function! GitTag()
    let tag = input('Enter tag: ')
    execute '!git tag ' . tag
endfunction
nnoremap <leader>gs :!git status<CR>
nnoremap <leader>gpu :!git pull<CR>
nnoremap <leader>ga :!git add .<CR>
nnoremap <leader>gc :call GitCommit()<CR>
nnoremap <leader>gt :call GitTag()<CR>
nnoremap <leader>gp :!git push<CR>
nnoremap <leader>gpt :!git push --tags<CR>
nnoremap <leader>ff gg=G
" echo absolute path
nnoremap <leader>ecf :echo expand('%:p')<CR>


"" maven

function! MavenExec()
    let class = input('Enter full class name:')
    execute '!mvn exec:java -Dexec.mainClass="' . class . '"'
endfunction
nnoremap <leader>me :call MavenExec()<CR>

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
nnoremap <leader>mif :call MavenInstallFile()<CR>

"" maven test plugin call
function! MavenTest()
    let testGroup = input('Enter package:')
    execute '!mvn clean test -DtestGroup="' . testGroup . '"'
endfunction
nnoremap <leader>mt :call MavenTest()<CR>
"" maven simple actions
nnoremap <leader>mc :!mvn clean<CR>
nnoremap <leader>mcp :!mvn clean package<CR>
nnoremap <leader>mci :!mvn clean install<CR>
nnoremap <leader>mcd :!mvn clean deploy<CR>
nnoremap <leader>mct :!mvn clean test<CR>

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
let g:vbox.variables = {
    \ '%CLASS%' : 'f=TemplateInputClassVar()',
    \ '%METHOD%' : 'f=TemplateInputMethodVar()',
    \ '%CYCLE_VAR%' : 'f=TemplateInputCycleVarVar()',
    \ '%CYCLE_CONDITION%' : 'f=TemplateInputCycleCondVar()',
    \ '%IF_CONDITION%' : 'f=TemplateInputIfCondVar()',
    \ '%PACKAGE%' : 'f=TemplateInputPackageVar()'
    \ }
function! TemplateInputClassVar()
    return input('Enter class name:')
endfunction
function! TemplateInputPackageVar()
    return input('Enter package name:')
endfunction
function! TemplateInputMethodVar()
    return input('Enter method name:')
endfunction
function! TemplateInputCycleVarVar()
    return input('Enter cycle var:')
endfunction
function! TemplateInputCycleCondVar()
    return input('Enter cycle condition:')
endfunction
function! TemplateInputIfCondVar()
    return input('Enter if condition:')
endfunction

nnoremap <leader>it :VBTemplate<space>

" EasyAlign
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
