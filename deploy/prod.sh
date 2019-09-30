# Get the directory that this script is in.
echo "Deploying origin/staging to prod"
DIRECTORY=`dirname $0`
$DIRECTORY/core.sh staging prod --no-deploy
