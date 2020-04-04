call plug#begin('~/.vim/plugged')
set rtp+=$GOROOT/misc/vim
exe "set rtp+=".globpath($GOPATH, "src/github.com/nsf/gocode/vim")

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-master branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Unmanaged plugin (manually installed and updated)
Plug '~/my-prototype-plugin'

" NERD Tree
Plug 'scrooloose/nerdtree'
" Initialize plugin system
call plug#end()

set tabstop=2
set shiftwidth=2
set number              " 行番号の表示
set ruler               " カーソル位置が右下に表示される
set wildmenu            " コマンドライン補完が強力になる
set showcmd             " コマンドを画面の最下部に表示する

nnoremap <silent><C-e> :NERDTreeToggle<CR>
set clipboard=unnamed,autoselect

augroup InsertHook
    autocmd!
    autocmd InsertEnter * hi Normal ctermbg=235 "挿入モード時の色
    autocmd InsertLeave * hi Normal ctermbg=0 "通常モード時の色
augroup END 

set ttimeoutlen=0

