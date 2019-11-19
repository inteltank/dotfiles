autoload -Uz colors; colors
export PATH=~/bin:$PATH
export PATH=$PATH:/usr/local/go/bin


has() {
  type "$(1:?too few arguments)" &>/dev/null
}

#reload resets Completion function
reload(){
  local f
  f=(~/.zsh/Completion/*(.))
  unfunction $f:t 2>/dev/null
  autoload -U $f:t
}

# is_login_shell returns true if current shell is first shell
is_login_shell(){
  [[ $SHLVL == 1 ]]
}

#is_git_repo returns true if cwd is in git repository
is_git_repo(){
    git rev-parse --is-inside-work-tree &>/dev/null
    return $status
}
