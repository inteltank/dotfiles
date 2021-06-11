function peco-src
  set selected_dir (ghq list -p | peco --query "$LBUFFER")
  if [ -n $selected_dir ];
    cd $selected_dir
  end
end
