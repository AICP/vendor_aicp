#!/bin/bash

set -e

mydir="$(dirname "$(realpath "$0")")"

hosts_out="$1"

hosts_in_repo="$mydir/../../../external/hosts"
hosts_in="$hosts_in_repo/hosts"

pushd "$hosts_in_repo" > /dev/null

hosts_revision=`(git config --get remote.github.url ; git rev-parse HEAD) | xargs`

popd > /dev/null

python3 "$mydir/generate.py" "$hosts_revision" "$hosts_out" "$hosts_in"
