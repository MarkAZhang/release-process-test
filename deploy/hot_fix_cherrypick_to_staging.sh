#!/bin/bash

echo "Cherry-picking the latest commit on prod to staging..."

DIRECTORY=`dirname $0`

$DIRECTORY/cherrypick.sh prod staging
