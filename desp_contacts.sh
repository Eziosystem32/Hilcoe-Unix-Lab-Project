#@author:Caleb Wondimagegnehu
#@date:2024-04-29
#version:0.9


#!/bin/bash

../UI_mods.sh
desplay_cont
typeit " Which category would you like to see "
typeit =======================================
typeit "1. All contacts" 
typeit "2. Family contacts"
typeit "3. Friends contacts"
typeit "4. Work place contacts"
typeit "5. others"
typeit "6. exit"

read choice

if [ $choice = 1 ]
then 
	typeit "All contacts" 
	sed 's/,,/, ,/g;s/,,/, ,/g' all.csv | column -s, -t

elif [ $choice = 2 ]
then 
	typeit "Family contacts" 
	sed 's/,,/, ,/g;s/,,/, ,/g' family.csv | column -s, -t

elif [ $choice = 3 ]
then 
	typeit "Friends contacts" 
	sed 's/,,/, ,/g;s/,,/, ,/g' friends.csv | column -s, -t

elif [ $choice = 4 ]
then
        typeit "Work place contacts" 
		sed 's/,,/, ,/g;s/,,/, ,/g' workplace.csv | column -s, -t  
elif [ $choice = 5 ]
then
        typeit "others contacts" 
		sed 's/,,/, ,/g;s/,,/, ,/g' others.csv | column -s, -t


else 
	typeit "Sorry but thats not a valid choice pleas retry again"
	./desp_contacts.sh

fi

#return to main menu

typeit "do you wana get back to the main menu (Y/N) caps plz"

read choice

if [ $choice = Y ]
then

./assign_menu.sh

elif [ $choice = N ]
then

./desp_contacts.sh

else

typeit "alright "

typeit "I'll take that as a yes"

./assign_menu.sh
fi
