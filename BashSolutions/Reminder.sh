#!/bin/bash

# Email subject and content
subject="Reminder"
content="Dear user, please remember to do your assignment in order to develop skills."

# Email recipients
recipients=("user1@example.com" "user2@example.com" "user3@example.com" "user4@example.com" "user5@example.com" "example@gmail.com")

# Gmail account credentials
gmail_user="example@gmail.com"
gmail_password="YourPassword"  # Update this line with your generated app password

# Loop through recipients and send emails
for recipient in "${recipients[@]}"; do
    echo -e "Subject: $subject\n\n$content" | msmtp --from="$gmail_user" --host=smtp.gmail.com --port=587 --auth=on --tls=on --tls-starttls=on --user="$gmail_user" --passwordeval="echo $gmail_password" "$recipient"
done

echo "Daily reminder email script completed."
