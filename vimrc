if has('python3')
elseif has('python')
endif

" Vim
set nowrap
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
set cursorline
set cursorcolumn
set ttimeoutlen=5
let mapleader=","
noremap ; :!

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
Plug 'vim-scripts/nginx.vim', { 'for': 'nginx' }

""" editing
Plug 'scrooloose/nerdcommenter'
Plug 'raimondi/delimitmate'
Plug 'valloric/MatchTagAlways', { 'for': 'html' }
Plug 'Joorem/vim-haproxy'
Plug 'chrisbra/csv.vim', { 'for': 'csv' }
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'thecodesmith/vim-groovy', { 'for': 'groovy' }
Plug 'towolf/vim-helm', { 'for': ['yaml', 'yml'] }
Plug 'martinda/Jenkinsfile-vim-syntax', { 'for': 'Jenkinsfile' }
Plug 'ekalinin/Dockerfile.vim', { 'for': 'Dockerfile' }
Plug 'psycofdj/yaml-path', { 'for': 'yaml' }
Plug 'pedrohdz/vim-yaml-folds', { 'for': 'yaml' }
Plug 'google/vim-jsonnet', { 'for': 'jsonnet'}
Plug 'lepture/vim-jinja', { 'for': 'j2' }
Plug 'pedrohdz/vim-yaml-folds', { 'for': 'yaml' }
Plug 'hashivim/vim-terraform'

call plug#end()

" Golang specifics
autocmd Filetype go setlocal noet ts=4 sw=4 sts=4

" Java specifics
autocmd Filetype java setlocal noet ts=4 sw=4 sts=4

" Javascript specifics
autocmd Filetype javascript setlocal noet ts=2 sw=2 sts=2

" JSON specifics
autocmd Filetype json setlocal noet ts=2 sw=2 sts=2

" Python specifics
autocmd Filetype python let python_highlight_all=1

" XML specifics
autocmd Filetype xml setlocal noet ts=2 sw=2 sts=2

" YAML specifics
autocmd Filetype yaml setlocal noet ts=2 sw=2 sts=2
autocmd Filetype yaml nnoremap <leader>yl :w !yamllint -<cr>
autocmd Filetype yaml vnoremap <leader>yl :!yamllint -<cr>

" CSV specifics
autocmd Filetype csv nnoremap <leader>cac :%CSVArrangeColumn<cr>
autocmd Filetype csv nnoremap <leader>cuc :%CSVUnArrangeColumn<cr>

" ToDo specifics
autocmd Filetype todo syn match undone /.*\-\ \[\ \].*/
autocmd Filetype todo syn match done /.*\-\ \[x\].*/

autocmd Filetype todo hi link undone Error
autocmd Filetype todo hi link done Statement

"" appearance
syntax enable
set background=dark
"set background=light
let g:solarized_termcolors=256
colorscheme solarized


" Customize vim easily
nnoremap <leader>evf :tabnew $MYVIMRC<cr>
nnoremap <leader>evd :tabnew /home/wls/.vim<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Clipboard
vnoremap <leader>cp "+y<cr>
nnoremap <leader>cp :w !xclip -selection c<cr><cr>

" Execute
nnoremap <leader>ep :w !python3<cr>
vnoremap <leader>ep :!python3<cr>
nnoremap <leader>en :w !node<cr>
vnoremap <leader>en :!node<cr>
nnoremap <leader>eb :%!bash<cr>
vnoremap <leader>eb :!bash<cr>
vnoremap <leader>ec :!bash /home/wls/.vim/current_command.sh<cr>
nnoremap <leader>ec :%!bash /home/wls/.vim/current_command.sh<cr>
nnoremap <leader>sc :!cat /home/wls/.vim/current_command.sh<cr>
nnoremap <leader>ce :!bash /home/wls/.vim/switch_execute_command.sh<cr>
nnoremap <leader>ae :tabnew /home/wls/.vim/execute_commands.sh<cr>

" Work with data formats
nnoremap <leader>ej :%!jq
nnoremap <leader>ti :%!tidy -xml -i

" Navigation
nnoremap <leader>qq :q!<cr>
nnoremap <leader>ql :q<cr>
nnoremap <leader>fi :Files<cr>
nnoremap <leader>fp :Files
nnoremap <leader>ag :Ag<cr>
nnoremap <leader>cag :r !ag -l <c-r>"<cr>
nnoremap <leader>fu vey:tabnew<cr>:r !ag -l <c-r>"<cr>
vnoremap <leader>fu y:tabnew<cr>:r !ag -l <c-r>"<cr>
nnoremap <leader>taf :tabnew<cr>:Files<cr>
nnoremap <leader>tan :tabnew<cr>
nnoremap <leader>tae :tabnew<cr>:e
nnoremap <leader>tag :tabnew<cr>:Ag<cr>
nnoremap <leader>vl :vnew<cr>
nnoremap <leader>vr :vnew<cr><c-w>r
nnoremap <leader>ht :new<cr>
nnoremap <leader>hb :new<cr><c-w>r

" Current path
nnoremap <leader>lcf :lcd %:p:h<cr>
nnoremap <leader>gcf :cd %:p:h<cr>
nnoremap <leader>cap :let @+=expand("%:p")<cr>

" GPG
nnoremap <leader>enc :%!gpg -e --armor --trust-model always -r viktorvlasovsiberian@gmail.com<cr>
nnoremap <leader>dec :%!gpg -q<cr>
vnoremap <leader>enc :!gpg -e --armor --trust-model always -r viktorvlasovsiberian@gmail.com<cr>
vnoremap <leader>dec :!gpg -q<cr>

" Ansible Vault
nnoremap <leader>ave :%!ansible-vault encrypt_string --encrypt-vault-id default<cr>
nnoremap <leader>avd :%!ansible-vault decrypt<cr>
vnoremap <leader>ave :!ansible-vault encrypt_string --encrypt-vault-id default<cr>
vnoremap <leader>avd :!ansible-vault decrypt<cr>

" Encoding/Decoding
nnoremap <leader>enb :%!base64<cr>
nnoremap <leader>deb :%!base64 --decode<cr>
vnoremap <leader>enb :!base64<cr>
vnoremap <leader>deb :!base64 --decode<cr>

" Math
nnoremap <leader>bc :%!bc -l<cr>
vnoremap <leader>bc :!bc -l<cr>

" FileTypes
nnoremap <leader>ft :set ft=

" Other
nnoremap <leader>rw bvey:%s/<c-r>"/
nnoremap <leader>now :r !date --iso-8601=ns<cr>
nnoremap <leader>tw :set wrap!<cr>
nnoremap <leader>trn :set rnu!<cr>
nnoremap <leader>df :windo diffthis<cr>
nnoremap <leader>tra :tabnew<cr>:r !trans --no-ansi <c-r>"<cr>
nnoremap <leader>pdf :tabnew<cr>:r !lesspipe <c-r>"<cr>
nnoremap <leader>eis :set shellcmdflag=-ic<cr>
nnoremap <leader>dis :set shellcmdflag=-c<cr>
nnoremap <leader>ct F<vf>yf>pF<a/<Esc>F>a
nnoremap <leader>se /<c-r>"<cr>
nnoremap <leader>re :%s/<c-r>"/<c-r>"
nnoremap <leader>li :set list!<cr>
nnoremap <leader>gr :%!grep 
nnoremap <leader>tp :set paste!<cr>
nnoremap <leader>so :%!sort<cr>
nnoremap <leader>uq :%!uniq<cr>

" Kubernetes
nnoremap <leader>ka :%!kubectl apply -f -<cr>
vnoremap <leader>ka :!kubectl apply -f -<cr>
nnoremap <leader>kd :%!kubectl diff -f -<cr>:set ft=diff<cr>
vnoremap <leader>kd :!kubectl diff -f -<cr>:set ft=diff<cr>
nnoremap <leader>ksc :%!kubeseal --controller-name=sealed-secrets --controller-namespace=kube-system --scope cluster-wide --format=yaml -<cr>
nnoremap <leader>ksn :%!kubeseal --controller-name=sealed-secrets --controller-namespace=kube-system --format=yaml -<cr>

" Terraform
nnoremap <leader>tfp :tabnew<cr>:r !terraform plan -no-color<cr>
nnoremap <leader>tfa :tabnew<cr>:r !terraform apply -no-color -auto-approve<cr>
nnoremap <leader>tff :%!terraform fmt -<cr>

" VCS
nnoremap <leader>gc :BCommits<cr>
nnoremap <leader>cdf :tabnew<cr>:r !git diff HEAD<cr>:set ft=diff<cr>
nnoremap <leader>gbl :Git blame<cr>
nnoremap <leader>gld :tabnew<cr>igit log --pretty=format:'%h - %an - %ae - %aI - %s' --max-count=100<Esc>
nnoremap <leader>gls :tabnew<cr>igit log --pretty=format:'%h - %aI - %s' --max-count=100<Esc>
nnoremap <leader>gsd ^vey:tabnew<cr>pIgit show <Esc>:%!bash<cr>:set ft=diff<cr>
vnoremap <leader>gsd y:tabnew<cr>pIgit show <Esc>:%!bash<cr>:set ft=diff<cr>
nnoremap <leader>dg :diffget<cr>
nnoremap <leader>dp :diffput<cr>

" Wireguard
nnoremap <leader>wgk :r !wg genkey<cr>
vnoremap <leader>wgp :!wg pubkey<cr>

" NERDTree
noremap <C-n> :NERDTreeToggle<CR>
let NERDTreeChDirMode=2
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
       \             [ 'fugitive', 'readonly', 'modified' ] ],
       \   'right': [ [ 'lineinfo' ],
       \              [ 'percent' ],
       \              [ 'fileformat', 'fileencoding', 'filetype' ] ],
       \ },
       \ 'component': {
       \   'readonly': '%{&filetype=="help"?"READONLY":&readonly?"READONLY":""}',
       \   'modified': '%{&filetype=="help"?"":&modified?"MODIFIED":&modifiable?"":"-"}',
       \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():"NON VERSIONED"}',
       \ },
       \ 'component_visible_condition': {
       \   'readonly': '(&filetype!="help"&& &readonly)',
       \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
       \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())',
       \ },
       \ 'separator': { 'left': '', 'right': '' },
       \ 'subseparator': { 'left': '', 'right': '' }
       \ }

" CSV
let b:csv_arrange_align = 'l*'
