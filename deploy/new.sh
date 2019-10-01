#!/bin/bash

if ! git diff-index --quiet HEAD --; then
  echo "Your repo has unsaved changes. Try stashing them."
  exit 1
fi

branch=$1
entity_name=$2
branch_name=$3

echo "Updating $branch to latest on origin/$branch..."
git co $branch
git fetch --all

# It should always be possible to fast-forward master, staging, or prod, because you shouldn't commit anything directly those branches. 
git rebase origin/$branch

prefix=

if [[ $entity_name == "release fix" ]]; then
  prefix="release-fix-"
fi
if [[ $entity_name == "hot fix" ]]; then
  prefix="hot-fix-"
fi

echo "Creating a new $entity_name branch off of ${branch}..."
git co -b $prefix$branch_name
echo "Done!"
