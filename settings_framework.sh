#@author:Ahmed Abdulmalik
#@date:2024-04-14
#version:0.1

#!/bin/bash
colo_cal(){
while IFS=',' read -r speed color
do
    if  [ $color = 1 ]
    then
tput setaf 1
elif [ $color = 2 ]
then
tput setaf 2
elif [ $color = 3 ]
then
tput setaf 3
elif [ $color = 4 ]
then
tput setaf 4
elif [ $color = 5 ]
then
tput setaf 5
elif [ $color = 6 ]
then
tput setaf 6
elif [ $color = 7 ] 
then
tput setaf 7
fi
done < settings.csv
}

