#!/bin/bash

# Function to install NodeJS and NPM

install_node() {
	echo "Installing NodeJS and NPM..."
	sudo apt update
	sudo apt install -y nodejs npm
}

# Function to download and setup the NodeJS application

setup_node_app() {
	local app_url="https://node-envvars-artifact.s3.eu-west-2.amazonaws.com/bootcamp-node-envvars-project-1.0.0.tgz"
	local app_dir="bootcamp-node-envvars-project"

	# Download the artifact
	echo "Downloading the NodeJS application..."
	wget "$app_url" -0 app.tar.gz

	# Unzip the downloaded file
	echo "Unzipping the application..."
	tar -xzf app.tar.gz
	rm app.tar.gz

	# Set environment variables
	echo "Seting the environment variables"
	export APP_ENV="dev"
	export DB_USER="myuser"
	export DB_PWD="mysecret"

	# Change into the unzipped directory
	echo "Changing into the application directory..."
	cd "$app_dir"

	# Install dependencies
	echo "Installing dependencies..."
	npm install

	# Run the NodeJS application in the background
	echo "Starting the NodeJS application..."
	node server.js > /dev/null 2>&1 &
	app_pid=$!
	echo "NodeJS application started with PID: $app_pid."

	# Check if the application is running
	echo "Checking application status..."
	sleep 3
	if [ ps -p $app_pid > /dev/null ]; then
		echo "Application is running."

		#Get the application listening port
		app_port=$(netstat -tlnp | grep $app_pid/node | awk '{print $4}' | awk -F ":" '{print $NF}')
		echo "Applucation is listening on port: $app_port"
	else
		echo "Failed to start the application."
	fi
}

# Check if NodeJS and NPM are already installed

node_version=$(node -v 2>/dev/null)
npm_version=$(npm -v 2>/dev/null)

if [ -z $node_version || -z $npm_version ]; then
	install_node
fi

# Print installed versions
echo "NodeJS version: $node_version"
echo "NPM version: $npm_version"

# Setup and start the NodeJS application
setup_node_app
