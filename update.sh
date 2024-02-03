#!/bin/bash

# Check for updates
sudo apt update

# Prompt the user to proceed with updates
read -p "Updates are available. Do you want to proceed? (y/n): " response

if [ "$response" = "y" ] || [ "$response" = "Y" ]; then
    # Perform updates
    sudo apt upgrade -y
    echo "Updates have been installed."
else
    echo "Update canceled."
fi
