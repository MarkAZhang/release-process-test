#!/bin/bash
cur_branch=$(git branch | grep \* | cut -d ' ' -f2)
git push origin $cur_branch

repository_url=$(git remote get-url origin | sed -e 's/git@//' -e 's/.git//' -e 's/:/\//')
branch=$(git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')

pr_url=https://$repository_url/compare/master...$branch

open $pr_url
