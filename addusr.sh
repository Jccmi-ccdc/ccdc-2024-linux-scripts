#!/bin/bash

create_user() {
    sudo useradd "$1"
}

read -p "Enter the username for the new user: " username
create_user "$username"
echo "User '$username' has been created."