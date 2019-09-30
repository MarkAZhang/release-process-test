if ! git diff-index --quiet HEAD --; then
  echo "Your repo has unsaved changes. Aborting."
  exit 1
fi

echo "Updating master to latest on origin/master..."
git co master
git fetch
git rebase
echo "Creating a new feature branch off of master..."
git co -b $1
echo "Done!"
