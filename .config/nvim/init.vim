autocmd!

scriptencoding utf-8
set encoding=utf-8
set fileencodings=utf-8,sjis,euc-jp,latin
" ---------------------------------------
" Dein Script
" ---------------------------------------
let s:cache_home = empty($XDG_CACHE_HOME) ? expand('~/.cache') : $XDG_CACHE_HOME
let s:dein_dir = s:cache_home . '/dein'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if !isdirectory(s:dein_repo_dir)
  call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
endif
let &runtimepath = s:dein_repo_dir .",". &runtimepath

let s:toml_file = fnamemodify(expand('<sfile>'), ':h').'/dein.toml'
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)
  call dein#load_toml(s:toml_file)
  call dein#end()
  call dein#save_state()
endif

if has('vim_starting') && dein#check_install()
  call dein#install()
endif

" ---------------------------------------
" Default
" ---------------------------------------

set number
syntax enable
set title
set autoindent
set background=dark
set nobackup
set showcmd
set cmdheight=1
set laststatus=2
set scrolloff=10
set expandtab
set shell=fish


" ---------------------------------------
" Color Scheme
" ---------------------------------------
set cursorline
"set cursorcolumn

" Set cursor line color on visual mode
highlight Visual cterm=NONE ctermbg=236 ctermfg=NONE guibg=Grey40

highlight LineNr       cterm=none ctermfg=240 guifg=#2b506e guibg=#000000

augroup BgHighlight
  autocmd!
  autocmd WinEnter * set cul
  autocmd WinLeave * set nocul
augroup END

if &term =~ "screen"
  autocmd BufEnter * if bufname("") !~ "^?[A-Za-z0-9?]*://" | silent! exe '!echo -n "\ek[`hostname`:`basename $PWD`/`basename %`]\e\\"' | endif
  autocmd VimLeave * silent!  exe '!echo -n "\ek[`hostname`:`basename $PWD`]\e\\"'
endif

let g:solarized_termtrans=1
let g:solarized_termcolors=256
colorscheme solarized


if !exists('*fugitive#statusline')
  set statusline=%F\ %m%r%h%w%y%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}[L%l/%L,C%03v]
  set statusline+=%=
  set statusline+=%{fugitive#statusline()}
endif

if $TERM == 'screen' 
  set t_Co=256
endif

" ---------------------------------------
" shortcut/alias/command
" ---------------------------------------

" Immediatery describe and reflect .vimrc that come to mind.
nnoremap <F5> :<C-u>edit ~/.config/nvim/init.vim<CR>
nnoremap <F6> :<C-u>source ~/.config/nvim/init.vim<CR>

" Because <ESC> is far away and <C-[> is also
" https://vim.fandom.com/wiki/Avoid_the_escape_key
inoremap <silent> jj <ESC>
