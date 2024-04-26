#@author:Ahmed Abdulmalik
#@date:2024-04-14
#version:0.5.1

#!/bin/bash
. ./UI_mods.sh
. ./settings_framework.sh
loading_icon 2 "calibrating settings..."
typeit "animation loaded"
sleep 1
colo_cal
typeit "color loaded"
sleep 1
typeit "done"
sleep 1

./assign_menu.sh
