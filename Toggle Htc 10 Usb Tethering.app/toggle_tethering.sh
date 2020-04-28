#!/bin/bash

DEVICE_PASSWORD=$"1234" # '1234' is the password without the quotes
adb=$"/Users/apple/Library/Android/sdk/platform-tools/adb"

# var1 has output of command which checks if device is locked:
var1=$("$adb" shell service call trust 7 | grep 1)
# var2 has output of above command when device is locked:
var2=$"Result: Parcel(00000000 00000001   '........')"

# check if device is locked:
if [ "$var1" = "$var2" ]
then

	"$adb" shell input keyevent "KEYCODE_WAKEUP"

    # screen is ON now but is locked

    # swipe from coords (400,1400) to coords (400,300) in 150ms, to 
    # show lock input screen:
    "$adb" shell input touchscreen swipe 400 1400 400 300 150

    # input '1234' which is the password of the device
    "$adb" shell input text $DEVICE_PASSWORD
fi

# screen is unlocked and ON at this point

# open 'Tethering & portable hotspot' settings screen: 
"$adb" shell am start -n com.android.settings/.TetherSettings

# tap at coords (1000, 1400) i.e. the 'USB tethering' toggle:
"$adb" shell input tap 1000 1400





