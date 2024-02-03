#!/bin/bash

# Prompt for username and new password
read -p "Enter the username: " username
read -s -p "Enter the new password: " new_password

# Change the user's password
echo -e "$new_password\n$new_password" | sudo passwd $username --stdin

echo "Password has been changed successfully."
