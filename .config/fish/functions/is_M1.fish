function is_M1
  if uname -m | grep --quiet "arm64" 2>&1 > /dev/null ;
    return 1
  end

  return 0
end
