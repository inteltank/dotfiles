export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh
source ~/.bash_profile
source /usr/local/opt/powerlevel9k/powerlevel9k.zsh-theme

autoload -U compinit
compinit
zplug "zplug/zplug"

zplug "~/.zsh", from:local, use:"<->_*.zsh"

: "プラグイン" && {
  zplug "zsh-users/zsh-completions", lazy:true # 多くのコマンドに対応する入力補完 … https://github.com/zsh-users/zsh-completions
  zplug "mafredri/zsh-async", lazy:true # "sindresorhus/pure"が依存している
  zplug "zsh-users/zsh-syntax-highlighting", defer:2, lazy:true # fishシェル風のシンタクスハイライト … https://github.com/zsh-users/zsh-syntax-highlighting
  zplug "supercrabtree/k", lazy:true # git情報を含んだファイルリストを表示するコマンド … https://github.com/supercrabtree/k
  zplug "junegunn/fzf", as:command, use:bin/fzf-tmux # tmuxでfzfを使えるようにするプラグイン
  zplug "junegunn/fzf", use:shell/completion.zsh # cd **[TAB], vim **[TAB]などでファイル名を補完できる
  zplug "momo-lab/zsh-abbrev-alias" # 略語展開(iab)を設定するためのプラグイン … http://qiita.com/momo-lab/items/b1b1afee313e42ba687b
  zplug "paulirish/git-open", as:plugin, lazy:true # GitHub, GitLab, BitBucketを開けるようにするコマンド … https://github.com/paulirish/git-open
  zplug check || zplug install
  zplug load
}
setopt auto_pushd


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

function peco-src () {
  local selected_dir=$(ghq list -p | peco --query "$LBUFFER")
  if [ -n "$selected_dir" ]; then
    BUFFER="cd ${selected_dir}"
    zle accept-line
  fi
  zle clear-screen
}

zle -N peco-src
bindkey '^]' peco-src

alias ll='ls -l '

function peco-open () {
	open `find . | peco --initial-filter Migemo`
}
alias op=peco-open

function change-codecommit-credential(){
  local selected_dir=$(find ~ -maxdepth 1 |grep netrc | peco --query "$LBUFFER")
  if [ -n "$selected_dir" ]; then
	  cp ${selected_dir} ~/.netrc
	fi
	echo '-----------------------------'
	echo 'view current "~/.netrc" settings'
	echo '-----------------------------'
	sed -n 1,3p ~/.netrc
}
alias ccc='change-codecommit-credential'

function peco-cd-current (){
  cd `ls | peco --initial-filter Migemo`
}
alias cdc=peco-cd-current
alias ide="~/.tmux/ide.sh"

alias g="git"
alias vi="nvim"
alias vim="nvim"

alias tmux="tmux -2"

if [[ ! -n $TMUX ]]; then
  tmux new-session
fi
