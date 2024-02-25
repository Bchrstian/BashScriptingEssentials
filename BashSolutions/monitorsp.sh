#!/bin/bash

# Email subject and content
subject="Root Partition Space Alert"
email_content="Attention: The root partition on your system has exceeded 20% usage.\n\nCurrent Disk Usage:"

# System administrator email
admin_email="example@gmail.com"

# Threshold for alert (percentage)
threshold=20

# Gmail account credentials
gmail_user="example@gmail.com"
gmail_password="YourPassword"  # Update this line with your generated app password

# Get current disk usage percentage for the root partition
current_usage=$(df -h / | awk 'NR==2 {print $5}' | cut -d'%' -f1)

# Always send email alert for testing purposes
# You may want to remove or adjust this condition in a production environment
if true; then
    # Send email alert
    echo -e "Subject: $subject\n\n$email_content $current_usage%" | msmtp --from="$admin_email" --host=smtp.gmail.com --port=587 --auth=on --tls=on --tls-starttls=on --user="$admin_email" --passwordeval="echo $gmail_password" "$admin_email"

    # Optionally, you can include an SMS alert here using your preferred method.
    # For example, you can use an SMS gateway service to send an SMS.

    echo "Test alert email sent to $admin_email. Current disk usage: $current_usage%"
else
    # Check if usage exceeds the threshold
    if [ "$current_usage" -gt "$threshold" ]; then
        # Send email alert
        echo -e "Subject: $subject\n\n$email_content $current_usage%" | msmtp --from="$admin_email" --host=smtp.gmail.com --port=587 --auth=on --tls=on --tls-starttls=on --user="$admin_email" --passwordeval="echo $gmail_password" "$admin_email"

        # Optionally, you can include an SMS alert here using your preferred method.
        # For example, you can use an SMS gateway service to send an SMS.

        echo "Alert email sent to $admin_email. Current disk usage: $current_usage%"
    else
        echo "Disk usage is below the threshold. No action required. Current disk usage: $current_usage%"
    fi
fi
