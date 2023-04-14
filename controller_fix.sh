#!/bin/bash

# Step 1: Rename USB Gamepad.cfg to USB Gamepad .cfg. This adds the proper spacing to the name of gamepad.
if [ -f "/opt/retropie/configs/all/retroarch-joypads/USB Gamepad.cfg" ]; then
  mv "/opt/retropie/configs/all/retroarch-joypads/USB Gamepad.cfg" "/opt/retropie/configs/all/retroarch-joypads/USB Gamepad .cfg"
fi

# Step 2: Edit USB Gamepad .cfg and replace input_device value
if [ -f "/opt/retropie/configs/all/retroarch/autoconfig/USB Gamepad .cfg" ]; then
  sed -i 's/input_device = "USB Gamepad"/input_device = "USB Gamepad "/g' "/opt/retropie/configs/all/retroarch/autoconfig/USB Gamepad .cfg"
fi
