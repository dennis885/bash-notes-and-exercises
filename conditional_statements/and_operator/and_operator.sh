#! /bin/bash

age=10

if [ "$age" -gt 10 -a "$age" -lt 40 ]
then
  echo "Age is greater than 10 and less than 40."
else 
  echo "Age is less than 10 or greater than 40."
fi
