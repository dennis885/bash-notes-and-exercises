#!/bin/bash

# Function to determine the package manager used by the Linux distribution

determine_package_manager() {
	if [ -x "$(command -v apt)" ]; then
		package_manager="apt"
	elif [ -x "$(command -v yum)" ]; then
		package_manager="yum"
	elif [ -x "$(command -v dnf)" ]; then
		package_manager="dnf"
	elif [ -x "$(command -v zypper)" ]; then
		package_manager="zypper"
	elif [ -x "$(command -v pacman)" ]; then
		package_manager="pacman"
	else
		package_manager="Unknown"
	fi

	echo "Package Manager: $package_manager"
}

#Determine the package manager
determine_package_manager

