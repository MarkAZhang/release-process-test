echo "Creating a release bug-fix branch off of origin/staging"
git co staging
git co -b $1
