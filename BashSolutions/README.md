# System Administration Scripts

This repository contains a set of Bash scripts for various system administration tasks. Below is an overview of each script and its usage.

## 1. User Management Script

### Description

This script automates the creation of multiple users on a Unix-like system with specified security configurations.

### Usage

1. Modify the `usernames` array to include desired usernames.
2. Set the `initial_password` variable for a common initial password.

### Execution

Run the script with a Bash interpreter:

```bash
./user_creation_script.sh
Actions
Creates users, assigns initial passwords, and enforces first login password change.
Sets account expiry for all users to December 14th, 2024.
Note:

Run with elevated privileges (e.g., sudo).
Adjust script variables for specific usernames or passwords.
2. Root Partition Space Monitoring Script
Description
Monitors the remaining space on the root partition and triggers email and SMS alerts to the system administrator if the used space exceeds 20%.

Usage
Ensure the mail command is installed and configured for sending emails.
Replace the sms_alert function with a method for sending SMS alerts (e.g., using a third-party service).
Execution
Run the script as a cron job to periodically check the root partition space:

bash
Copy code
*/5 * * * * /path/to/root_partition_monitor.sh
Actions
Retrieves the root partition usage percentage.
Compares it with the specified threshold (20%).
Sends an email alert if the threshold is exceeded.
Calls the sms_alert function for sending SMS alerts (replace with actual implementation).
Note:

Adjust the admin@example.com email address to the actual address of the system administrator.
3. System Resources Usage Script
Description
Checks system resource usage and highlights the process consuming the most CPU and memory upon execution.

Usage
Run the script to obtain information on the processes with the highest CPU and memory usage.

Execution
Execute the script periodically using a cron job for regular monitoring.

Actions
Retrieves the process with the highest CPU usage.
Retrieves the process with the highest memory usage.
Displays the system resource usage with highlighted processes.
Appends the results to a log file (/var/log/system_resource_usage.log).
4. Daily Backup Script
Description
Automates the daily backup of user home directories stored in /home. It compresses each user's directory and sends the backups to a locally hosted NAS for storage.

Usage
Set the backup_dir variable to the desired destination for backups.
Set the source_dir variable to the directory containing user home directories.

Execution
Run the script daily using a cron job:

bash
Copy code
0 1 * * * /path/to/daily_backup_script.sh
Actions
Creates a timestamp for each backup.
Loops through user home directories and creates a zip archive for each.
Sends the backups to a locally hosted NAS using rsync.
Note:

Adjust the username@nas_address in the rsync command based on your NAS configuration.
perl
Copy code

This revised version should be clearer and more accurate for use in your README.md file.



```
