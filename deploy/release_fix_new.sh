#!/bin/bash
DIRECTORY=`dirname $0`

$DIRECTORY/new.sh staging "release fix" ${@}
