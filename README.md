# Patch to fix Retropie / Emulation Station gamepad error.

## Description:
### Error msg: "USB Gamepad 100/200 not configured" during game loading.
### Gamepad / controller works fine in menu but will throw an error during game loading and will not work in game at all.

After doing some research on google where others ran into the same issue, it sounds like the issue can arise in certain
linux distros with the way the  controller / gamepad hardware is recognized and named in the configuration files.
The gamepads name and config files must be updated to get the controllers to work.

**Summary:** The script updates the name of the gamepad controller to match and then adds the updated name to the config files.

- Before running script, first do a dry run with the controller and get it to fail to throw the error.
- Once that is done, you can run the script and let it make the changes for you.

