#!/bin/bash

if [[ $# != 1 ]]; then
  echo "Example usage: get_tag.sh master"
  exit 1
fi
promote_from_branch=$1

last_tag=$(git describe --tag --abbrev=0)

regex="v0\.(d+).*"

if [[ last_tag =~ $regex ]]; then
  version=${BASH_REMATCH[1]}
else
  version=0
fi

if [[ $1 == "master" ]]; then
  echo "v0.$(($version+1))-staging"
elif [[ $1 == "staging" ]]; then
  echo "v0.${version}-prod"
fi

