#!/bin/bash

# Close the side panel
./../sxhkd/scripts/panel_toggle.sh

# Waits and then suspends the system
sleep 1
systemctl suspend
