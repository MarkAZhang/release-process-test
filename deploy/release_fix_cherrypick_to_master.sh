#!/bin/bash

echo "Cherry-picking the latest commit on staging to master..."

DIRECTORY=`dirname $0`

$DIRECTORY/cherrypick.sh staging master
