#!/bin/bash

remove_from_sudo() {
    sudo deluser "$1" sudo
}

read -p "Enter the username to remove from sudo: " username

remove_from_sudo "$username"
echo "The user '$username' has been removed from the sudo group."
