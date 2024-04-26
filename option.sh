#@author:Ahmed Abdulmalik
#@date:2024-04-21
#version:0.6
#!/bin/bash
. ./UI_mods.sh
col_sett

typeit "Color Options"
typeit "========================="
typeit "       $(tput setaf 7)1.red       $(tput setaf 1)COLOR_RED"
typeit "       $(tput setaf 7)2.green     $(tput setaf 2)COLOR_GREEN"
typeit "       $(tput setaf 7)3.yellow    $(tput setaf 3)COLOR_YELLOW"
typeit "       $(tput setaf 7)4.blue      $(tput setaf 4)COLOR_BLUE"
typeit "       $(tput setaf 7)5.magenta   $(tput setaf 5)COLOR_MAGENTA"
typeit "       $(tput setaf 7)6.cyan      $(tput setaf 6)COLOR_CYAN"
typeit "       $(tput setaf 7)7.white     $(tput setaf 7)COLOR_WHITE"
typeit "Choose a number"
read color
    if  [ "$color" = "1" ]; then
        tput setaf 1
    elif [ "$color" = "2" ]; then
        tput setaf 2
    elif [ "$color" = "3" ]; then
        tput setaf 3
    elif [ "$color" = "4" ]; then
        tput setaf 4
    elif [ "$color" = "5" ]; then
        tput setaf 5
    elif [ "$color" = "6" ]; then
        tput setaf 6
    elif [ "$color" = "7" ]; then
    tput setaf 7
    #else 
        #error
    fi
export IFS=","
echo $speed, $color > settings.csv
sleep 1
typeit Settings saved
sleep 1
./assign_menu.sh