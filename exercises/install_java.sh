#!/bin/bash

# Install Java

install_java() {
	sudo apt update
	sudo apt install -y default-jdk
}

# Check Java version

check_java_version() {
	java_version=$(java -version 2>&1 | awk -F '"' '/version/ {print $2}')

	if [ -n "$java_version" ]; then
		echo "Java is installed. Version: $java_version"
		if [ "$java_version" < "11" ]; then
			echo "Installed Java version is older than 11."
		else
			echo "Installed Java version is 11 or higher. Installation successful"
		fi
	else
		echo "Java is not installed."
	fi
}

# Execute the functions
install_java
check_java_version
