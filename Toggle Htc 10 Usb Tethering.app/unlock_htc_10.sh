#!/bin/bash

# Description: Gets my phone into an unlocked and screen-turned-on state. 
# Intended to be used by other scripts to perform tasks from here on.

DEVICE_PASSWORD=$"1234" # '1234' is the password without the quotes
adb=$"/Users/apple/Library/Android/sdk/platform-tools/adb"

# var1 has output of command which checks if device is locked:
var1=$("$adb" shell service call trust 7 | grep 1)
# var2 has output of above command when device is locked:
var2=$"Result: Parcel(00000000 00000001   '........')"

# check if device is locked:
if [ "$var1" = "$var2" ]
then

    # var3 has output of command which checks if screen is on
    var3=$("$adb" shell dumpsys deviceidle | grep mScreenOn)
    # var4 has output of above command when screen is off    
    var4=$"  mScreenOn=false" # white space in this string matters

    # check if screen is off
    if [ "$var3" = "$var4" ]
    then
        # Pressing the power button to turn screen on
        "$adb" shell input keyevent "KEYCODE_POWER"
    fi

    # screen is ON now but is locked

    # swipe from coords (400,1400) to coords (400,300) in 150ms, to 
    # show lock input screen:
    "$adb" shell input touchscreen swipe 400 1400 400 300 100

    # input '1234' which is the password of the device
    "$adb" shell input text $DEVICE_PASSWORD
fi

# screen is unlocked and ON at this point
