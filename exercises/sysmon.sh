#!/bin/bash

# Function to retrieve CPU usage percentage
get_cpu_usage() {
	cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print $2}')
	echo "CPU Usage: $cpu_usage%"
}

# Function to retrieve memory usage
get_memory_usage() {
	memory_usage=$(free -m | awk '/Mem/ {printf "Used: %sMB (%.2f%%) / Total: %sMB\n, $3, $3/$2*100, $2}')
	echo "Memory Usage: $memory_usage"
}

# Function to retrieve disk space usage
get_disk_usage() {
	disk_usage=$(df -h | awk '$NF == "/" {printf "Used: %s / Total: %s\n", $3, $2}')
	echo "Disk Usage: $disk_usage"
}

# Function ot retrieve network statistics
get_network_stats() {
	rx_bytes=$(cat /sys/class/net/$(ip route show default | awk '/default/ {print $5}')/statistics/rx_bytes)
	tx_bytes=$(cat /sys/class/net/$(ip route show default | awk '/default/ {print $5}')/statistics/tx_bytes)
	echo "Network Stastics:"
	echo "  Recieved: $rx_bytes bytes"
	echo "  Transmitted: $tx_bytes bytes"
}

# Main menu
while true; do
	clear
	echo "System Monitoring"
	echo "-----------------"
	echo "1. CPU Usage"
	echo "2. Memory Usage"
	echo "3. Disk Usage"
	echo "4. Network Statistics"
	echo "5. Exit"
	echo
	read -p "Enter your choice (1-5): " choice

	case $choice in
		1) get_cpu_usage
			read -p "Press Enter to continue..."
			;;
		2)get_memory_usage
                        read -p "Press Enter to continue..."
                        ;;
		3)get_disk_usage
                        read -p "Press Enter to continue..."
                        ;;
		4)get_network_stats
                        read -p "Press Enter to continue..."
                        ;;
		5)
			break
			;;
		*)
			echo "Invalid choice. Please try again."
			read -p "Press Enter to contionue..."
			;;
	esac
done

