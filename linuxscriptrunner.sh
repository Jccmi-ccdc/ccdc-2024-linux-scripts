#!/bin/bash

run_program() {
    ./"$1"
}

display_menu_linux() {
    echo "1. Run iptables"
    echo "2. Make a user without a password"
    echo "3. Clear cron"
    echo "4. Change admin password"
    echo "5. Update"
    echo "6. Remove a user from sudo"
    echo "7. Update for fedora or centos"
    echo "8. Exit"
}

get_user_choice() {
    while true; do
        read -p "Enter your choice (1-8): " choice
        if [[ "$choice" =~ ^[1-8]$ ]]; then
            echo "$choice"  # Return the choice without using 'return'
            break
        else
            echo "Enter a number between 1 and 8."
        fi
    done
}

read -p "Enter 'l' for Linux: " os_type

if [ "$os_type" == "l" ]; then
    file_extension=".sh"
    display_menu_linux

    while true; do
        choice=$(get_user_choice)

        if [ "$choice" == "8" ]; then
            echo "Exiting program."
            break
        fi

        filename=""

        case "$choice" in
            1) filename="iptable.sh" ;;
            2) filename="addusr.sh" ;;
            3) filename="cron_task.sh" ;;
            4) filename="chgepass.sh" ;;
            5) filename="update.sh" ;;
            6) filename="deleteadmin.sh" ;;
            7) filename="redhatupdate.sh" ;;
            *) echo "Invalid selection. File does not exist." ;;
        esac

        if [ -n "$filename" ]; then
            run_program "$filename"
        fi
    done
else
    echo "Invalid input. This script is for Linux only."
fi
