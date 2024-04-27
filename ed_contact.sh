#@author:Dawit Moges
#@date:2024-04-26
#version:0.8
#!/bin/bash
. ./UI_mods.sh
ed_cont
# Function to display text character by character
typeit() {
    local IFS=''
    while read -n1 c; do
        echo -n "$c"
        sleep 0.01
    done <<< "$@"
    echo
}

# Function to display an error message and exit
display_error() {
    echo "Error: $1"
    exit 1
}

# Function to edit a contact
edit_contact() {
    local edit_email=$1

    # Find the contact in the CSV file
    contact_line=$(grep -n "$edit_email" contacts.csv)

    if [ -z "$contact_line" ]; then
        typeit "Contact not found."
    else
        contact_num=$(echo "$contact_line" | cut -d ":" -f1)

        typeit "Enter the new details for the contact:"
        typeit "First name:"
        read new_fname
        typeit "Last name:"
        read new_lname
        typeit "Phone number:"
        read new_number

        # Edit contact in contacts.csv
        sed -i "${contact_num}s/[^,]*,[^,]*,[^,]*/$new_fname,$new_lname,$new_number/" contacts.csv || display_error "Failed to edit contact in contacts.csv"

        # Edit contact in group files
        for group_file in "${group_files[@]}"; do
            # Check if the contact exists in the group file
            if grep -q "$edit_email" "$group_file"; then
                sed -i "s/^.*$edit_email.*$/$new_fname,$new_lname,$new_number,$edit_email/" "$group_file" || display_error "Failed to edit contact in $group_file"
            fi
        done

        typeit "Contact edited successfully."
    fi
}

# Main script

# Define the CSV files
contacts_file="contacts.csv"
group_files=("family.csv" "friends.csv" "workplace.csv" "others.csv")

# Prompt the user for the current contact's email address
typeit "Enter the email address of the contact to edit:"
read edit_email

# Call the edit_contact function
edit_contact "$edit_email"

sleep 2

./assign_menu.sh