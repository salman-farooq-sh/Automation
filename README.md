Some apps have been made through `Script Editor.app` and others through `Automator.app`, both of these come preinstalled with macOS. 

## How to differentiate between them?
Apps made through Automator have the Automator icon.  
Apps with the other icon have been made through the Script Editor.

## How to make changes to these `.app` files?

1. For an Automator app, launch `Automator.app` and for a Script Editor app, launch `Script Editor.app`.
1. Press `⌘ + O` to show the open dialog.
1. Select the app you want to edit.

## A brief description of all the apps:

+ `New Text Document.app`: Creates a file named `untitled` in the current finder window.

+ `Restart WiFi.app`: For the flaky WiFi I have which starts working if you restart it.

+ `Say Text.app`: So that I can improve my pronunciation.

+ `Toggle Htc 10 Usb Tethering.app`: Toggles USB Tethering on my phone without needing to leave the keyboard. Very hardcoded solution.
  + Runtime dependency: [adb](https://developer.android.com/studio/command-line/adb)

+ `Toggle Insanity.app`: A quick toggle for all the custom key remappings I have done so that my laptop can be usable for people besides me.

+ `Toggle Dark Mode.app`: A global switch for toggling dark mode on everything. Currently affecting:  
  + macOS dark mode  
  + Sublime Text theme
  + VS Code to be added
  + More apps to be added  

+ `Connect/Disconnect Headphones.app`: Connect and disconnect paired bluetooth headphones.
  + Runtime dependency: [blueutil](https://github.com/toy/blueutil)

+ `Zip Selected.app`: Make an archive from selected/highlighted files and folders in Finder.

+ `Move To Applications.app`: Makes moving newly installed applications to the `/Applications` folder faster.
