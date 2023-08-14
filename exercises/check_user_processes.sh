#!/bin/bash

# Get the current user
current_user=$(whoami)

# Function to check user processes and sort by specified field
check_user_processes() {
	local sort_field=$1
	local num_processes=$2

	case $sort_field in
		cpu)
			sort_option="-k3rn"
			;;
		memory)
			sort_option="-k4rn"
			;;
		*)
			echo "Invalid sort field. Please specify 'cpu' or 'memory'."
			return 1
			;;
	esac

	ps aux | grep -w "$current_user" | grep -v grep | sort $sort_option | head -n $num_processes
}

# Ask for sort field
read -p "Sort processes by 'cpu' or 'memory': " sort_field

# Ask for number of processes
read -p "Enter the number of processes to print: " num_processes


# Execute the function with user input
check_user_processes "$sort_field" "$num_processes"
