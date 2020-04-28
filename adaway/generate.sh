#!/bin/bash

mydir="$(dirname "$(realpath "$0")")"

hosts_dir="$mydir/.hosts/"
hosts_out="$mydir/../prebuilt/common/etc/hosts.aicp_adblock"

download_hosts() {
    url="$1"
    outfile="$2"
    wget "$url" -O "$outfile"
}


rm "$hosts_dir"/*

i=0

while read l; do
    ((i++))
    download_hosts "$l" "$hosts_dir/hosts$i.txt"
done < "$mydir/sources.txt"

python3 "$mydir/generate.py" "$mydir" "$hosts_out" "$hosts_dir"/*
