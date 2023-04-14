# Patch to fix Retropie / Emulation Station gamepad & USB controller error.

## Description:
### Error msg: The error looks something like this "USB Gamepad 100/200 not configured" during game loading.
### Gamepad / controller works fine in menu but will throw an error during game loading and will not work in game at all.

After doing some research on google where others ran into the same issue, it sounds like the issue can arise in certain
linux distros with the way the  controller / gamepad hardware is recognized and named in the configuration files.
The gamepads name and config files must be updated to get the controllers to work, they contain spaces in the device name but not in the config files, thus not matching and causing the error during rom load.

**Summary:** The script updates the name of the gamepad controller to match and then adds the updated name to the config files.

- Before running script, first do a dry run with the controller and get it to fail to throw the error.
- Once that is done, you can run the script and let it make the changes for you.

I created this script because I had to make the changes to a bunch of PCs remotely and this simplified the whole process.

**NOTE**: This may only be an issue on certain USB gamepads and on certain linux distros.

## To use: 
- git clone https://github.com/zbinx/retropie-controller-config-error-fix
- sudo chmod +x controller_fix.sh
- sudo ./controller_fix.sh

