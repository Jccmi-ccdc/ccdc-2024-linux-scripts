#!/bin/bash

# Get a list of all user accounts
users=$(cut -d: -f1 /etc/passwd)

# Iterate through the user accounts and clear their cron tasks
for user in $users; do
    sudo -u $user crontab -r
done

echo "Cron tasks cleared for all users."
