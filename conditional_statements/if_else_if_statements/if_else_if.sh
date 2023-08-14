#! /bin/bash

count=10

if (( $count < 9 ))
then
  echo "The condition is true"
elif (( $count <= 9 ))
then
  echo "The condition is true as well"
else 
  echo "The condition is false"
fi
