#!/bin/bash

# Check if script is run with sudo
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

# Set depth parameter to 0 if not supplied
depth=${1:-0}

# Output file
outfile="disk_usage_report.txt"
tempfile="temp.txt"

# Write separator to temporary file
echo "##########################" > "$tempfile"
echo "" >> "$tempfile"

# Write the current date to the temporary file
echo "Report generated on: $(date)" >> "$tempfile"

# Report the total size of / excluding /home and /mnt
echo "Total disk usage for / excluding /home and /mnt:" >> "$tempfile"
du -sh --exclude=/home --exclude=/mnt / >> "$tempfile"

# Add a newline for readability
echo "" >> "$tempfile"

# Report the size of each user's home directory
echo "Disk usage for each user's home directory:" >> "$tempfile"
for userdir in /home/*; do du -h --max-depth=$depth "$userdir"; done | awk '$1~/G|M/ {print}' | sort -hr >> "$tempfile"

# Add a newline for readability
echo "" >> "$tempfile"

# Concatenate old report to temporary file
cat "$outfile" >> "$tempfile"

# Replace old report with new report
mv "$tempfile" "$outfile"
