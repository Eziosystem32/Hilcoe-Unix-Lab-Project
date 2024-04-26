#@author:Ahmed Abdulmalik
#@date:2024-04-14
#version:0.5.1

#!/bin/bash
clear
#loading other scripts
. ./UI_mods.sh
. ./settings_framework.sh
#--------------------------------------------
#start of menu block
outtit
colo_cal
echo -e \ 
typeit "welcome to contact mannager" 
typeit =========================== 
typeit please choose from the option below 
typeit 1. Add contact 
typeit 2. remove contact 
typeit 3. edit contact 
typeit 4. search contacts 
typeit 5. veiw all contacts
typeit 6. Color options
typeit 7. exit 
typeit =========================== 
echo -n choice :
#----------------------------------------------end  of menu block
#start of choice logic block
read choice
if [ $choice = 1 ]
then
clear
./contact.sh
elif [ $choice = 2 ]
then
clear
./rm_contact.sh
elif [ $choice = 3 ]
then
clear
./ed_contact.sh
elif [ $choice = 4 ]
then
clear
./ser_contacts.sh
elif [ $choice = 5 ]
then
clear
./desp_contacts
elif [ $choice = 6 ]
then
clear
./option.sh
elif [ $choice = 7 ]
then
clear
./exit.sh
else 
clear
error
echo "invalid option/charater please choos from the least"
sleep 3
clear
./assign_menu.sh
fi 
#---------------------------------------------------end of choice logic block
exit