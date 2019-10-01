# Get the directory that this script is in.
echo "Deploying origin/master to staging"
DIRECTORY=`dirname $0`
$DIRECTORY/promote.sh master staging --no-deploy
