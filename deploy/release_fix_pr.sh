#!/bin/bash
DIRECTORY=`dirname $0`

# Pass arguments to pr.sh
$DIRECTORY/pr.sh staging ${@}
