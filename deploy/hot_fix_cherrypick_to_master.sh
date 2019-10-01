#!/bin/bash

echo "Cherry-picking the latest commit on prod to master..."

DIRECTORY=`dirname $0`

$DIRECTORY/cherrypick.sh prod master
