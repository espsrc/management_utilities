# Disk Usage Report Script

This script generates a report of disk usage on a Linux system. It reports the total size of the root directory `/`, excluding the `/home` and `/mnt` directories, and the size of each user's home directory.

## Usage

To run this script with sudo and supply the max-depth parameter, use a command like this:

```bash
sudo bash home_disk_usage.sh 2
```
Replace `2` with your desired max-depth. If you don’t supply a max-depth parameter, the script will use a default depth of `0`.

## Output
The script writes its output to a file named `disk_usage_report.txt`. Each time the script is run, it adds a new report to the top of this file, separated by a line of `####`.

The report includes:

- The date it was generated
- The total disk usage for `/` (excluding `/home` and `/mnt`).
- The disk usage for each user’s home directory, up to the specified max-depth (default 0)

## Example output

```
Report generated on: Tue Oct 24 09:35:10 UTC 2023
Total disk usage for / excluding /home and /mnt:
11G	/

Disk usage for each user's home directory:
30G   /home/user1
22G   /home/user2
13G   /home/user3
5.5G  /home/user4
3.8G  /home/user5
765M  /home/user6
```

