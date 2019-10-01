#!/bin/bash

echo "Pushing changes to remote repo..."
cur_branch=$(git branch | grep \* | cut -d ' ' -f2)

FORCE=

if [[ $2 == "--force" ]]; then
  FORCE="--force"
fi

git push $FORCE origin $cur_branch

if [ $? -ne 0 ]
then
  echo "There was an error pushing your changes to Github."
  exit 1;
fi

repository_url=$(git remote get-url origin | sed -e 's/git@//' -e 's/.git//' -e 's/:/\//')
branch=$(git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')

pr_url=https://$repository_url/compare/$1...$branch

echo "Opening PR Github url..."
open $pr_url
