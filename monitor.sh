#!/bin/bash

#to install
# sudo apt install mailutils


LOGFILE="/var/log/server_health.log"
EMAIL="your@email.com"
SUBJECT="Server Health Report - $(hostname)"

{
    echo "===== Server Health Check: $(date) ====="
    echo
    echo "CPU Load:"
    uptime
    echo
    echo "Disk Usage:"
    df -h
    echo
    echo "Memory Usage:"
    free -m
    echo
    echo "Top 5 Processes:"
    ps aux --sort=-%cpu | head -6
    echo
    echo "Health check completed."
} >> "$LOGFILE"

# Send the email
mail -s "$SUBJECT" "$EMAIL" < "$LOGFILE"
