#!/bin/bash
# server-stats.sh: A script to display basic server performance stats
# Checking Total CPU Usage
cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')
echo "Total CPU Usage: $cpu_usage%"
# To Check The Total Memory Used
memory=$(free -m | grep Mem)
total_mem=$(echo $memory | awk '{print $2}')
used_mem=$(echo $memory | awk '{print $3}')
free_mem=$(echo $memory | awk '{print $4}')
mem_percentage=$((used_mem * 100 / total_mem))
echo "Memory Usage: $used_mem MB used / $total_mem MB total ($mem_percentage%)"
# To Check the Total Disk Used
disk_usage=$(df -h / | awk 'NR==2')
total_disk=$(echo $disk_usage | awk '{print $2}')
used_disk=$(echo $disk_usage | awk '{print $3}')
free_disk=$(echo $disk_usage | awk '{print $4}')
disk_percentage=$(echo $disk_usage | awk '{print $5}')
echo "Disk Usage: $used_disk used / $total_disk total ($disk_percentage)"
echo "Top 5 Processes by CPU Usage:"
ps -eo pid,ppid,cmd,%cpu --sort=-%cpu | head -n 6

echo "Top 5 Processes by Memory Usage:"
ps -eo pid,ppid,cmd,%mem --sort=-%mem | head -n 6
# To Return the Top 5 Processes by CPU Usage
echo "Top 5 Processes by CPU Usage:"
ps -eo pid,ppid,cmd,%cpu --sort=-%cpu | head -n 6
echo ""

# To Return the Top 5 Processes by Memory Usage
echo "Top 5 Processes by Memory Usage:"
ps -eo pid,ppid,cmd,%mem --sort=-%mem | head -n 6
echo ""

# Stretch Goal: OS Version and Uptime
echo "OS Version:"
cat /etc/os-release | grep PRETTY_NAME
echo ""

echo "System Uptime:"
uptime -p
echo ""

echo "Logged-in Users:"
who
echo ""