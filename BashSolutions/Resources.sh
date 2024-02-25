#!/bin/bash

# Get the process with the highest CPU usage
cpu_process=$(ps -eo pid,%cpu,cmd --sort=-%cpu | awk 'NR==2{print $0}')

# Get the process with the highest memory usage
mem_process=$(ps -eo pid,%mem,cmd --sort=-%mem | awk 'NR==2{print $0}')

# Display system resource usage
echo "System Resource Usage:"
echo "----------------------"
echo "Process with Highest CPU Usage: $cpu_process"
echo "Process with Highest Memory Usage: $mem_process"
echo "----------------------"

# Save the output to a log file
echo "Timestamp: $(date)" >> /var/log/system_resource_usage.log
echo "----------------------" >> /var/log/system_resource_usage.log
echo "System Resource Usage:" >> /var/log/system_resource_usage.log
echo "Process with Highest CPU Usage: $cpu_process" >> /var/log/system_resource_usage.log
echo "Process with Highest Memory Usage: $mem_process" >> /var/log/system_resource_usage.log
echo "----------------------" >> /var/log/system_resource_usage.log

echo "System resource usage script completed."
