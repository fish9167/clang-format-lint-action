#!/bin/sh -l

cd "$GITHUB_WORKSPACE"

/run-clang-format.py "$@"

STATUS_ARGS=0
PATHSPEC=$2

function check() {
  if ! git diff --quiet;
  then
    echo "0"
  else
    echo "1"
  fi
}

echo ::set-output name=changed::$(check)
