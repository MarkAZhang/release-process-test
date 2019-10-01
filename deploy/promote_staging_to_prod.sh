# Get the directory that this script is in.
echo "Deploying origin/staging to prod"
DIRECTORY=`dirname $0`
$DIRECTORY/promote.sh staging prod --no-deploy
