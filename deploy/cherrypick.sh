#!/bin/bash

if ! git diff-index --quiet HEAD --; then
  echo "Your repo has unsaved changes. Try stashing them and trying again."
  exit 1
fi

source_branch=$1
dest_branch=$2

git co $source_branch
git fetch --all

# It should always be possible to fast-forward master, staging, or prod, because you shouldn't commit anything directly those branches. 
git rebase origin/$source_branch

echo "You are about to cherry-pick the following commit"
echo ""
git log -1
echo ""
echo "Is this correct? (Select 1 for Yes)"
select result in Yes No; do
  echo $result
  if [[ "$result" != "Yes" ]]; then exit 1; else break; fi
done

hash=$(git rev-parse --short HEAD)

git co $dest_branch
git rebase origin/$dest_branch

# Create a new branch for the cherry-pick.
DIRECTORY=`dirname $0`
$DIRECTORY/new.sh $dest_branch "cherrypick" "cherrypick-${hash}"

git cherry-pick $hash
