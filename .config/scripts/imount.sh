#!/usr/bin/env bash

if [ ! -d "$1" ]; then
    printf "\x1b[1;34;31mMountpoint is not a directory."
    exit 1
fi

documents=$(ifuse --list-apps | tail -n +2 | jq -R 'split(",") | [.[0][1:-1], .[2][1:-1]] | {id: .[0], name: .[1]}' | jq -s '.')
choice=$((echo "Main Files"; echo "$documents" | jq -r '.[].name') | fzf)

[ -z "$choice" ] && exit 0
if [[ "$choice" == "Main Files" ]]; then
    ifuse $1
    exit 0
fi

appid=$(echo "$documents" | jq -r "map(select(.name == \"$choice\"))[0].id")
ifuse --documents $appid $1
