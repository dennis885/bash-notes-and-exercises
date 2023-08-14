#!/bin/bash

#prompt the user for a filename

read -p "Enter a filename: " filename

#check if the file exists
if [ -e "$filename" ]; then
	echo "File exists!"

	# Prompt the user for a new name
	read -p "Enter a new name: " newname

	# Rename the file
	mv "$filename" "$newname"

	echo "File renamed successfully."
else
	echo "File does not exist."
fi
