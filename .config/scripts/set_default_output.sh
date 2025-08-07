#!/usr/bin/env bash

ignore_regex="Alder Lake PCH-P High Definition Audio Controller HDMI / DisplayPort \\\\d+ Output"
sink_info=$(pactl -f json list sinks | jq "map(select(.description | test(\"$ignore_regex\") | not) | { name: .description, id: .name })")

new_default_name=$(echo "$sink_info" | jq -r '.[].name' | walker -d -p "Select New Default Output")
[[ -z "$new_default_name" ]] && exit 0

new_default=$(echo "$sink_info" | jq -r "map(select(.name == \"$new_default_name\"))[0].id")
pactl set-default-sink "$new_default"
