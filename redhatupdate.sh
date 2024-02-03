#!/bin/bash

# Check for updates (CentOS/Fedora)
if [[ -n $(command -v dnf) ]]; then
    sudo dnf check-update
elif [[ -n $(command -v yum) ]]; then
    sudo yum check-update
else
    echo "Unsupported package manager (neither dnf nor yum found)."
    exit 1
fi

# Prompt the user to proceed with updates
read -p "Updates are available. Do you want to proceed? (y/n): " response

if [ "$response" = "y" ] || [ "$response" = "Y" ]; then
    # Perform updates (CentOS/Fedora)
    if [[ -n $(command -v dnf) ]]; then
        sudo dnf upgrade -y
    elif [[ -n $(command -v yum) ]]; then
        sudo yum upgrade -y
    fi
    echo "Updates have been installed."
else
    echo "Update canceled."
fi
