#!/bin/bash

# Enables/disables all the modifications done by Karbiner-Elements app.
#
# Requirements:
#
# 1. A profile named 'karabiners_disabled' in Karabiner-Elements which 
# contains no modifications i.e. setting this profile means that no modifications
# have been applied i.e. 'Karabiner-Elements is disabled'.
#
# 2. kv-bash (link: https://github.com/damphat/kv-bash) to make persistent variables.

parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
cd "$parent_path"

source ./kv-bash.sh

karabiners_cli=$"/Library/Application Support/org.pqrs/Karabiner-Elements/bin/karabiner_cli"

current_karabiners_profile=$("$karabiners_cli" --show-current-profile-name)

if [ "karabiners_disabled" = "$current_karabiners_profile" ]
then
    "$karabiners_cli" --select-profile "$(kvget last_karabiners_profile)"
else
    kvset last_karabiners_profile "$current_karabiners_profile"
    "$karabiners_cli" --select-profile "karabiners_disabled"
fi