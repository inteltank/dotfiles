function change-codecommit-credential
  set selected_dir (find $HOME -maxdepth 1 | grep netrc_ | peco --query "$LBUFFER")
  if [ -n $selected_dir ]
    echo $selected_dir
    cp $selected_dir  ~/.netrc
  end
  echo '------------------------'
  echo 'view current "~/.netrc" settings'
  echo '------------------------'
  sed -n 1,3p ~/.netrc
end
