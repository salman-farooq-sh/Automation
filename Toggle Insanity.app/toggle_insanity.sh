#!/bin/bash

# import kv-bash (link: https://github.com/damphat/kv-bash) to make persistent variables.
source "$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )/kv-bash.sh"

karabiners_cli=$"/Library/Application Support/org.pqrs/Karabiner-Elements/bin/karabiner_cli"

if [ "$(kvget insanity_enabled)" = "true" ]
then
	osascript -e 'quit app "/Applications/BetterTouchTool.app"'
	"$karabiners_cli" --select-profile "karabiners_disabled"
	kvset insanity_enabled false
else
	open -a 'BetterTouchTool'
	"$karabiners_cli" --select-profile "karabiners_enabled"
	kvset insanity_enabled true
fi