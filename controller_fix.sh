#!/bin/bash

devices_file="proc/bus/input/devices"
config_dir="/opt/retropie/configs/all/retroarch/autoconfig/"

echo "Starting script..."

while read -r line; do
  # Extract the device name from the line if it contains "USB"
  if echo "$line" | grep -q "USB"; then
    device_name=$(echo "$line" | awk -F'"' '/Name/ {print $2}')
    if [[ "$device_name" =~ \ $ ]]; then
      echo "Processing device: $device_name"
      # Rename the config file to match the device name
      old_name=$(find "$config_dir" -type f -name "*.cfg" -iname "*${device_name% }*")
      if [[ -n "$old_name" ]]; then
        new_name=$(echo "$old_name" | sed "s/\(.*\)\.cfg/\1\ .cfg/")
        if [[ "$new_name" != "$old_name" ]]; then
          echo "Renaming file: $old_name to $new_name"
          mv "$old_name" "$new_name"
        else
          echo "Config file already renamed."
        fi
        # Replace the input_device string in the config file
        sed -i "s/input_device = \".*\"/input_device = \"$device_name\"/g" "$new_name"
      else
        echo "Config file not found for $device_name"
      fi
    else
      echo "Skipping device $device_name"
    fi
  fi
done < "$devices_file"

echo "Script finished."
