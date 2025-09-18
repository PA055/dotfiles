import React from 'react';
import { List, ActionPanel, Action, showToast, Icon, Toast } from '@vicinae/api';
import { exec } from "child_process"
import { promisify } from "util";

const execAsync = promisify(exec);

async function connectToDevice(device: OutputDevice) {
  try {
    if (device.bluetoothDevice) {
      await execAsync(`bluetoothctl connect ${device.macAddress!}`)
    }
    await execAsync(`sh -c 'pactl set-default-sink ${device.pipewireSink}'`)
  } catch (error) {
    await showToast(Toast.Style.Failure, `Failed to Connect to ${device.name}`)
    console.error(error);
  }
}

export default function SimpleList() {
  return (
    <List searchBarPlaceholder='Search fruits...'>
      <List.Section title={'Fruits'}>
        {devices.map((device) => (
          <List.Item
            key={device.name}
            title={device.name}
            icon={device.icon ?? "audio-volume-high-symbolic"}
            actions={
              <ActionPanel>
                <Action title='Connect' autoFocus={true} onAction={() => connectToDevice(device) }/>
              </ActionPanel>
            }
          />
        ))}
      </List.Section>
    </List>
  );
}

type OutputDevice = {
  name: string;
  icon?: string;
  bluetoothDevice: boolean;
  macAddress?: string;
  pipewireSink: string;
};

const devices: OutputDevice[] = [
  {
    name: "Speaker",
    bluetoothDevice: false,
    pipewireSink: "alsa_output.pci-0000_00_1f.3-platform-skl_hda_dsp_generic.HiFi__Speaker__sink",
  },
  {
    name: "JBL LIVE FREE 2 TWS",
    bluetoothDevice: true,
    macAddress: "F0:BE:25:A3:92:AB",
    pipewireSink: "bluez_output.F0_BE_25_A3_92_AB.1"
  },
  {
    name: "WH-CH720N",
    bluetoothDevice: true,
    macAddress: "40:72:18:BA:E8:C9",
    pipewireSink: "bluez_output.40_72_18_BA_E8_C9.1"
  }
];
