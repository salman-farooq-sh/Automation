#!/bin/bash

if pgrep -x BetterTouchTool; then
    osascript -e 'quit app "/Applications/BetterTouchTool.app"'
else
    open -a 'BetterTouchTool'
fi