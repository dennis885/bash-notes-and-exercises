#!/bin/bash

#Function to detect the Linux distribution
detect_distribution() {
	if [ -f "/etc/os-release" ]; then
		source /etc/os-release
		distribution="$NAME"
		version="$VERSION"
	elif [ -f "etc/lsb-release" ]; then
		source /etc/lsb-release
		distribution="$DISTRIB_ID"
		version="$DISTRIB_RELEASE"
	elif [ -f "/etc/debian_version" ]; then
		distribution="Debian"
		version=$(cat /etc/debian_version)
	else
		distribution="Unknown"
		version="Unkown"
	fi

	echo "Distribution: $distribution"
	echo "Version: $version"
}

# Detect the Linux distribution
detect_distribution
