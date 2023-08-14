#!/bin/bash

echo "Enter 1st string"
read st1

echo "Read 2nd string"
read st2

if [ "$st1" == "$st2" ]
then
  echo "strings match"
else 
  echo "strings do not match"
fi


