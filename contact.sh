#@author:Ahmed Abdulmaik
#@date:2024-04-20
#version:0.6

#!/bin/bash
. ./UI_mods.sh
#ui stuff
add_conta
#--------------------------------------
#reading and exporting block
typeit contact first name:
read fname 
typeit contact last name:
read lname
typeit contact phone number:
read number
typeit contact email address:
read email
echo $fname, $lname, $number, $email >> contacts.csv
typeit "Contact added!"
#--------------------------------------
#contact grouping
sleep 1
typeit "what catagorry is this contact?"
typeit "1. Family"
typeit "2. Friends"
typeit  "3. Workplace"
typeit "4. Others"
typeit "5.none"
read choice
#---------------------------------------
if [ $choice = 1 ]
then
echo $fname, $lname, $number, $email >> family.csv
elif [ $choice = 2 ]
then
echo  $fname, $lname, $number, $email >> friends.csv
elif [ $choice = 3 ]
then
echo $fname, $lname, $number, $email >> workplace.csv
elif [ $choice = 4 ]
then
echo $fname, $lname, $number, $email >> others.csv
elif [ $choice = 5 ]
then
typeit "okay fine... your loss"
else
typeit "what? that's not a valid option. you want me to send it to space or something??"
fi
#--------------------------------------
sleep 1
./assign_menu.sh