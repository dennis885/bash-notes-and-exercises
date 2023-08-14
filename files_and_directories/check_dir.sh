#/bin/bash

echo "Enter the directory you would like to check to see if exists"
read dir

if [ -d "$dir"  ]
then
  echo "$dir exists."
else 
  echo "$dir does not exist."
fi


