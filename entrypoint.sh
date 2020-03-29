#!/bin/sh

set -eu

# -e will not execute next command if first command is false/error
# -u will give us a warnig every time we use undeclare variable

ls

yarn


#// file can find on /github/event/event.json

IFS="/" read owner repository <<< "$GIHUB_REPOSITORY"

echo $owner $repository

echo "::set-output name=url::http://github.com/razzkumar"

if [ $? -ne 0 ];then
  echo "::error::Failed to deployo"
  exit 1
fi

exit 0
