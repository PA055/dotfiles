#!/usr/bin/env bash

ignore_regex="Alder Lake PCH-P High Definition Audio Controller HDMI / DisplayPort \\\\d+ Output"

applications=$(pactl -f json list sink-inputs | jq 'map({ id: .index, name: .properties."application.name", sink: .sink })')
application_choice=$((echo "Reset All Applications"; echo "$applications" | jq -r '.[].name') | walker -d -p "Select Application")
[[ -z "$application_choice" ]] && exit 0

[[ "$application_choice" == "Reset All Applications" ]]   \
    && pactl list short sink-inputs | awk '{print $1}'   \
    | xargs -I{} pactl move-sink-input {} @DEFAULT_SINK@ \
    && exit 0

sink_info=$(pactl -f json list sinks | jq "map(select(.description | test(\"$ignore_regex\") | not) | { name: .description, id: .name })")
new_output_name=$(echo $sink_info | jq -r '.[].name' | walker -d -p "Select New Output")
[[ -z "$new_output_name" ]] && exit 0

new_output_id=$(echo "$sink_info" | jq -r "map(select(.name == \"$new_output_name\"))[0].id")
application_id=$(echo "$applications" | jq -r "map(select(.name == \"$application_choice\"))[0].id")
pactl move-sink-input $application_id $new_output_id
