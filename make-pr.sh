#!/bin/bash

if [[ ! $1 ]];then
  echo "Missing PR info"
  exit 1
fi


addAndCommit () {
  echo "This is test commit $1" >> test.txt
  git add .
  git commit -m "Upate to check PR"

  branchNanme="PR-$1"
  git checkout -b $branchNanme
  git push origin $branchNanme
  hub pull-request --copy -m "This is $branchNanme"
}

addAndCommit "$1"
