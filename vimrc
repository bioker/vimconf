if has('python3')
elseif has('python')
endif

" Vim
set nocompatible
set nu
set linebreak
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
set cursorline
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
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'jlanzarotta/bufexplorer'

""" git
Plug 'tpope/vim-fugitive'
Plug 'christoomey/vim-conflicted'

""" status info
Plug 'itchyny/lightline.vim'
Plug 'airblade/vim-gitgutter'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'kshenoy/vim-signature'

""" appearance
Plug 'altercation/vim-colors-solarized'
Plug 'vim-python/python-syntax', { 'for': 'python' }

""" editing
Plug 'scrooloose/nerdcommenter'
Plug 'raimondi/delimitmate'
Plug 'valloric/MatchTagAlways'
Plug 'vim-syntastic/syntastic'
Plug 'chrisbra/csv.vim', { 'for': 'csv' }
Plug 'davidhalter/jedi-vim', { 'for': 'python' }
Plug 'ternjs/tern_for_vim', { 'for': 'javascript' }
Plug 'thecodesmith/vim-groovy', { 'for': 'groovy' }
Plug 'towolf/vim-helm', { 'for': ['yaml', 'yml'] }
Plug 'martinda/Jenkinsfile-vim-syntax', { 'for': 'Jenkinsfile' }
Plug 'ekalinin/Dockerfile.vim', { 'for': 'Dockerfile' }
Plug 'psycofdj/yaml-path', { 'for': 'yaml' }
Plug 'pedrohdz/vim-yaml-folds', { 'for': 'yaml' }
Plug 'google/vim-jsonnet', { 'for': 'jsonnet'}
Plug 'lepture/vim-jinja', { 'for': 'j2' }

call plug#end()

"" appearance
syntax enable
set background=dark
let g:solarized_termcolors=256
colorscheme solarized
let g:python_highlight_all = 1
" Transparent background
hi Normal guibg=NONE ctermbg=NONE
hi SignColumn guibg=NONE ctermbg=NONE

noremap ; :!
nnoremap <leader>evf :tabnew $MYVIMRC<cr>
nnoremap <leader>evd :tabnew /home/wls/.vim<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>cap :let @+=expand("%:p")<cr>
vnoremap <leader>cp "+y<cr>
nnoremap <leader>cp :w !xclip -selection c<cr><cr>
nnoremap <leader>ep :w !python3<cr>
vnoremap <leader>ep :!python3<cr>
nnoremap <leader>eb :%!bash<cr>
vnoremap <leader>eb :!bash<cr>
vnoremap <leader>ec :!bash /home/wls/.vim/current_command.sh<cr>
nnoremap <leader>ec :%!bash /home/wls/.vim/current_command.sh<cr>
nnoremap <leader>sc :!cat /home/wls/.vim/current_command.sh<cr>
nnoremap <leader>ce :!bash /home/wls/.vim/switch_execute_command.sh<cr>
nnoremap <leader>ae :tabnew /home/wls/.vim/execute_commands.sh<cr>
nnoremap <leader>ej :%!jq
nnoremap <leader>ti :%!tidy -xml -i
nnoremap <leader>jty :%!json2yaml<cr>
nnoremap <leader>tp :set paste!<cr>
nnoremap <leader>fi :Files<cr>
nnoremap <leader>fp :Files
nnoremap <leader>taf :tabnew<cr>:Files<cr>
nnoremap <leader>tan :tabnew<cr>
nnoremap <leader>tae :tabnew<cr>:e
nnoremap <leader>lcf :lcd %:p:h<cr>
nnoremap <leader>gcf :cd %:p:h<cr>

nnoremap <leader>enc :%!gpg -e --armor --trust-model always -r viktorvlasovsiberian@gmail.com<cr>
nnoremap <leader>dec :%!gpg -q<cr>
vnoremap <leader>enc :!gpg -e --armor --trust-model always -r viktorvlasovsiberian@gmail.com<cr>
vnoremap <leader>dec :!gpg -q<cr>

nnoremap <leader>enb :%!base64<cr>
nnoremap <leader>deb :%!base64 --decode<cr>
vnoremap <leader>enb :!base64<cr>
vnoremap <leader>deb :!base64 --decode<cr>

nnoremap <leader>has :%!sha256sum<cr>
vnoremap <leader>has :!sha256sum<cr>

nnoremap <leader>cft :%!openssl x509 -text -noout<cr>

