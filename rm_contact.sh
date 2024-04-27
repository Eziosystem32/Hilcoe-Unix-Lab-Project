#@author:Dawit Moges
#@date:2024-04-22
#version:0.7
#!/bin/bash
. ./UI_mods.sh
rm_conta
# Path to the contact file (CSV)
contact_file="contacts.csv"

# Array of group files (CSV)
group_files=("family.csv" "friends.csv" "Workplace.csv" "others.csv")

# Prompt the user for the contact details to delete
typeit "Enter the name of the contact to delete: " 
read contact_name

# Temporary file to store the updated contact list
temp_file="temp.csv"

# Remove contact from the contact file
grep -v "^$contact_name," "$contact_file" > "$temp_file"
mv "$temp_file" "$contact_file"

# Iterate through the group files and remove contact from each group
for group_file in "${group_files[@]}"; do
  temp_file="temp.csv"

  # Remove contact from the group file
  grep -v "^$contact_name," "$group_file" > "$temp_file"
  mv "$temp_file" "$group_file"
done

typeit "Contact deleted successfully from both the contact file and groups."

sleep 2
./assign_menu.sh