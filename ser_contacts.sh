#@author:Eyosias Simon
#@date:2024-04-17
#version:0.6
#!/bin/bash
#loading other scripts
. ./UI_mods.sh
#-----------------------------------------------------------------------------

#clipart
ser_cont
#------------------------------------------------------------------------------
#main search block
    typeit "Enter the search term (first name, last name, phone number, or email): "
    read search_term

# Search the contacts.csv file
    grep -i "$search_term" contacts.csv | while read line; do
        IFS=',' read -ra contact_info <<< "$line"
        fname="${contact_info[0]}"
        lname="${contact_info[1]}"
        phone="${contact_info[2]}"
        email="${contact_info[3]}"
        typeit "First Name: $fname"
        typeit "Last Name: $lname"
        typeit "Phone: $phone"
        typeit "Email: $email"
        typeit "---"
    done

# Search the specific files
    for category in family friends Workplace others; do
        if grep -i "$search_term" "$category".csv &> /dev/null; then
            typeit "Contacts in the $category category:"
            grep -i "$search_term" "$category".csv | while read line; do
                IFS=',' read -ra contact_info <<< "$line"
                fname="${contact_info[0]}"
                lname="${contact_info[1]}"
                phone="${contact_info[2]}"
                email="${contact_info[3]}"
                typeit "First Name: $fname"
                typeit "Last Name: $lname"
                typeit "Phone: $phone"
                typeit "Email: $email"
                typeit "---"
            done
        fi
    done
#----------------------------------------------------------------
#return to main menu
typeit "do you wana get back to the main menu (Y/N) caps plz"
read choice
if [ $choice = Y ]
then
./assign_menu.sh
elif [ $choice = N ]
then
./ser_contacts.sh
else
typeit "alright "
typeit "I'll take that as a yes"
./assign_menu.sh
fi
#------------------------------------------------------------------