nnoremap <leader>syc :SyntasticCheck<cr>
nnoremap <leader>syr :SyntasticReset<cr>
nnoremap <leader>rw bvey:%s/<c-r>"/
nnoremap <leader>now :r !date --iso-8601=seconds<cr>
nnoremap <leader>bc :%!bc -l<cr>
vnoremap <leader>bc :!bc -l<cr>
nnoremap <leader>ftq :set ft=sql<cr>
nnoremap <leader>ftj :set ft=json<cr>
nnoremap <leader>ftp :set ft=python<cr>
nnoremap <leader>fts :set ft=sh<cr>
nnoremap <leader>fty :set ft=yaml<cr>
nnoremap <leader>ftc :set ft=csv<cr>
nnoremap <leader>ftx :set ft=xml<cr>
nnoremap <leader>ftji :set ft=jinja<cr>
nnoremap <leader>qq :q!<cr>
nnoremap <leader>ql :q<cr>
nnoremap <leader>vl :vnew<cr>
nnoremap <leader>vr :vnew<cr><c-w>r
nnoremap <leader>ht :new<cr>
nnoremap <leader>hb :new<cr><c-w>r
nnoremap <leader>agr :r !ag <c-r>"<cr>
nnoremap <leader>ag :r !ag
nnoremap <leader>yap :Yamlpath<cr>
nnoremap <leader>tw :set wrap!<cr>
nnoremap <leader>trn :set rnu!<cr>
nnoremap <leader>df :windo diffthis<cr>
vnoremap <leader>ak :!kubectl apply -f -<cr>
nnoremap <leader>ak :%!kubectl apply -f -<cr>
nnoremap <leader>dk :%!kubectl diff -f -<cr>:set ft=diff<cr>
nnoremap <leader>fa zM
nnoremap <leader>ufa zR
nnoremap <leader>cdf :tabnew<cr>:r !git diff HEAD<cr>:set ft=diff<cr>
nnoremap <leader>gbl :Gblame<cr>
nnoremap <leader>tra :tabnew<cr>:r !trans --no-ansi <c-r>"<cr>
nnoremap <leader>pdf :tabnew<cr>:r !lesspipe <c-r>"<cr>

nnoremap <leader>dg :diffget<cr>
nnoremap <leader>dp :diffput<cr>

nnoremap <leader>gld :tabnew<cr>igit log --pretty=format:'%h - %an - %ae - %aI - %s' --max-count=100<Esc>
nnoremap <leader>gls :tabnew<cr>igit log --pretty=format:'%h - %aI - %s' --max-count=100<Esc>
vnoremap <leader>gsd y:tabnew<cr>pIgit show <Esc>:set ft=diff<cr>

iabbrev jdb -Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=n,address=*:9090
iabbrev jjmx -Dcom.sun.management.jmxremote
            \ -Dcom.sun.management.jmxremote.port=9010
            \ -Dcom.sun.management.jmxremote.rmi.port=9010
            \ -Dcom.sun.management.jmxremote.authenticate=false
            \ -Dcom.sun.management.jmxremote.ssl=false
            \ -Dcom.sun.management.jmxremote.local.only=false
            \ -Djava.rmi.server.hostname=localhost
iabbrev aplf apply from: "${project.rootDir}/gradle/config/

iabbrev kdev kubectl -n develop
iabbrev ktest kubectl -n test
iabbrev kbl kubectl
iabbrev hlm helm template -f helm/values.${values}.yaml --namespace ${namespace} --version ${version} helm
iabbrev hlm2 helm2 template -f helm/values.${values}.yaml --namespace ${namespace} --set-string version=${version} helm
iabbrev hlmvars values=qa<cr>namespace=develop<cr>version=develop

" NERDTree
noremap <C-n> :NERDTreeToggle<CR>
let NERDTreeChDirMode=2

"" NERDTree Git
let g:NERDTreeGitStatusIndicatorMapCustom = {
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
let g:NERDTreeGitStatusShowIgnored = 1

" LightLine
let g:lightline = {
       \ 'colorscheme': 'wombat',
       \ 'active': {
       \   'left': [ [ 'mode', 'paste' ],
       \             [ 'fugitive', 'readonly', 'absolutepath', 'modified' ] ],
       \   'right': [ [ 'lineinfo' ],
       \              [ 'percent' ],
       \              [ 'syntastic', 'fileformat', 'fileencoding', 'filetype' ] ],
       \ },
       \ 'component': {
       \   'readonly': '%{&filetype=="help"?"READONLY":&readonly?"READONLY":""}',
       \   'modified': '%{&filetype=="help"?"":&modified?"MODIFIED":&modifiable?"":"-"}',
       \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():"NON VERSIONED"}',
       \   'syntastic': '%{SyntasticStatuslineFlag()}',
       \ },
       \ 'component_visible_condition': {
       \   'readonly': '(&filetype!="help"&& &readonly)',
       \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
       \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())',
       \   'syntastic': '(&SyntasticStatuslineFlag)'
       \ },
       \ 'separator': { 'left': '', 'right': '' },
       \ 'subseparator': { 'left': '', 'right': '' }
       \ }

" Jedi
let g:jedi#use_tabs_not_buffers = 1
let g:jedi#popup_on_dot = 0

" Syntastic
let g:syntastic_python_checkers = ['pylint']
