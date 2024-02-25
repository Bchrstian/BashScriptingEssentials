
#!/bin/bash

# Array of usernames
usernames=("User1" "User2" "User3" "User4" "User5" "User6" "User7" "User8" "User9" "User10")

# Set a common initial password for all users
initial_password="Linux2024"

# Loop through the usernames array and create users
for username in "${usernames[@]}"; do
    # Create user with initial password
    sudo useradd -m -p $(openssl passwd -1 $initial_password) $username

    # Set password expiration
    sudo chage -d 0 $username  # Force password change on first login

    # Set account expiration to December 14th, 2024
    sudo chage -E $(date -d '2024-12-14' +%Y-%m-%d) $username
done

echo "User creation script completed."
