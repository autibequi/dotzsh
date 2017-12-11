gbf() {
  branch=$(git branch -a | fzy | sed -E 's/\*? +//g' | sed -E 's/remotes\/origin\///g')
  if [ "$branch" != "" ]
  then
    git checkout $branch
  fi
}
