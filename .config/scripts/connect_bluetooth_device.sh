#!/usr/bin/env bash

# options=$(echo "Speaker";bluetoothctl devices | grep -P '^Device' | awk '{ print $3 }')
choice=$(echo -e "Speaker\nJBL LIVE FREE 2 TWS\nWH-CH720N" | dmenu -p "Speaker to Connect")

case $choice in
    "Speaker")
        pactl set-default-sink 'alsa_output.pci-0000_00_1f.3-platform-skl_hda_dsp_generic.HiFi__Speaker__sink';;
    "JBL LIVE FREE 2 TWS")
        bluetoothctl connect 'F0:BE:25:A3:92:AB' \
        || (notify-send "Failed to Connect" \
                        "Connection to JBL LIVE FREE 2 TWS timed out." \
                        -i bluetooth-active-symbolic; \
            exit 1) && sleep 1 \
        && pactl set-default-sink 'bluez_output.F0_BE_25_A3_92_AB.1';;
    "WH-CH720N")
        bluetoothctl connect '40:72:18:BA:E8:C9' \
        || (notify-send "Failed to Connect" \
                        "Connection to WH-CH720N timed out." \
                        -i bluetooth-active-symbolic; \
            exit 1) && sleep 1 \
        && pactl set-default-sink 'bluez_output.40_72_18_BA_E8_C9.1';;
esac
