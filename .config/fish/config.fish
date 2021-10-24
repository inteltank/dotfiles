# initilize for M1 or not M1
if uname -m | grep --quiet "arm64" 2>&1 > /dev/null ;
  eval (/opt/homebrew/bin/brew shellenv)
end



set fish_greeting ""

set -gx TERM xterm-256color

# theme
set -g theme_color_scheme terminal-dark
set -g fish_prompt_pwd_dir_length 1
set -g theme_display_user yes
set -g theme_hide_hostname no
set -g theme_hostname always
set -g GOPATH $HOME/src

# aliases
alias ls "ls -p -G"
alias la "ls -A"
alias ll "ls -l"
alias lla "ll -A"
alias g git
alias vi nvim
alias vim nvim
command -qv nvim && alias vim nvim
alias ghu "ghq list | ghq get --update --parallel"

alias ccc change-codecommit-credential
bind \c] peco-src 
set -gx EDITOR nvim

set -gx PATH bin $PATH
set -gx PATH ~/bin $PATH
set -gx PATH ~/.local/bin $PATH


# NodeJS
set -gx PATH node_modules/.bin $PATH

# Go
set -g GOPATH $HOME/src


switch (uname)
  case Darwin
    source (dirname (status --current-filename))/config-osx.fish
  case Linux
    # Do nothing
  case '*'
    source (dirname (status --current-filename))/config-windows.fish
end


set LOCAL_CONFIG (dirname (status --current-filename))/config-local.fish
if test -f $LOCAL_CONFIG
  source $LOCAL_CONFIG
end

# start shell with tmux

if test -z $TMUX && status --is-login
    attach_tmux_session_if_needed
end
