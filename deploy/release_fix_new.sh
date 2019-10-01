#!/bin/bash

if ! git diff-index --quiet HEAD --; then
  echo "Your repo has unsaved changes. Aborting."
  exit 1
fi

echo "Updating staging to latest on origin/staging..."
git co staging
git fetch --all
# It should always be possible to fast-forward staging to origin/staging, because you shouldn't commit anything directly to staging.
git rebase origin/staging
echo "Creating a new release fix branch off of staging..."
git co -b $1
echo "Done!"
